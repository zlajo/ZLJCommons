Pod::Spec.new do |s|
  s.name         = 'ZLJCommons'
  s.version      = '0.0.1'
  s.license      = { :type => 'MIT', :file => 'License.txt' }

  s.summary      = 'A collection of several simple helpers.'
  s.homepage     = 'https://github.com/zlajo/ZLJCommons'
  s.author       = { 'Johannes Zlattinger' => 'johannes@zlattinger.net' }

  s.source       = { :git => 'https://github.com/zlajo/ZLJCommons.git', :branch => :develop }
  s.source_files = 'ZLJCommons'

  s.requires_arc = true

  s.frameworks   = 'Foundation', 'UIKit'
end