Pod::Spec.new do |s|
  s.name             = 'Toastify'
  s.version          = '0.1.0'
  s.summary          = 'A customizable toast message library for Swift.'
  s.homepage         = 'https://github.com/YOUR_GITHUB/Toastify'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your_email@example.com' }
  s.source           = { :git => 'https://github.com/YOUR_GITHUB/Toastify.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files     = 'Sources/Toastify/**/*'
end
