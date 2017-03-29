package com.alexanderzaytsev.rn18n;

import android.os.Build;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.module.annotations.ReactModule;

import java.util.HashMap;
import java.util.Map;

@ReactModule(name = "RNI18n")
public class RNI18nModule extends ReactContextBaseJavaModule {

  public RNI18nModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RNI18n";
  }

  private String getCurrentLocale() {
    Locale currentLocale = (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N)
      ? getReactApplicationContext().getResources().getConfiguration().getLocales().get(0)
      : getReactApplicationContext().getResources().getConfiguration().locale;

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      return currentLocale.toLanguageTag();
    }

    StringBuilder builder = new StringBuilder();
    builder.append(currentLocale.getLanguage());

    if (currentLocale.getCountry() != null) {
      builder.append("-");
      builder.append(currentLocale.getCountry());
    }

    return builder.toString();
  }

  @Override
  public Map<String, Object> getConstants() {
    HashMap<String,Object> constants = new HashMap<String,Object>();
    constants.put("locale", this.getCurrentLocale());
    return constants;
  }
}
