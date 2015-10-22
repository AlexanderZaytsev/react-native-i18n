'use strict';

var Platform = require('Platform');
var I18n = require('./vendor/i18n');
var { RNI18n } = require('react-native').NativeModules;

if (Platform.OS === 'android') {
  RNI18n.getCurrentLocale( function(locale) {
    I18n.locale = locale.replace(/_/, '-');
  });
} else {
  I18n.locale = RNI18n.locale.replace(/_/, '-');
}

module.exports = I18n;
