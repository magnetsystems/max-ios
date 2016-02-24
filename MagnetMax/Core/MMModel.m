/*
 * Copyright (c) 2015 Magnet Systems, Inc.
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License. You
 * may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <objc/runtime.h>
#import "MMModel.h"
#import "MMValueTransformer.h"
#import "MMUtilities.h"

// Used to cache the reflection performed in +propertyKeys.
static void *MMModelCachedPropertyKeysKey = &MMModelCachedPropertyKeysKey;

// Associated in +generateAndCachePropertyKeys with a set of all transitory
// property keys.
static void *MMModelCachedTransitoryPropertyKeysKey = &MMModelCachedTransitoryPropertyKeysKey;

// Associated in +generateAndCachePropertyKeys with a set of all permanent
// property keys.
static void *MMModelCachedPermanentPropertyKeysKey = &MMModelCachedPermanentPropertyKeysKey;

// Validates a value for an object and sets it if necessary.
//
// obj         - The object for which the value is being validated. This value
//               must not be nil.
// key         - The name of one of `obj`s properties. This value must not be
//               nil.
// value       - The new value for the property identified by `key`.
// forceUpdate - If set to `YES`, the value is being updated even if validating
//               it did not change it.
// error       - If not NULL, this may be set to any error that occurs during
//               validation
//
// Returns YES if `value` could be validated and set, or NO if an error
// occurred.
static BOOL MMValidateAndSetValue(id obj, NSString *key, id value, BOOL forceUpdate, NSError **error) {
    // Mark this as being autoreleased, because validateValue may return
    // a new object to be stored in this variable (and we don't want ARC to
    // double-free or leak the old or new values).
    __autoreleasing id validatedValue = value;
    
    @try {
        if (![obj validateValue:&validatedValue forKey:key error:error]) return NO;
        
        if (forceUpdate || value != validatedValue) {
            [obj setValue:validatedValue forKey:key];
        }
        
        return YES;
    } @catch (NSException *ex) {
        NSLog(@"*** Caught exception setting key \"%@\" : %@", key, ex);
        
        // Fail fast in Debug builds.
#if DEBUG
        @throw ex;
#else
        if (error != NULL) {
//            *error = [NSError mtl_modelErrorWithException:ex];
        }
        
        return NO;
#endif
    }
}

@interface MMModel()

+ (NSValueTransformer *)transformerForClass:(Class)clazz
                                        key:(NSString *)key;

+ (Class)classFromPropertyType:(NSString *)propertyType;

+ (NSString *)propertyTypeAttributeForKey:(NSString *)key;


// Inspects all properties of returned by +propertyKeys using
// +storageBehaviorForPropertyWithKey and caches the results.
+ (void)generateAndCacheStorageBehaviors;

// Returns a set of all property keys for which
// +storageBehaviorForPropertyWithKey returned MTLPropertyStorageTransitory.
+ (NSSet *)transitoryPropertyKeys;

// Returns a set of all property keys for which
// +storageBehaviorForPropertyWithKey returned MTLPropertyStoragePermanent.
+ (NSSet *)permanentPropertyKeys;

// Enumerates all properties of the receiver's class hierarchy, starting at the
// receiver, and continuing up until (but not including) MTLModel.
//
// The given block will be invoked multiple times for any properties declared on
// multiple classes in the hierarchy.
+ (void)enumeratePropertiesUsingBlock:(void (^)(objc_property_t property, BOOL *stop))block;


@end

@implementation MMModel

#pragma mark - MTLModel

// Removes all nil objects from the dictionary
//- (NSDictionary *)dictionaryValue {
//    NSMutableDictionary *modifiedDictionaryValue = [[super dictionaryValue] mutableCopy];
//
//    for (NSString *originalKey in [super dictionaryValue]) {
//        if ([self valueForKey:originalKey] == nil) {
//            [modifiedDictionaryValue removeObjectForKey:originalKey];
//        }
//    }
//
//    return [modifiedDictionaryValue copy];
//}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)attributeMappings {
//    NSDictionary *dict = [NSDictionary mtl_identityPropertyMapWithModel:self];
//    return dict;
    return @{};
}

+ (NSDictionary *)listAttributeTypes {
    return nil;
}

+ (NSDictionary *)mapAttributeTypes {
    return nil;
}

+ (NSDictionary *)enumAttributeTypes {
    return nil;
}

+ (NSArray *)charAttributes {
    return nil;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [self attributeMappings];
}

//+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
//    NSString *magnetType = JSONDictionary[@"magnet-type"];
//    if (magnetType != nil) {
//        NSString *classString = [MMNodeMetaData metaDataWithMagnetTypeAsKeys][magnetType];
//        return NSClassFromString(classString);
//    }
//
//    //NSAssert(NO, @"No matching class for the JSON dictionary '%@'.", JSONDictionary);
//    NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:JSONDictionary];
//    [temp removeObjectForKey:@"magnet-type"];
//    JSONDictionary = [NSDictionary dictionaryWithDictionary:temp];
//    return self;
//}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    NSString *typeAttribute = [self propertyTypeAttributeForKey:key];
    NSString *propertyType = [typeAttribute substringFromIndex:1];
    const char *rawPropertyType = [propertyType UTF8String];

    if (strcmp(rawPropertyType, @encode(char)) == 0) {
        if (![[self charAttributes] containsObject:key]) {
            return [MMValueTransformer booleanTransformer];
        }
    } else if (strcmp(rawPropertyType, @encode(unichar)) == 0) {
        return [MMValueTransformer unicharTransformer];
    } else if (strcmp(rawPropertyType, @encode(NSUInteger)) == 0) { // Enum case
        return [MMValueTransformer enumTransformerForContainerClass:[self enumAttributeTypes][key]];
    } else if ([typeAttribute hasPrefix:@"T@"]) {
        Class clazz = [self classFromPropertyType:typeAttribute];
        return [self transformerForClass:clazz key:key];
    }

    return nil;
}

#pragma mark - Private implementation

+ (NSValueTransformer *)transformerForClass:(Class)clazz
                                        key:(NSString *)key {
    if ([clazz isSubclassOfClass:[NSDate class]]) {
        return [MMValueTransformer dateTransformer];
    } else if ([clazz isSubclassOfClass:[NSURL class]]) {
        return [MMValueTransformer urlTransformer];
    } else if ([clazz isSubclassOfClass:[NSData class]]) {
        return [MMValueTransformer dataTransformer];
    } else if ([clazz isSubclassOfClass:[MMModel class]]) {
        return [MMValueTransformer resourceNodeTransformerForClass:clazz];
    } /* else if ([clazz isSubclassOfClass:[MMData class]]) {
        return [MMValueTransformer binaryDataTransformer];
    }*/ else if ([clazz isSubclassOfClass:[NSArray class]]) {
        MMServiceIOType type = [MMUtilities serviceTypeForClass:[self listAttributeTypes][key]];
        return [MMValueTransformer listTransformerForType:type clazz:[self listAttributeTypes][key]];
    } else if ([clazz isSubclassOfClass:[NSDictionary class]]) {
        MMServiceIOType type = [MMUtilities serviceTypeForClass:[self mapAttributeTypes][key]];
        return [MMValueTransformer mapTransformerForType:type clazz:[self mapAttributeTypes][key]];
    } else if ([clazz isSubclassOfClass:[NSDecimalNumber class]]) {
        return [MMValueTransformer bigDecimalTransformer];
    }
    return nil;
}

+ (Class)classFromPropertyType:(NSString *)propertyType {
    NSString * typeClassName = [propertyType substringWithRange:NSMakeRange(3, [propertyType length] - 4)];  //turns @"NSDate" into NSDate
    Class typeClass = NSClassFromString(typeClassName);
    return typeClass;
}

+ (NSString *)propertyTypeAttributeForKey:(NSString *)key {
    const char *keyAsChar = [key UTF8String];
    const char *propertyAttributesAsChar = property_getAttributes(class_getProperty([self class], keyAsChar));
    NSString *propertyAttributesString = [NSString stringWithUTF8String:propertyAttributesAsChar];
    NSArray *propertyAttributes = [propertyAttributesString componentsSeparatedByString:@","];
    NSString *propertyTypeAttribute = propertyAttributes[0];
    return propertyTypeAttribute;
}

#pragma mark Lifecycle

+ (void)generateAndCacheStorageBehaviors {
    NSMutableSet *transitoryKeys = [NSMutableSet set];
    NSMutableSet *permanentKeys = [NSMutableSet set];
    
    for (NSString *propertyKey in self.propertyKeys) {
        switch ([self storageBehaviorForPropertyWithKey:propertyKey]) {
            case MMPropertyStorageNone:
                break;
                
            case MMPropertyStorageTransitory:
                [transitoryKeys addObject:propertyKey];
                break;
                
            case MMPropertyStoragePermanent:
                [permanentKeys addObject:propertyKey];
                break;
        }
    }
    
    // It doesn't really matter if we replace another thread's work, since we do
    // it atomically and the result should be the same.
    objc_setAssociatedObject(self, MMModelCachedTransitoryPropertyKeysKey, transitoryKeys, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, MMModelCachedPermanentPropertyKeysKey, permanentKeys, OBJC_ASSOCIATION_COPY);
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    return [[self alloc] initWithDictionary:dictionary error:error];
}

- (instancetype)init {
    // Nothing special by default, but we have a declaration in the header.
    return [super init];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    self = [self init];
    if (self == nil) return nil;
    
    for (NSString *key in dictionary) {
        // Mark this as being autoreleased, because validateValue may return
        // a new object to be stored in this variable (and we don't want ARC to
        // double-free or leak the old or new values).
        __autoreleasing id value = [dictionary objectForKey:key];
        
        if ([value isEqual:NSNull.null]) value = nil;
        
        BOOL success = MMValidateAndSetValue(self, key, value, YES, error);
        if (!success) return nil;
    }
    
    return self;
}

#pragma mark Reflection

+ (void)enumeratePropertiesUsingBlock:(void (^)(objc_property_t property, BOOL *stop))block {
    Class cls = self;
    BOOL stop = NO;
    
    while (!stop && ![cls isEqual:MMModel.class]) {
        unsigned count = 0;
        objc_property_t *properties = class_copyPropertyList(cls, &count);
        
        cls = cls.superclass;
        if (properties == NULL) continue;
        
//        @onExit {
//            free(properties);
//        };
        
        for (unsigned i = 0; i < count; i++) {
            block(properties[i], &stop);
            if (stop) break;
        }
        
        free(properties);
    }
}

+ (NSSet *)propertyKeys {
    NSSet *cachedKeys = objc_getAssociatedObject(self, MMModelCachedPropertyKeysKey);
    if (cachedKeys != nil) return cachedKeys;
    
    NSMutableSet *keys = [NSMutableSet set];
    
    [self enumeratePropertiesUsingBlock:^(objc_property_t property, BOOL *stop) {
        NSString *key = @(property_getName(property));
        
        if ([self storageBehaviorForPropertyWithKey:key] != MMPropertyStorageNone) {
            [keys addObject:key];
        }
    }];
    
    // It doesn't really matter if we replace another thread's work, since we do
    // it atomically and the result should be the same.
    objc_setAssociatedObject(self, MMModelCachedPropertyKeysKey, keys, OBJC_ASSOCIATION_COPY);
    
    return keys;
}

+ (NSSet *)transitoryPropertyKeys {
    NSSet *transitoryPropertyKeys = objc_getAssociatedObject(self, MMModelCachedTransitoryPropertyKeysKey);
    
    if (transitoryPropertyKeys == nil) {
        [self generateAndCacheStorageBehaviors];
        transitoryPropertyKeys = objc_getAssociatedObject(self, MMModelCachedTransitoryPropertyKeysKey);
    }
    
    return transitoryPropertyKeys;
}

+ (NSSet *)permanentPropertyKeys {
    NSSet *permanentPropertyKeys = objc_getAssociatedObject(self, MMModelCachedPermanentPropertyKeysKey);
    
    if (permanentPropertyKeys == nil) {
        [self generateAndCacheStorageBehaviors];
        permanentPropertyKeys = objc_getAssociatedObject(self, MMModelCachedPermanentPropertyKeysKey);
    }
    
    return permanentPropertyKeys;
}

- (NSDictionary *)dictionaryValue {
    NSSet *keys = [self.class.transitoryPropertyKeys setByAddingObjectsFromSet:self.class.permanentPropertyKeys];
    return [self dictionaryWithValuesForKeys:keys.allObjects];
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionaryRepresentation = [NSMutableDictionary dictionaryWithDictionary:self.dictionaryValue];
    [self.dictionaryValue enumerateKeysAndObjectsUsingBlock:^(NSString *propertyKey, id value, BOOL *stop) {
        NSValueTransformer *transformer = [self.class JSONTransformerForKey:propertyKey];
        if ([transformer.class allowsReverseTransformation]) {
            // Map NSNull -> nil for the transformer, and then back for the
            // dictionaryValue we're going to insert into.
            if ([value isEqual:NSNull.null]) value = nil;
            
            value = [transformer reverseTransformedValue:value] ?: NSNull.null;
        }
        [dictionaryRepresentation setValue:value forKeyPath:propertyKey];
    }];
    
    return dictionaryRepresentation;
}

+ (MMPropertyStorage)storageBehaviorForPropertyWithKey:(NSString *)propertyKey {
    objc_property_t property = class_getProperty(self.class, propertyKey.UTF8String);
    
    if (property == NULL) return MMPropertyStorageNone;
    
    mtl_propertyAttributes *attributes = mtl_copyPropertyAttributes(property);
//    @onExit {
//        free(attributes);
//    };
    
    BOOL hasGetter = [self instancesRespondToSelector:attributes->getter];
    BOOL hasSetter = [self instancesRespondToSelector:attributes->setter];
    if (!attributes->dynamic && attributes->ivar == NULL && !hasGetter && !hasSetter) {
        free(attributes);
        return MMPropertyStorageNone;
    } else if (attributes->readonly && attributes->ivar == NULL) {
        if ([self isEqual:MMModel.class]) {
            free(attributes);
            return MMPropertyStorageNone;
        } else {
            // Check superclass in case the subclass redeclares a property that
            // falls through
            free(attributes);
            return [self.superclass storageBehaviorForPropertyWithKey:propertyKey];
        }
    } else {
        free(attributes);
        return MMPropertyStoragePermanent;
    }
}

#pragma mark NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    MMModel *copy = [[self.class allocWithZone:zone] init];
    [copy setValuesForKeysWithDictionary:self.dictionaryValue];
    return copy;
}

#pragma mark NSObject

- (NSString *)description {
    NSDictionary *permanentProperties = [self dictionaryWithValuesForKeys:self.class.permanentPropertyKeys.allObjects];
    
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, permanentProperties];
}

- (NSUInteger)hash {
    NSUInteger value = 0;
    
    for (NSString *key in self.class.permanentPropertyKeys) {
        value ^= [[self valueForKey:key] hash];
    }
    
    return value;
}

- (BOOL)isEqual:(MMModel *)model {
    if (self == model) return YES;
    if (![model isMemberOfClass:self.class]) return NO;
    
    for (NSString *key in self.class.permanentPropertyKeys) {
        id selfValue = [self valueForKey:key];
        id modelValue = [model valueForKey:key];
        
        BOOL valuesEqual = ((selfValue == nil && modelValue == nil) || [selfValue isEqual:modelValue]);
        if (!valuesEqual) return NO;
    }
    
    return YES;
}

@end

//
//  EXTRuntimeExtensions.m
//  extobjc
//
//  Created by Justin Spahr-Summers on 2011-03-05.
//  Copyright (C) 2012 Justin Spahr-Summers.
//  Released under the MIT license.
//

//#import "EXTRuntimeExtensions.h"

#import <Foundation/Foundation.h>

mtl_propertyAttributes *mtl_copyPropertyAttributes (objc_property_t property) {
    const char * const attrString = property_getAttributes(property);
    if (!attrString) {
        fprintf(stderr, "ERROR: Could not get attribute string from property %s\n", property_getName(property));
        return NULL;
    }
    
    if (attrString[0] != 'T') {
        fprintf(stderr, "ERROR: Expected attribute string \"%s\" for property %s to start with 'T'\n", attrString, property_getName(property));
        return NULL;
    }
    
    const char *typeString = attrString + 1;
    const char *next = NSGetSizeAndAlignment(typeString, NULL, NULL);
    if (!next) {
        fprintf(stderr, "ERROR: Could not read past type in attribute string \"%s\" for property %s\n", attrString, property_getName(property));
        return NULL;
    }
    
    size_t typeLength = next - typeString;
    if (!typeLength) {
        fprintf(stderr, "ERROR: Invalid type in attribute string \"%s\" for property %s\n", attrString, property_getName(property));
        return NULL;
    }
    
    // allocate enough space for the structure and the type string (plus a NUL)
    mtl_propertyAttributes *attributes = calloc(1, sizeof(mtl_propertyAttributes) + typeLength + 1);
    if (!attributes) {
        fprintf(stderr, "ERROR: Could not allocate mtl_propertyAttributes structure for attribute string \"%s\" for property %s\n", attrString, property_getName(property));
        return NULL;
    }
    
    // copy the type string
    strncpy(attributes->type, typeString, typeLength);
    attributes->type[typeLength] = '\0';
    
    // if this is an object type, and immediately followed by a quoted string...
    if (typeString[0] == *(@encode(id)) && typeString[1] == '"') {
        // we should be able to extract a class name
        const char *className = typeString + 2;
        next = strchr(className, '"');
        
        if (!next) {
            fprintf(stderr, "ERROR: Could not read class name in attribute string \"%s\" for property %s\n", attrString, property_getName(property));
            return NULL;
        }
        
        if (className != next) {
            size_t classNameLength = next - className;
            char trimmedName[classNameLength + 1];
            
            strncpy(trimmedName, className, classNameLength);
            trimmedName[classNameLength] = '\0';
            
            // attempt to look up the class in the runtime
            attributes->objectClass = objc_getClass(trimmedName);
        }
    }
    
    if (*next != '\0') {
        // skip past any junk before the first flag
        next = strchr(next, ',');
    }
    
    while (next && *next == ',') {
        char flag = next[1];
        next += 2;
        
        switch (flag) {
            case '\0':
                break;
                
            case 'R':
                attributes->readonly = YES;
                break;
                
            case 'C':
                attributes->memoryManagementPolicy = mtl_propertyMemoryManagementPolicyCopy;
                break;
                
            case '&':
                attributes->memoryManagementPolicy = mtl_propertyMemoryManagementPolicyRetain;
                break;
                
            case 'N':
                attributes->nonatomic = YES;
                break;
                
            case 'G':
            case 'S':
            {
                const char *nextFlag = strchr(next, ',');
                SEL name = NULL;
                
                if (!nextFlag) {
                    // assume that the rest of the string is the selector
                    const char *selectorString = next;
                    next = "";
                    
                    name = sel_registerName(selectorString);
                } else {
                    size_t selectorLength = nextFlag - next;
                    if (!selectorLength) {
                        fprintf(stderr, "ERROR: Found zero length selector name in attribute string \"%s\" for property %s\n", attrString, property_getName(property));
                        goto errorOut;
                    }
                    
                    char selectorString[selectorLength + 1];
                    
                    strncpy(selectorString, next, selectorLength);
                    selectorString[selectorLength] = '\0';
                    
                    name = sel_registerName(selectorString);
                    next = nextFlag;
                }
                
                if (flag == 'G')
                    attributes->getter = name;
                else
                    attributes->setter = name;
            }
                
                break;
                
            case 'D':
                attributes->dynamic = YES;
                attributes->ivar = NULL;
                break;
                
            case 'V':
                // assume that the rest of the string (if present) is the ivar name
                if (*next == '\0') {
                    // if there's nothing there, let's assume this is dynamic
                    attributes->ivar = NULL;
                } else {
                    attributes->ivar = next;
                    next = "";
                }
                
                break;
                
            case 'W':
                attributes->weak = YES;
                break;
                
            case 'P':
                attributes->canBeCollected = YES;
                break;
                
            case 't':
                fprintf(stderr, "ERROR: Old-style type encoding is unsupported in attribute string \"%s\" for property %s\n", attrString, property_getName(property));
                
                // skip over this type encoding
                while (*next != ',' && *next != '\0')
                    ++next;
                
                break;
                
            default:
                fprintf(stderr, "ERROR: Unrecognized attribute string flag '%c' in attribute string \"%s\" for property %s\n", flag, attrString, property_getName(property));
        }
    }
    
    if (next && *next != '\0') {
        fprintf(stderr, "Warning: Unparsed data \"%s\" in attribute string \"%s\" for property %s\n", next, attrString, property_getName(property));
    }
    
    if (!attributes->getter) {
        // use the property name as the getter by default
        attributes->getter = sel_registerName(property_getName(property));
    }
    
    if (!attributes->setter) {
        const char *propertyName = property_getName(property);
        size_t propertyNameLength = strlen(propertyName);
        
        // we want to transform the name to setProperty: style
        size_t setterLength = propertyNameLength + 4;
        
        char setterName[setterLength + 1];
        strncpy(setterName, "set", 3);
        strncpy(setterName + 3, propertyName, propertyNameLength);
        
        // capitalize property name for the setter
        setterName[3] = (char)toupper(setterName[3]);
        
        setterName[setterLength - 1] = ':';
        setterName[setterLength] = '\0';
        
        attributes->setter = sel_registerName(setterName);
    }
    
    return attributes;
    
errorOut:
    free(attributes);
    return NULL;
}
