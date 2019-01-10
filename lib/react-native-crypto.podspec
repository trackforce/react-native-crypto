
Pod::Spec.new do |s|
  s.name          = 'react-native-crypto'
  s.version       = '0.0.1'
  s.summary       = ''
  s.author        = "trackforce"
  s.license       = 'MIT'
  s.requires_arc  = true
  s.homepage      = "https://github.com/trackforce/react-native-crypto"
  s.source        = { :git => 'https://github.com/trackforce/react-native-crypto' }
  s.platform      = :ios, '8.0'
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency "React"
end
