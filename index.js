// @flow

const RNI18n = require('react-native').NativeModules.RNI18n;
const I18nJs = require('i18n-js');

I18nJs.locale = RNI18n ? RNI18n.languages[0] : 'en';
export const getLanguages = RNI18n ? RNI18n.getLanguages : new Promise((resolve, reject) => {
    resolve('en');
});

export default I18nJs;
