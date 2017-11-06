#
# Be sure to run `pod lib lint ACLogstasher.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ACLogstasher'
  s.version          = '0.2.0'
  s.summary          = 'Send datas to an instance of Logstash'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Send default and custom datas to an instance of Logstash
Default datas : device model, iOS version, orientation, battery level, bundle version, app version, bundle ID, app name, language, region, timezone, UUID.
                       DESC

  s.homepage         = 'https://github.com/antoine20001/ACLogstasher'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'antoine20001' => 'antoine.cointepas@orange.fr' }
  s.source           = { :git => 'https://github.com/antoine20001/ACLogstasher.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ACLogstasher/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ACLogstasher' => ['ACLogstasher/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Alamofire'
end
