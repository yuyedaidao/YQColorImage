#
# Be sure to run `pod lib lint YQColorImage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YQColorImage'
  s.version          = '0.2.2'
  s.summary          = 'YQColorImage.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '畅媒未来版公共模块-YQColorImage'

  s.homepage         = 'https://github.com/yuyedaidao/YQColorImage'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wyqpadding@gmail.com' => 'wyqpadding@gmail.com' }
  s.source           = { :git => 'https://github.com/yuyedaidao/YQColorImage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_versions = '5.0'
  s.source_files = 'YQColorImage/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  # s.dependency 'Moya/RxSwift', '~> 12.0'
  # s.dependency 'SnapKit', '~> 4.0.0'
  # s.dependency 'RxCoreData', '~> 0.5.1'
  # s.dependency 'RxDataSources', '~> 3.0'
end
