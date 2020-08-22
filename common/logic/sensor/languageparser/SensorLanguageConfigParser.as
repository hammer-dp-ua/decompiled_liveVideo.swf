package common.logic.sensor.languageparser
{
   import common.logic.sensor.consts.Language_Config;
   import flash.xml.XMLDocument;
   
   public class SensorLanguageConfigParser
   {
       
      
      public function SensorLanguageConfigParser()
      {
         super();
      }
      
      public function parseLanguageConfigXmlStr(param1:String, param2:SensorLanguageConfig) : Boolean
      {
         if("" == param1)
         {
            return false;
         }
         var _loc3_:XML = new XML(param1);
         var _loc4_:XMLDocument = new XMLDocument(_loc3_.toString());
         return this.parseLanguageConfigXml(_loc4_,param2);
      }
      
      private function parseLanguageConfigXml(param1:XMLDocument, param2:SensorLanguageConfig) : Boolean
      {
         var _loc9_:XMLDocument = null;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc3_:String = null;
         var _loc4_:XMLDocument = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         _loc3_ = this.findNode(Language_Config.WND_NODE,param1);
         if(_loc3_ != null)
         {
            _loc4_ = new XMLDocument(_loc3_);
            _loc5_ = _loc4_.firstChild.childNodes.length;
            _loc6_ = 0;
            _loc7_ = _loc4_.firstChild.childNodes[_loc6_];
            while(_loc6_ < _loc5_)
            {
               if(_loc7_.indexOf("<") != -1)
               {
                  _loc9_ = new XMLDocument(_loc7_);
                  _loc10_ = -1;
                  _loc11_ = "";
                  _loc8_ = _loc9_.firstChild.attributes.key;
                  if(_loc8_ != undefined)
                  {
                     _loc10_ = int(_loc8_);
                  }
                  _loc8_ = _loc9_.firstChild.attributes.name;
                  if(_loc8_ != undefined)
                  {
                     _loc11_ = _loc8_;
                  }
                  if(_loc10_ != -1)
                  {
                     param2.addWndName(_loc10_,_loc11_);
                  }
               }
               _loc6_++;
               _loc7_ = _loc4_.firstChild.childNodes[_loc6_];
            }
         }
         _loc3_ = this.findNode(Language_Config.HELP_NODE,param1);
         if(_loc3_ != null)
         {
            _loc4_ = new XMLDocument(_loc3_);
            _loc5_ = _loc4_.firstChild.childNodes.length;
            _loc6_ = 0;
            _loc7_ = _loc4_.firstChild.childNodes[_loc6_];
            while(_loc6_ < _loc5_)
            {
               if(_loc7_.indexOf("<") != -1)
               {
                  _loc9_ = new XMLDocument(_loc7_);
                  _loc12_ = -1;
                  _loc13_ = "";
                  _loc14_ = _loc9_.firstChild.attributes.id;
                  if(_loc14_ != undefined)
                  {
                     _loc12_ = int(_loc14_);
                  }
                  _loc8_ = _loc9_.firstChild.attributes.info;
                  if(_loc8_ != undefined)
                  {
                     _loc13_ = _loc8_;
                  }
                  if(_loc12_ != -1 && _loc13_ != "")
                  {
                     param2.addHelpInfo(_loc12_,_loc13_);
                  }
               }
               _loc6_++;
               _loc7_ = _loc4_.firstChild.childNodes[_loc6_];
            }
         }
         return true;
      }
      
      private function findNode(param1:String, param2:XMLDocument) : String
      {
         var _loc6_:XMLDocument = null;
         var _loc3_:int = param2.firstChild.childNodes.length;
         var _loc4_:int = 0;
         var _loc5_:String = param2.firstChild.childNodes[_loc4_];
         while(_loc4_ < _loc3_)
         {
            if("" != _loc5_)
            {
               _loc6_ = new XMLDocument(_loc5_);
               if(param1.localeCompare(_loc6_.firstChild.nodeName) == 0)
               {
                  return _loc6_.toString();
               }
            }
            _loc4_++;
            _loc5_ = param2.firstChild.childNodes[_loc4_];
         }
         return null;
      }
   }
}
