'use strict';

import { Platform, NativeModules } from 'react-native';
let { RNI18n } = NativeModules
let I18n = require('./vendor/i18n')

I18n.locale = RNI18n.locale.replace(/_/, '-');

module.exports = I18n;
