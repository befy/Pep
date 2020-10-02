#
# Be sure to run `pod lib lint Pep.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Pep'
  s.version          = '0.1.0'
  s.summary          = 'Pep a.k.a PepBar is a light-weight and easily customizable animated TabBar library.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'Pep has a different TabBar design system. It uses Child View Controllers as a Container. Without any TabBar inheritance, Pep is very fast, efficient to use and very easy to customize.'
                       DESC

  s.homepage         = 'https://github.com/befy/Pep'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'befy' => 'alper@tabak.app' }
  s.source           = { :git => 'https://github.com/befy/Pep.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alpertab'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/**/*.swift'
  s.platforms = {
      "ios": "12.0"
  }
  
  # s.resource_bundles = {
  #   'Pep' => ['Pep/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
