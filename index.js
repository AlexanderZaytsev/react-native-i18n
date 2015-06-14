'use strict';

var I18n = require('./vendor/i18n');
var { RNI18n } = require('react-native').NativeModules;

I18n.locale = RNI18n.locale;

module.exports = I18n;