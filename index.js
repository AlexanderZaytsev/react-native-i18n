// @flow

const RNI18n = require('react-native').NativeModules.RNI18n;
const I18nJs = require('i18n-js');

I18nJs.locale = RNI18n.languages[0];
export const getLanguages = RNI18n.getLanguages;
export default I18nJs;
