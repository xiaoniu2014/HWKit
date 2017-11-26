#
# Be sure to run `pod lib lint HWKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'HWKit'
s.version          = '0.1.0'
s.summary          = '常用ObjC工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
TODO: Add long description of the pod here.
DESC

s.homepage         = 'https://github.com/xiaoniu2014'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'hongw' => 'hongwei@ctrip.com' }
s.source           = { :git => 'https://github.com/xiaoniu2014/HWKit.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/hongw_666'
# s.requires_arc = true
s.ios.deployment_target = '8.0'

# s.source_files = 'HWKit/Classes/**/*'
s.subspec 'HWKit' do |hk|
    hk.source_files = 'HWKit/Classes/**/*'
end

s.subspec 'JMCRouter' do |jr|
    jr.source_files = 'HWKit/Classes/JMCRouter/**/*'
end

s.subspec 'UIFoundation' do |f|
    f.source_files = 'HWKit/Classes/UIFoundation/**/*'
    # f.dependency 'SDWebImage'
end

s.subspec 'UIKit' do |k|
    k.source_files = 'HWKit/Classes/UIKit/**/*'
end

# s.framework = 'SystemConfiguration'

# s.resource_bundles = {
#   'HWKit' => ['HWKit/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
end

