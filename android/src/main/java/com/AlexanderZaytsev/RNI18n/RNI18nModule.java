package com.AlexanderZaytsev.RNI18n;

import android.os.Build;
import android.os.LocaleList;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableArray;

import java.util.Locale;

public class RNI18nModule extends ReactContextBaseJavaModule {

  public RNI18nModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RNI18n";
  }

  private String toLanguageTag(Locale locale) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      return locale.toLanguageTag();
    }

    StringBuilder builder = new StringBuilder();
    builder.append(locale.getLanguage());

    if (locale.getCountry() != null) {
      builder.append("-");
      builder.append(locale.getCountry());
    }

    return builder.toString();
  }

  @ReactMethod
  public void getLanguages(Promise promise) {
    try {
      LocaleList locales = Build.VERSION.SDK_INT >= Build.VERSION_CODES.N
        ? getReactApplicationContext().getResources().getConfiguration().getLocales()
        : new LocaleList(getReactApplicationContext().getResources().getConfiguration().locale);

      WritableArray languages = Arguments.createArray();

      for (int i = 0; i < locales.size(); i++) {
        languages.pushString(this.toLanguageTag(locales.get(i)));
      }

      promise.resolve(languages);
    } catch (Exception e) {
      promise.reject(e);
    }
  }
}
