package common.logic.sensor.util
{
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   import flash.xml.XMLDocument;
   
   public class SensorTool
   {
       
      
      public function SensorTool()
      {
         super();
      }
      
      public static function parseSensorParameter(param1:String, param2:Map) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1.indexOf("(",_loc3_);
            if(_loc4_ == -1)
            {
               break;
            }
            _loc5_ = param1.indexOf(")",_loc3_);
            if(_loc5_ == -1)
            {
               break;
            }
            _loc6_ = param1.substr(_loc4_ + 1,_loc5_ - _loc4_ - 1);
            _loc7_ = _loc6_.split(",");
            param2.push(int(_loc7_[0]),int(_loc7_[1]));
            _loc3_ = _loc5_ + 1;
         }
         return true;
      }
      
      public static function parseShowID(param1:String) : Vector.<int>
      {
         var _loc5_:int = 0;
         var _loc2_:Vector.<int> = new Vector.<int>();
         if(param1 == null)
         {
            return _loc2_;
         }
         var _loc3_:int = param1.indexOf(",");
         var _loc4_:int = 0;
         if(_loc3_ == -1)
         {
            _loc4_ = int(param1);
            _loc2_.push(_loc4_);
         }
         else
         {
            _loc5_ = 0;
            do
            {
               _loc4_ = int(param1.substr(_loc5_,_loc3_ - _loc5_));
               _loc2_.push(_loc4_);
               _loc5_ = _loc3_ + 1;
               _loc3_ = int(param1.indexOf(",",_loc3_ + 1));
               if(_loc3_ == -1)
               {
                  _loc3_ = param1.length;
               }
            }
            while(_loc5_ <= int(param1.length) && _loc5_ != 0);
            
         }
         return _loc2_;
      }
      
      public static function createSensorParameterString(param1:Map) : String
      {
         var _loc3_:* = null;
         var _loc4_:KeyValuePair = null;
         var _loc2_:String = "";
         for(_loc3_ in param1.getDataMap())
         {
            _loc4_ = param1.getDataMap()[_loc3_];
            _loc2_ = _loc2_ + ("(" + _loc4_.Key + "," + _loc4_.Value + ")");
         }
         return _loc2_;
      }
      
      public static function findSensorUISize(param1:String, param2:String) : String
      {
         if(param1 == "")
         {
            return "0";
         }
         var _loc3_:XMLDocument = new XMLDocument(param1);
         var _loc4_:String = null;
         var _loc5_:XMLDocument = new XMLDocument(_loc3_.childNodes[1].toString());
         if(param2 == "width")
         {
            _loc4_ = _loc5_.firstChild.attributes.width;
         }
         else
         {
            _loc4_ = _loc5_.firstChild.attributes.height;
         }
         return _loc4_;
      }
   }
}
