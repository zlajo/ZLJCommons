Pod::Spec.new do |s|
  s.name         = 'ZLJCommons'
  s.version      = '0.4.0'
  s.license      = { :type => 'MIT', :file => 'License.txt' }

  s.summary      = 'A collection of several simple helpers.'
  s.homepage     = 'https://github.com/zlajo/ZLJCommons'
  s.author       = { 'Johannes Zlattinger' => 'johannes@zlattinger.net' }

  s.source       = { :git => 'https://github.com/zlajo/ZLJCommons.git', :tag => 'v0.4.0'}
  s.source_files = 'ZLJCommons/*.{h,m}'

  s.platform     = :ios, '5.1'
  s.requires_arc = true

  s.frameworks   = 'Foundation'

  s.preferred_dependency = 'Common'

  s.subspec 'Common' do |c|
  end

  s.subspec 'UIKitExtensions' do |u|
    u.source_files = 'ZLJCommons/UIKit/*.{h,m}'
    u.frameworks   = 'UIKit', 'CoreGraphics'
  end

  s.subspec 'CocoaLumberjack' do |cl|
    cl.source_files = 'ZLJCommons/CocoaLumberjack/*.{h,m}'
    cl.frameworks   = 'CoreGraphics'
    cl.dependency     'CocoaLumberjack', '~> 1.6'
  end
end