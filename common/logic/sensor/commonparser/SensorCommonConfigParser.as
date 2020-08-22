package common.logic.sensor.commonparser
{
   import common.logic.sensor.consts.System_Button;
   import flash.xml.XMLDocument;
   
   public class SensorCommonConfigParser
   {
       
      
      public function SensorCommonConfigParser()
      {
         super();
      }
      
      public function parseCommonConfigXmlStr(param1:String, param2:Vector.<SensorCommonConfig>) : Boolean
      {
         if("" == param1)
         {
            return false;
         }
         var _loc3_:XML = new XML(param1);
         var _loc4_:XMLDocument = new XMLDocument(_loc3_.toString());
         return this.parseCommonConfigXml(_loc4_,param2);
      }
      
      private function parseCommonConfigXml(param1:XMLDocument, param2:Vector.<SensorCommonConfig>) : Boolean
      {
         var _loc3_:int = param1.firstChild.childNodes.length;
         var _loc4_:int = 0;
         var _loc5_:String = param1.firstChild.childNodes[_loc4_];
         var _loc6_:XMLDocument = null;
         var _loc7_:SensorCommonConfig = null;
         while(null != _loc5_ && _loc4_ < _loc3_)
         {
            if(_loc5_.indexOf("<") != -1)
            {
               _loc6_ = new XMLDocument(_loc5_);
               _loc7_ = new SensorCommonConfig();
               _loc7_.setType(_loc6_.firstChild.nodeName);
               this.addInfo(_loc6_,_loc7_);
               param2.push(_loc7_);
            }
            _loc4_++;
            _loc5_ = param1.firstChild.childNodes[_loc4_];
         }
         return true;
      }
      
      private function addInfo(param1:XMLDocument, param2:SensorCommonConfig) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         _loc4_ = param1.firstChild.attributes.failedinfo;
         if(_loc4_ != undefined)
         {
            _loc3_ = System_Button.SYS_BTN_FINFO;
            param2.addTipInfo(_loc3_,_loc4_);
         }
         _loc4_ = param1.firstChild.attributes.help;
         if(_loc4_ != undefined)
         {
            _loc3_ = System_Button.SYS_BTN_HELP;
            param2.addTipInfo(_loc3_,_loc4_);
         }
         _loc4_ = param1.firstChild.attributes.name;
         if(_loc4_ != undefined)
         {
            _loc3_ = System_Button.SYS_BTN_NAME;
            param2.addTipInfo(_loc3_,_loc4_);
         }
         _loc4_ = param1.firstChild.attributes.successinfo;
         if(_loc4_ != undefined)
         {
            _loc3_ = System_Button.SYS_BTN_SINFO;
            param2.addTipInfo(_loc3_,_loc4_);
         }
         _loc4_ = param1.firstChild.attributes.tip;
         if(_loc4_ != undefined)
         {
            _loc3_ = System_Button.SYS_BTN_TIP;
            param2.addTipInfo(_loc3_,_loc4_);
         }
         _loc4_ = param1.firstChild.attributes.title;
         if(_loc4_ != undefined)
         {
            _loc3_ = System_Button.SYS_BTN_TITLE;
            param2.addTipInfo(_loc3_,_loc4_);
         }
      }
   }
}
