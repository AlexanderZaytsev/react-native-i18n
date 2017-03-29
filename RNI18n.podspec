require 'json'
version = JSON.parse(File.read('package.json'))["version"]

Pod::Spec.new do |s|
  s.name         = "RNI18n"
  s.version      = version
  s.description  = "https://github.com/AlexanderZaytsev/react-native-i18n"
  s.summary      = "React Native + i18n.js"
  s.license      = "MIT"
  s.author       = { "Alexander Zaytsev" => "alexander@say26.com" }
  s.platform     = :ios, "7.0"
  s.source       = { git: "https://github.com/AlexanderZaytsev/react-native-i18n.git", tag: s.version.to_s }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"
end
