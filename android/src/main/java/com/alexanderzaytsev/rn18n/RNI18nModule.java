package com.alexanderzaytsev.rn18n;

import android.os.Build;
import android.os.LocaleList;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

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

  private boolean isSupportingPreferredLanguages() {
    return Build.VERSION.SDK_INT >= Build.VERSION_CODES.N;
  }

  private LocaleList getLocales() {
    return this.isSupportingPreferredLanguages()
      ? getReactApplicationContext().getResources().getConfiguration().getLocales()
      : new LocaleList(getReactApplicationContext().getResources().getConfiguration().locale);
  }

  private String toLanguageTag(Locale locale) {
    if (this.isSupportingPreferredLanguages()) {
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

  @Override
  public Map<String, Object> getConstants() {
    HashMap<String,Object> constants = new HashMap<String,Object>();
    LocaleList locales = this.getLocales();
    WritableArray languages = Arguments.createArray();

    for (int i = 0; i < locales.size(); i++) {
      languages.pushString(this.toLanguageTag(locales.get(i)));
    }

    constants.put("language", languages.getString(0));
    constants.put("languages", languages);

    return constants;
  }
}
