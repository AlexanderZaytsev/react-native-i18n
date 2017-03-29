using ReactNative.Bridge;
using ReactNative.Modules.Core;
using ReactNative.UIManager;
using System;
using System.Collections.Generic;

namespace Com.AlexanderZaytsev.RNI18n
{
  public class RNI18nPackage : IReactPackage
  {
    public IReadOnlyList<INativeModule> CreateNativeModules(ReactContext reactContext)
    {
      return new List<INativeModule>
      {
        new RNI18nModule(reactContext),
      };
    }

    public IReadOnlyList<Type> CreateJavaScriptModulesConfig()
    {
      return new List<Type>(0);
    }

    public IReadOnlyList<IViewManager> CreateViewManagers(ReactContext reactContext)
    {
      return new List<IViewManager>(0);
    }
  }
}
