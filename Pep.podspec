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
  
end
