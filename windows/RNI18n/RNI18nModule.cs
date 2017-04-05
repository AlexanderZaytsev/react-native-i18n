using ReactNative.Bridge;
using ReactNative.Collections;
using System;
using System.Collections.Generic;
using System.Globalization;

namespace Com.AlexanderZaytsev.RNI18n {

  class RNI18nModule : ReactContextNativeModuleBase {

    public RNI18nModule(ReactContext reactContext) : base(reactContext) {}

    public override string Name {
      get {
        return "RNI18n";
      }
    }

    public override IReadOnlyDictionary<string, object> Constants {
      get {
        Dictionary<string, object> constants = new Dictionary<string, object>();

        constants["language"] = Windows.System.UserProfile.GlobalizationPreferences.Languages[0];
        constants["languages"] = Windows.System.UserProfile.GlobalizationPreferences.Languages;

        return constants;
      }
    }
  }
}
