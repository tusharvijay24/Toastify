Pod::Spec.new do |s|
  s.name             = 'Toastify'
  s.version          = '0.1.1'
  s.summary          = 'A customizable toast message library for Swift.'
  s.homepage         = 'https://github.com/tusharvijay24/Toastify'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tushar Vijayvargiya' => 'tusharvijayvargiya24112000@gmail.com' }
  s.source           = { :git => 'https://github.com/tusharvijay24/Toastify.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'Toastify/Classes/**/*'
  s.swift_versions = '5.0'
  
end

