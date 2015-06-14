# react-native-i18n

Integrates [I18n.js](https://github.com/fnando/i18n-js) with React Native. Uses the device's locale as default.

## Installation

`$ npm install react-native-i18n --save`

Add `RNI18n.xcodeproj` to **Libraries** and add `libRNI18n.a` to **Link Binary With Libraries** under **Build Phases**. [More info and screenshots about how to do this is available in the React Native documentation](http://facebook.github.io/react-native/docs/linking-libraries.html).

## Usage

```js
var I18n = require('react-native-i18n');

var Demo = React.createClass({
  render: function() {
    return (
      <Text>{I18n.t('greeting')}</Text>
    )
  }
});

I18n.translations = {
  en: {
    greeting: 'Hi!'
  },
  fr: {
    greeting: 'Bonjour!'
  }
}
```

This will render `Hi!` for devices with the English locale, and `Bonjour!` for devices with the French locale.

For more info about I18n.js methods (`localize`, `pluralize`, etc) and settings see [its documentation](https://github.com/fnando/i18n-js#using-i18njs-with-other-languages-python-php-).

### Device's locale
You can get the device's locale with the `RNI18n` native module:

```js
var deviceLocale = require('react-native').NativeModules.RNI18n.locale
```