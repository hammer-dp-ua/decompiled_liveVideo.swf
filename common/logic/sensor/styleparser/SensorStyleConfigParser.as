package common.logic.sensor.styleparser
{
   import common.service.util.Map;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   import flash.xml.XMLNodeType;
   
   public class SensorStyleConfigParser
   {
       
      
      public function SensorStyleConfigParser()
      {
         super();
      }
      
      public function parseStyleConfigXmlStr(param1:String, param2:WndConfig) : Boolean
      {
         if("" == param1)
         {
            return false;
         }
         var _loc3_:XML = new XML(param1);
         var _loc4_:XMLDocument = new XMLDocument(_loc3_.toString());
         param2.parse(_loc4_);
         return true;
      }
      
      public function updateStyleConfigXmlStr(param1:String, param2:Map, param3:XMLDocument) : Boolean
      {
         var _loc4_:WndConfig = new WndConfig();
         if(!this.parseStyleConfigXmlStr(param1,_loc4_))
         {
            return false;
         }
         _loc4_.update(param2);
         var _loc5_:XMLDocument = new XMLDocument();
         param3.xmlDecl = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";
         var _loc6_:XMLNode = new XMLNode(XMLNodeType.ELEMENT_NODE,_loc4_.getWndType());
         if(!_loc4_.getXmlElement(_loc6_))
         {
            return false;
         }
         param3.appendChild(_loc6_);
         return true;
      }
   }
}
