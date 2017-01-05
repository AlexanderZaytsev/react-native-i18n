require 'json'
version = JSON.parse(File.read('package.json'))["version"]

Pod::Spec.new do |s|
  s.name            = "RNI18n"
  s.version         = version
  s.homepage        = "https://github.com/AlexanderZaytsev/react-native-i18n"
  s.summary         = "React Native + i18n.js"
  s.license         = "MIT"
  s.author          = { "Alexander Zaytsev" => "alexander@say26.com" }
  s.platform        = :ios, "8.0"
  s.source          = { git: "https://github.com/AlexanderZaytsev/react-native-i18n.git", tag: s.version.to_s }
  s.source_files    = 'RNI18n/*.{h,m}'
  s.preserve_paths  = "**/*.js"

  s.dependency 'React'
end
