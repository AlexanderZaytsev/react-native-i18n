package com.AlexanderZaytsev.RNI18n;

import android.os.Build;
import android.os.LocaleList;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableArray;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class RNI18nModule extends ReactContextBaseJavaModule {

  public RNI18nModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RNI18n";
  }

  private String toLanguageTag(Locale locale) {
    String languageTag;

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      languageTag = locale.toLanguageTag();
    } else {
      StringBuilder builder = new StringBuilder();
      builder.append(locale.getLanguage());

      if (locale.getCountry() != null) {
        builder.append("-");
        builder.append(locale.getCountry());
      }

      languageTag = builder.toString();
    }

    if (languageTag.matches("^(iw|in|ji).*")){
      return languageTag
        .replace("iw","he")
        .replace("in","id")
        .replace("ji","yi");
    }

    return languageTag;
  }

  private WritableArray getLocaleList() {
    WritableArray array = Arguments.createArray();

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
      LocaleList locales = getReactApplicationContext()
          .getResources().getConfiguration().getLocales();

      for (int i = 0; i < locales.size(); i++) {
        array.pushString(this.toLanguageTag(locales.get(i)));
      }
    } else {
      array.pushString(this.toLanguageTag(getReactApplicationContext()
          .getResources().getConfiguration().locale));
    }

    return array;
  }

  @Override
  public Map<String, Object> getConstants() {
    HashMap<String, Object> constants = new HashMap<String,Object>();
    constants.put("languages", this.getLocaleList());
    return constants;
  }

  @ReactMethod
  public void getLanguages(Promise promise) {
    try {
      promise.resolve(this.getLocaleList());
    } catch (Exception e) {
      promise.reject(e);
    }
  }
}
