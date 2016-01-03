package com.i18n.reactnativei18n;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

import java.util.HashMap;
import java.util.Map;


public class ReactNativeI18nLocale extends ReactContextBaseJavaModule {

  ReactContext reactContext;

  public ReactNativeI18nLocale(ReactApplicationContext reactContext) {
      super(reactContext);
      this.reactContext = reactContext;
  }

  @Override
  public String getName() {
      return "RNI18n";
  }

  @Override
  public Map<String, Object> getConstants() {
      HashMap<String,Object> constants = new HashMap<String,Object>();
      constants.put("locale", reactContext.getResources().getConfiguration().locale.toString());
      return constants;
  }
}
