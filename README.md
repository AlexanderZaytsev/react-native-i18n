# react-native-i18n

Integrates [I18n.js](https://github.com/fnando/i18n-js) with React Native. Uses the device's locale as default.

## Installation

`$ npm install react-native-i18n --save`

After installing the npm package you need to link the native modules.  
If you're using React-Native < 0.29 install [rnpm](https://github.com/rnpm/rnpm) with the command `npm install -g rnpm` and then link the library with the command `rnpm link`.   
If you're using React-Native >= 0.29 just link the library with the command `react-native link`.
You can do so using [rnpm](https://github.com/rnpm/rnpm).  

Or you can do it manually as follows:

### iOS

Add `RNI18n.xcodeproj` to **Libraries** and add `libRNI18n.a` to **Link Binary With Libraries** under **Build Phases**. [More info and screenshots about how to do this is available in the React Native documentation](http://facebook.github.io/react-native/docs/linking-libraries-ios.html#content).

### Android

Add `react-native-i18n` to your `./android/settings.gradle` file as follows:

```
include ':app', ':react-native-i18n'
project(':react-native-i18n').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-i18n/android')
```

Include it as dependency in `./android/app/build.gradle` file:

```
dependencies {
    ...
    compile project(':react-native-i18n')
}
```

Finally, you need to add the package within the `ReactInstanceManager` of your MainActivity (`./android/app/src/main/java/your/bundle/MainActivity.java`):

```java

import com.i18n.reactnativei18n.ReactNativeI18n;  // <---- import this one

...


@Override
protected List<ReactPackage> getPackages() {
	...

	protected List<ReactPackage> getPackages() {
        	return Arrays.<ReactPackage>asList(
                	new MainReactPackage(),
                	new ReactNativeI18n()   // <---- add this line
                );
    	}

	...
}

...

```


After that, you will need to recompile your project with `react-native run-android`.

## Usage

```javascript
import I18n from 'react-native-i18n'

class Demo extends React.Component {
  render () {
    return (
      <Text>{I18n.t('greeting')}</Text>
    )
  }
}

// Enable fallbacks if you want `en-US` and `en-GB` to fallback to `en`
I18n.fallbacks = true

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

### Fallbacks
When fallbacks are enabled (which is generally recommended), `i18n.js` will try to look up translations in the following order (for a device with `en_US` locale):
- en-US
- en

**Note**: iOS locales use underscored (`en_US`) but `i18n.js` locales are dasherized (`en-US`). This conversion is done automatically for you.
```js
I18n.fallbacks = true

I18n.translations = {
  'en': {
    greeting: 'Hi!'
  },
  'en-GB': {
    greeting: 'Hi from the UK!'
  }
}
```
For a device with a `en_GB` locale this will return `Hi from the UK!'`, for a device with a `en_US` locale it will return `Hi!`.

### Device's locale

You can get the device's locale with the `RNI18n` native module:

```js
import ReactNativeI18n from 'react-native-i18n'
const deviceLocale = ReactNativeI18n.locale
```

Returns `en-US`.


### I18n.js documentation
For more info about I18n.js methods (`localize`, `pluralize`, etc) and settings see [its documentation](https://github.com/fnando/i18n-js#setting-up).

## Licence
MIT
