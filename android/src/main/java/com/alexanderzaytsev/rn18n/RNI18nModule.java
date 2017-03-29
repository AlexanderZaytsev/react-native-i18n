package com.alexanderzaytsev.rn18n;

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
    return getReactApplicationContext().getResources().getConfiguration().locale.toString();
  }

  @Override
  public Map<String, Object> getConstants() {
    HashMap<String,Object> constants = new HashMap<String,Object>();
    constants.put("locale", this.getCurrentLocale());
    return constants;
  }
}
