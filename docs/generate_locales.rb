#!/usr/bin/env ruby

# Some scripts to generate lists of locales


# iOS
# --------------------------------------------------------------------------------
# React Native supports iOS 8.0 and higher.
# According to http://www.ibabbleon.com/iOS-Language-Codes-ISO-639.html:
#
#    Starting from iOS 8 — Your iOS apps can be in ANY language, even those Apple
#    has not yet localized the system into. Users of iOS 8 can select any language and region
#    from the new international options in the Settings app.
#
# Save the following URL to /tmp/locales-ios.csv:
# curl -o /tmp/locales-ios.csv https://gist.githubusercontent.com/jasef/337431c43c3addb2cbd5eb215b376179/raw/bbc3ad5b1fb6f2e419b2d0d30c09dafc47695560/ioslocaleidentifiers.csv
# Then run the following in irb:

require 'csv'
source_csv = CSV.parse(File.read('/tmp/locales-ios.csv').sub('"Description"', 'Description'))
ios_csv = source_csv[1..-1].map { |locale, desc|
  [
    locale.gsub('_', '-'),
    "\"#{desc}\""
  ].join(',')
}.sort.join("\n")
File.open('docs/locales-ios.csv', 'w') do |f|
  f.puts "Locale Identifier, Description"
  f.puts ios_csv
end


# Android
# --------------------------------------------------------------------------------
# React Native supports Android 4.1 and higher (SDK 16)
# I ran the following code on an Android 4.1 emulator to generate the list of
# locales in docs/locales-android.csv.
# Add this code to the `onCreate` method in your MainApplication.java:

final Locale[] availableLocales = Locale.getAvailableLocales();
String i18nCSV = "";
for(final Locale locale : availableLocales)
    Log.d("I18nCSV",
            locale.toString().replace("_","-") + ",\"" +
            locale.getDisplayName() + "\"");

# Then do a regex find and replace in your editor to remove /.*I18nCSV: /


# Windows 10 (UWP)
# --------------------------------------------------------------------------------
# We download and parse the HTML table from
# https://docs.microsoft.com/en-us/windows/uwp/publish/supported-languages
#
# You will need to install the 'mechanize' gem: gem install mechanize
# Then run the following in irb:

require 'mechanize'
m = Mechanize.new
page = m.get('https://docs.microsoft.com/en-us/windows/uwp/publish/supported-languages')

windows10_csv = page.search('.mainContainer table').search('tr')[1..-1].map { |tr|
  desc = tr.search('td').first.text.strip
  locales = tr.search('td').last.text.strip.split(',').map(&:strip)

  locales.map {|locale| [
    locale,
    locale.include?('-') ? "\"#{desc} (#{locale.split('-', 2).last.upcase})\"" : "\"#{desc}\""
  ].join(',') }
}.flatten.sort.join("\n")

File.open('docs/locales-windows10.csv', 'w') do |f|
  f.puts "Locale Identifier, Description"
  f.puts windows10_csv
end



# Intersections (Locales that can be used on multiple platforms)
# --------------------------------------------------------------------------------
# After generating all of the locale files above,
# run the following to generate the intersection.
require 'csv'
ios = CSV.parse(File.read('docs/locales-ios.csv'))[1..-1].to_h
android = CSV.parse(File.read('docs/locales-android.csv'))[1..-1].to_h
windows = CSV.parse(File.read('docs/locales-windows10.csv'))[1..-1].to_h

# Downcase all keys for comparison, but preserve original case as :locale
ios = ios.reduce({}) {|h, (l, d)| h[l.downcase] = { desc: d, locale: l }; h }
android = android.reduce({}) {|h, (l, d)| h[l.downcase] = { desc: d, locale: l }; h }
windows = windows.reduce({}) {|h, (l, d)| h[l.downcase] = { desc: d, locale: l }; h }


all_keys = ios.keys & android.keys & windows.keys
all_csv = all_keys.reduce({}) { |h, k|
  h[ios[k][:locale]] = ios[k][:desc]; h
}.map { |locale, desc|
  [
    locale,
    "\"#{desc}\""
  ].join(',')
}.join("\n")

File.open('docs/locales-all.csv', 'w') do |f|
  f.puts "Locale Identifier, Description"
  f.puts all_csv
end
