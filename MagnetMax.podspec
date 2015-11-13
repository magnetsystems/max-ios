Pod::Spec.new do |s|
  s.name               = 'MagnetMax'
  s.version            =  '2.1.0'
  s.license            =  { :type => 'Apache 2.0' }
  s.summary            =  'The first fully realized open mobile architecture created specifically for developing and deploying mobile-first enterprise applications.'
  s.homepage           =  'https://www.magnet.com/magnet-max/'
  s.author             =  { 'Magnet Systems, Inc.' => 'info@magnet.com' }
  # s.source             =  { :git => 'https://github.com/magnetsystems/max-ios.git', :tag => "tag-release-#{s.version}" }
  s.source             =  { :git => 'https://github.com/magnetsystems/max-ios.git', :branch => "develop" }

  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'MagnetMax/*.{swift,h,m}'
  s.public_header_files = 'MagnetMax/*.h'

  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2', 'ENABLE_BITCODE'=>'NO', 'FRAMEWORK_SEARCH_PATHS' => '$(inherited) $(SRCROOT)' }

  s.dependency 'MMX', '~> 2.1'
  s.dependency 'MagnetMaxCore', '~> 2.1'

  s.ios.deployment_target = '8.0'
end
