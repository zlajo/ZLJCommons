Pod::Spec.new do |s|
  s.name         = 'ZLJCommons'
  s.version      = '0.2.2'
  s.license      = { :type => 'MIT', :file => 'License.txt' }

  s.summary      = 'A collection of several simple helpers.'
  s.homepage     = 'https://github.com/zlajo/ZLJCommons'
  s.author       = { 'Johannes Zlattinger' => 'johannes@zlattinger.net' }

  s.source       = { :git => 'https://github.com/zlajo/ZLJCommons.git', :tag => 'v0.2.2'}
  s.source_files = 'ZLJCommons/*.{h,m}'

  s.platform     = :ios
  s.requires_arc = true

  s.frameworks   = 'CoreGraphics', 'Foundation', 'UIKit'

  s.preferred_dependency = 'Common'

  s.subspec 'Common' do |c|
  end

  s.subspec 'CocoaLumberjack' do |cl|
    cl.source_files = 'ZLJCommons/*.{h,m}'
    cl.dependency     'CocoaLumberjack', '~> 1.6'
  end
end