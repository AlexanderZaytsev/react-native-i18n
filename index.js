'use strict';

const { NativeModules } = require('react-native');
const { RNI18n } = NativeModules;
let I18n = require('./vendor/i18n');

I18n.locale = (RNI18n) ? RNI18n.locale.replace(/_/, '-') : '';

module.exports = I18n;
