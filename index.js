var React = require('react-native');
var I18n = require('i18n');
var { NativeI18n } = require('react-native').NativeModules;

I18n.locale = NativeI18n.locale;

module.exports = I18n;