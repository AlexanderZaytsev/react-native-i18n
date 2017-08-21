using ReactNative;
using ReactNative.Modules.Core;
using ReactNative.Shell;
using RNI18n;
using System.Collections.Generic;

namespace RNI18nExample
{
    class MainPage : ReactPage
    {
        public override string MainComponentName
        {
            get
            {
                return "RNI18nExample";
            }
        }

#if BUNDLE
        public override string JavaScriptBundleFile
        {
            get
            {
                return "ms-appx:///ReactAssets/index.windows.bundle";
            }
        }
#endif

        public override List<IReactPackage> Packages
        {
            get
            {
                return new List<IReactPackage>
                {
                    new MainReactPackage(),
                    new RNI18nPackage(),
                };
            }
        }

        public override bool UseDeveloperSupport
        {
            get
            {
#if !BUNDLE || DEBUG
                return true;
#else
                return false;
#endif
            }
        }
    }

}
