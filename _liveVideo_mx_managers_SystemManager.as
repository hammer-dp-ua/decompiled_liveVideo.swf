package
{
   import flash.display.LoaderInfo;
   import flash.system.ApplicationDomain;
   import flash.system.Security;
   import flash.utils.Dictionary;
   import flashx.textLayout.compose.ISWFContext;
   import mx.core.IFlexModule;
   import mx.core.IFlexModuleFactory;
   import mx.core.RSLData;
   import mx.events.RSLEvent;
   import mx.managers.SystemManager;
   import mx.preloaders.SparkDownloadProgressBar;
   
   public class _liveVideo_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory, ISWFContext
   {
       
      
      private var _info:Object;
      
      private var _preloadedRSLs:Dictionary;
      
      private var _allowDomainParameters:Vector.<Array>;
      
      private var _allowInsecureDomainParameters:Vector.<Array>;
      
      public function _liveVideo_mx_managers_SystemManager()
      {
         super();
      }
      
      override public function callInContext(param1:Function, param2:Object, param3:Array, param4:Boolean = true) : *
      {
         if(param4)
         {
            return param1.apply(param2,param3);
         }
         param1.apply(param2,param3);
      }
      
      override public function create(... rest) : Object
      {
         if(rest.length > 0 && !(rest[0] is String))
         {
            return super.create.apply(this,rest);
         }
         var _loc2_:String = rest.length == 0?"ipc.style1.ui.liveVideo":String(rest[0]);
         var _loc3_:Class = Class(getDefinitionByName(_loc2_));
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:Object = new _loc3_();
         if(_loc4_ is IFlexModule)
         {
            IFlexModule(_loc4_).moduleFactory = this;
         }
         return _loc4_;
      }
      
      override public function info() : Object
      {
         if(!this._info)
         {
            this._info = {
               "applicationComplete":"application_applicationCompleteHandler()",
               "cdRsls":[[new RSLData("framework_4.5.1.21328.swz","","8165d3af89956f505bbf7b18667e0b2ccb9ec3674080ee701e65c69721aa2a4c","SHA-256",true,true,"default"),new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.5.1.21328/framework_4.5.1.21328.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","8165d3af89956f505bbf7b18667e0b2ccb9ec3674080ee701e65c69721aa2a4c","SHA-256",true,true,"default")],[new RSLData("textLayout_2.0.0.232.swz","","8f903698240fe799f61eeda8595181137b996156bb176da70ad6f41645c64c74","SHA-256",true,true,"default"),new RSLData("http://fpdownload.adobe.com/pub/swz/tlf/2.0.0.232/textLayout_2.0.0.232.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","8f903698240fe799f61eeda8595181137b996156bb176da70ad6f41645c64c74","SHA-256",true,true,"default")],[new RSLData("mx_4.5.1.21328.swz","","5270c4cdf61ab3f586b06b3d5f3e87624a1d72235bd10b22535861d2bab4f544","SHA-256",true,true,"default"),new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.5.1.21328/mx_4.5.1.21328.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","5270c4cdf61ab3f586b06b3d5f3e87624a1d72235bd10b22535861d2bab4f544","SHA-256",true,true,"default")],[new RSLData("charts_4.5.1.21328.swz","","4bc492f44f0f3429e00a311ab4dbcfa4cbd7ad1a0cd44a0aacc84e72de7814ee","SHA-256",true,true,"default"),new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.5.1.21328/charts_4.5.1.21328.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","4bc492f44f0f3429e00a311ab4dbcfa4cbd7ad1a0cd44a0aacc84e72de7814ee","SHA-256",true,true,"default")],[new RSLData("spark_4.5.1.21328.swz","","a61663f0eb79848070c225295c549d272d01b2289a4615566d85041d5c8cd400","SHA-256",true,true,"default"),new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.5.1.21328/spark_4.5.1.21328.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","a61663f0eb79848070c225295c549d272d01b2289a4615566d85041d5c8cd400","SHA-256",true,true,"default")],[new RSLData("sparkskins_4.5.1.21328.swz","","7899edf6a90c42aab967d1695cf634953c3cdc0a4c4fb442a97349c4d575b6c2","SHA-256",true,true,"default"),new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.5.1.21328/sparkskins_4.5.1.21328.swz","http://fpdownload.adobe.com/pub/swz/crossdomain.xml","7899edf6a90c42aab967d1695cf634953c3cdc0a4c4fb442a97349c4d575b6c2","SHA-256",true,true,"default")]],
               "compiledLocales":["en_US"],
               "compiledResourceBundleNames":["SharedResources","collections","components","containers","controls","core","effects","formatters","layout","skins","sparkEffects","styles","textLayout"],
               "creationComplete":"application_creationCompleteHandler();",
               "currentDomain":ApplicationDomain.currentDomain,
               "layout":"absolute",
               "mainClassName":"ipc.style1.ui.liveVideo",
               "mixins":["_liveVideo_FlexInit","_liveVideo_Styles","mx.managers.systemClasses.ActiveWindowManager"],
               "placeholderRsls":[],
               "preinitialize":"initDeviceInfo()",
               "preloader":SparkDownloadProgressBar
            };
         }
         return this._info;
      }
      
      override public function get preloadedRSLs() : Dictionary
      {
         if(this._preloadedRSLs == null)
         {
            this._preloadedRSLs = new Dictionary(true);
         }
         return this._preloadedRSLs;
      }
      
      override public function allowDomain(... rest) : void
      {
         var _loc2_:* = null;
         Security.allowDomain.apply(null,rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(_loc2_.content && "allowDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowDomainInRSL"].apply(null,rest);
            }
         }
         if(!this._allowDomainParameters)
         {
            this._allowDomainParameters = new Vector.<Array>();
         }
         this._allowDomainParameters.push(rest);
         addEventListener(RSLEvent.RSL_ADD_PRELOADED,this.addPreloadedRSLHandler,false,50);
      }
      
      override public function allowInsecureDomain(... rest) : void
      {
         var _loc2_:* = null;
         Security.allowInsecureDomain.apply(null,rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(_loc2_.content && "allowInsecureDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowInsecureDomainInRSL"].apply(null,rest);
            }
         }
         if(!this._allowInsecureDomainParameters)
         {
            this._allowInsecureDomainParameters = new Vector.<Array>();
         }
         this._allowInsecureDomainParameters.push(rest);
         addEventListener(RSLEvent.RSL_ADD_PRELOADED,this.addPreloadedRSLHandler,false,50);
      }
      
      private function addPreloadedRSLHandler(param1:RSLEvent) : void
      {
         var _loc3_:Array = null;
         var _loc2_:LoaderInfo = param1.loaderInfo;
         if(!_loc2_ || !_loc2_.content)
         {
            return;
         }
         if(allowDomainsInNewRSLs && this._allowDomainParameters)
         {
            for each(_loc3_ in this._allowDomainParameters)
            {
               if("allowDomainInRSL" in _loc2_.content)
               {
                  _loc2_.content["allowDomainInRSL"].apply(null,_loc3_);
               }
            }
         }
         if(allowInsecureDomainsInNewRSLs && this._allowInsecureDomainParameters)
         {
            for each(_loc3_ in this._allowInsecureDomainParameters)
            {
               if("allowInsecureDomainInRSL" in _loc2_.content)
               {
                  _loc2_.content["allowInsecureDomainInRSL"].apply(null,_loc3_);
               }
            }
         }
      }
   }
}
