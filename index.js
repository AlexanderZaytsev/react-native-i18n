'use strict';

let { Platform, NativeModules/RNI18N } = require('react-native')
let I18n = require('./vendor/i18n')

if (Platform.OS === 'android') {
  RNI18n.getCurrentLocale( function(locale) {
    I18n.locale = locale.replace(/_/, '-');
  });
} else {
  I18n.locale = RNI18n.locale.replace(/_/, '-');
}

module.exports = I18n;
