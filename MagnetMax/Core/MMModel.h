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

#import <Foundation/Foundation.h>
//@import Mantle;

/// Defines a property's storage behavior, which affects how it will be copied,
/// compared, and persisted.
///
/// MTLPropertyStorageNone       - This property is not included in -description,
///                                -hash, or anything else.
/// MTLPropertyStorageTransitory - This property is included in one-off
///                                operations like -copy and -dictionaryValue but
///                                does not affect -isEqual: or -hash.
///                                It may disappear at any time.
/// MTLPropertyStoragePermanent  - The property is included in serialization
///                                (like `NSCoding`) and equality, since it can
///                                be expected to stick around.
typedef enum : NSUInteger {
    MMPropertyStorageNone,
    MMPropertyStorageTransitory,
    MMPropertyStoragePermanent,
} MMPropertyStorage;

/// This protocol defines the minimal interface that classes need to implement to
/// interact with Mantle adapters.
///
/// It is intended for scenarios where inheriting from MTLModel is not feasible.
/// However, clients are encouraged to subclass the MTLModel class if they can.
///
/// Clients that wish to implement their own adapters should target classes
/// conforming to this protocol rather than subclasses of MTLModel to ensure
/// maximum compatibility.
@protocol MTLModel <NSObject, NSCopying>

/// Initializes a new instance of the receiver using key-value coding, setting
/// the keys and values in the given dictionary.
///
/// dictionaryValue - Property keys and values to set on the instance. Any NSNull
///                   values will be converted to nil before being used. KVC
///                   validation methods will automatically be invoked for all of
///                   the properties given.
/// error           - If not NULL, this may be set to any error that occurs
///                   (like a KVC validation error).
///
/// Returns an initialized model object, or nil if validation failed.
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error;

/// A dictionary representing the properties of the receiver.
///
/// Combines the values corresponding to all +propertyKeys into a dictionary,
/// with any nil values represented by NSNull.
///
/// This property must never be nil.
@property (nonatomic, copy, readonly) NSDictionary *dictionaryValue;

/// Initializes the receiver using key-value coding, setting the keys and values
/// in the given dictionary.
///
/// Subclass implementations may override this method, calling the super
/// implementation, in order to perform further processing and initialization
/// after deserialization.
///
/// dictionaryValue - Property keys and values to set on the receiver. Any NSNull
///                   values will be converted to nil before being used. KVC
///                   validation methods will automatically be invoked for all of
///                   the properties given. If nil, this method is equivalent to
///                   -init.
/// error           - If not NULL, this may be set to any error that occurs
///                   (like a KVC validation error).
///
/// Returns an initialized model object, or nil if validation failed.
- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error;

/// Merges the value of the given key on the receiver with the value of the same
/// key from the given model object, giving precedence to the other model object.
- (void)mergeValueForKey:(NSString *)key fromModel:(id<MTLModel>)model;

/// Returns the keys for all @property declarations, except for `readonly`
/// properties without ivars, or properties on MTLModel itself.
+ (NSSet *)propertyKeys;

/// Validates the model.
///
/// error - If not NULL, this may be set to any error that occurs during
///         validation
///
/// Returns YES if the model is valid, or NO if the validation failed.
- (BOOL)validate:(NSError **)error;

@end

/// An abstract base class for model objects, using reflection to provide
/// sensible default behaviors.
///
/// The default implementations of <NSCopying>, -hash, and -isEqual: make use of
/// the +propertyKeys method.
@interface MMModel : NSObject <MTLModel>

/** The node type. */

+ (NSDictionary *)attributeMappings;

+ (NSDictionary *)listAttributeTypes;

+ (NSDictionary *)mapAttributeTypes;

+ (NSDictionary *)enumAttributeTypes;

+ (NSArray *)charAttributes;

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key;

- (NSDictionary *)toDictionary;

/// A dictionary representing the properties of the receiver.
///
/// Combines the values corresponding to all +propertyKeys into a dictionary,
/// with any nil values represented by NSNull.
///
/// This property must never be nil.
@property (nonatomic, copy, readonly) NSDictionary *dictionaryValue;

@end

//
//  EXTRuntimeExtensions.h
//  extobjc
//
//  Created by Justin Spahr-Summers on 2011-03-05.
//  Copyright (C) 2012 Justin Spahr-Summers.
//  Released under the MIT license.
//

#import <objc/runtime.h>

/**
 * Describes the memory management policy of a property.
 */
typedef enum {
    /**
     * The value is assigned.
     */
    mtl_propertyMemoryManagementPolicyAssign = 0,
    
    /**
     * The value is retained.
     */
    mtl_propertyMemoryManagementPolicyRetain,
    
    /**
     * The value is copied.
     */
    mtl_propertyMemoryManagementPolicyCopy
} mtl_propertyMemoryManagementPolicy;

/**
 * Describes the attributes and type information of a property.
 */
typedef struct {
    /**
     * Whether this property was declared with the \c readonly attribute.
     */
    BOOL readonly;
    
    /**
     * Whether this property was declared with the \c nonatomic attribute.
     */
    BOOL nonatomic;
    
    /**
     * Whether the property is a weak reference.
     */
    BOOL weak;
    
    /**
     * Whether the property is eligible for garbage collection.
     */
    BOOL canBeCollected;
    
    /**
     * Whether this property is defined with \c \@dynamic.
     */
    BOOL dynamic;
    
    /**
     * The memory management policy for this property. This will always be
     * #mtl_propertyMemoryManagementPolicyAssign if #readonly is \c YES.
     */
    mtl_propertyMemoryManagementPolicy memoryManagementPolicy;
    
    /**
     * The selector for the getter of this property. This will reflect any
     * custom \c getter= attribute provided in the property declaration, or the
     * inferred getter name otherwise.
     */
    SEL getter;
    
    /**
     * The selector for the setter of this property. This will reflect any
     * custom \c setter= attribute provided in the property declaration, or the
     * inferred setter name otherwise.
     *
     * @note If #readonly is \c YES, this value will represent what the setter
     * \e would be, if the property were writable.
     */
    SEL setter;
    
    /**
     * The backing instance variable for this property, or \c NULL if \c
     * \c @synthesize was not used, and therefore no instance variable exists. This
     * would also be the case if the property is implemented dynamically.
     */
    const char *ivar;
    
    /**
     * If this property is defined as being an instance of a specific class,
     * this will be the class object representing it.
     *
     * This will be \c nil if the property was defined as type \c id, if the
     * property is not of an object type, or if the class could not be found at
     * runtime.
     */
    Class objectClass;
    
    /**
     * The type encoding for the value of this property. This is the type as it
     * would be returned by the \c \@encode() directive.
     */
    char type[];
} mtl_propertyAttributes;

/**
 * Returns a pointer to a structure containing information about \a property.
 * You must \c free() the returned pointer. Returns \c NULL if there is an error
 * obtaining information from \a property.
 */
mtl_propertyAttributes *mtl_copyPropertyAttributes (objc_property_t property);

