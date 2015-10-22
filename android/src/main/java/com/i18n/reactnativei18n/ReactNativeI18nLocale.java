package com.i18n.reactnativei18n;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;


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

  @ReactMethod
  public void getCurrentLocale(
      Callback successCallback
  ) {
      String current = reactContext.getResources().getConfiguration().locale.toString();
      successCallback.invoke(current);
  }
}
