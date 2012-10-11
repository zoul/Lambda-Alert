Pod::Spec.new do |s|
  s.name      = 'Lambda-Alert'
  s.version   = '0.1'
  s.summary   = 'An Objective-C wrapper for UIAlertView and UIActionSheet'
  s.homepage  = 'https://github.com/zoul/Lambda-Alert/blob/master/lambda-alert.podspec'
  s.license   = { :type => 'MIT', :file => 'LICENSE' }
  s.author    = { 'Tomáš Znamenáček' => 'tomas.znamenacek@gmail.com' }
  s.platform  = :ios
  s.source    = { :git => 'https://github.com/zoul/Lambda-Alert.git', :commit => 'aeb49e8e1ab1a0d54761fdebd5f6a121b01c06b9' }
  s.source_files = 'Sources/*.{h,m}'
  s.frameworks = 'CoreGraphics'
end
