Pod::Spec.new do |s|
  s.name               =  'MagnetMaxCore'
  s.version            =  '2.5.1'
  s.license            =  { :type => 'Apache 2.0' }
  s.summary            =  'The core of Magnet Max.'
  s.homepage           =  'https://www.magnet.com/magnet-max/'
  s.author             =  { 'Magnet Systems, Inc.' => 'info@magnet.com' }
  # s.source             =  { :git => 'https://github.com/magnetsystems/max-ios.git', :tag => "tag-release-#{s.version}" }
  s.source             =  { :git => 'https://github.com/magnetsystems/max-ios.git', :branch => "develop" }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'MagnetMax/Core/**/*.{swift,h,m}',
                   'MagnetMax/Core/Internal/**/*.{swift,h,m}'
  s.public_header_files = 'MagnetMax/Core/*.h'
  s.resources    = 'MagnetMax/Core/CoreData/MagnetMax.xcdatamodeld'

  # s.resource       =  'Bundles/MagnetMaxCore.bundle'
  s.frameworks     =  'Foundation', 'UIKit', 'CFNetwork' , 'Security', 'CoreData', 'SystemConfiguration'
  s.xcconfig       =  { 'OTHER_LDFLAGS' => '-ObjC -all_load', 'ENABLE_BITCODE'=>'NO' }

  # s.dependency 'AFNetworking/NSURLConnection', '~> 2.0'
  s.dependency 'AFNetworking/NSURLConnection', '2.6.1'
  # s.dependency 'AFNetworking/NSURLSession', '~> 2.0'
  s.dependency 'AFNetworking/NSURLSession', '2.6.1'
  s.dependency 'CocoaLumberjack', '~> 2.2'
  # s.dependency 'Mantle', '~> 2.0'
  # s.dependency 'Mantle', '2.0.6'
  s.dependency 'Mantle', '~> 3.0'
  s.dependency 'AFOAuth2Manager', '2.2.1'

  s.libraries      = "icucore"

end
