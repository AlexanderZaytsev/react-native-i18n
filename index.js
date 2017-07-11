// @flow

import { NativeModules } from 'react-native';
import I18n from 'i18n-js';
const { RNI18n } = NativeModules;

I18n.locale = NativeModules.SettingsManager.settings.AppleLocale

export const getLanguages = RNI18n.getLanguages;
export default I18n;
