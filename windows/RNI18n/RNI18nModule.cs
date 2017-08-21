using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.System.UserProfile;

namespace RNI18n
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNI18nModule : NativeModuleBase
    {
        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNI18n";
            }
        }

        /// <summary>
        /// The native module constants.
        /// </summary>
        public override IReadOnlyDictionary<string, object> Constants
        {
            get
            {
                return new Dictionary<string, object>
                {
                    { "languages", GlobalizationPreferences.Languages }
                };
            }
        }

        /// <summary>
        /// A native method to retrieve the user language preferences.
        /// </summary>
        /// <param name="promise">A promise to return the results.</param>
        [ReactMethod]
        public void getLanguages(IPromise promise)
        {
            try
            {
                promise.Resolve(GlobalizationPreferences.Languages);
            }
            catch (Exception e)
            {
                promise.Reject(e);
            }
        }
    }
}
