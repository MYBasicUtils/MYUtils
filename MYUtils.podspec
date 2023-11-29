Pod::Spec.new do |s|
  s.name             = 'MYUtils'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MYUtils.'

  s.description      = <<-DESC
    MYUtils
                       DESC

  s.homepage         = 'https://github.com/WenMingYan/MYUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WenMingYan' => 'wenmy@tuya.com' }
  s.source           = { :git => 'https://github.com/WenMingYan/MYUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MYUtils/Classes/**/*'
  
  s.prefix_header_contents = <<-EOS
  
  #import <CocoaLumberjack/CocoaLumberjack.h>
  
  #ifdef DEBUG
  static const DDLogLevel ddlogLevel = DDLogLevelVerbose;
  static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
  #else
  static const DDLogLevel ddlogLevel = DDLogLevelWarning;
  static const DDLogLevel ddLogLevel = DDLogLevelWarning;
  #endif
  
  EOS
  
  # s.resource_bundles = {
  #   'MYUtils' => ['MYUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'MBProgressHUD'
  s.dependency 'ReactiveObjC'
  s.dependency 'CocoaLumberjack'
  
end
