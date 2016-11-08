using ReactNative.Bridge;
using ReactNative.Collections;
using System;
using System.Collections.Generic;
using System.Globalization;

namespace ReactNative.Modules.RNI18n
{
    public class ReactNativeI18n : NativeModuleBase
    {
        public override string Name
        {
            get
            {
                return "RNI18n";
            }
        }

        public override IReadOnlyDictionary<String, Object> Constants
        {
            get
            {
                Dictionary<String, Object> constants = new Dictionary<string, object>();
                constants.Add("locale", System.Globalization.CultureInfo.CurrentCulture.Name);
                return constants;
            }
        }
    }
}
