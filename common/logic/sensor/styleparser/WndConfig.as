package common.logic.sensor.styleparser
{
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.consts.Wnd_Type;
   import common.service.util.KeyValuePair;
   import common.service.util.Map;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   import flash.xml.XMLNodeType;
   
   public class WndConfig
   {
       
      
      private var m_strWndType:String;
      
      private var m_objChildWndList:Vector.<WndConfig>;
      
      private var m_objListIter:Vector.<WndConfig>;
      
      private var m_objPropertyMap:Map;
      
      public function WndConfig()
      {
         super();
         this.m_strWndType = null;
         this.m_objChildWndList = new Vector.<WndConfig>();
         this.m_objPropertyMap = new Map(Map.MAP_TYPE_STR,Map.MAP_TYPE_STR);
      }
      
      public function getWndType() : String
      {
         if(this.m_strWndType != null)
         {
            return this.m_strWndType;
         }
         return null;
      }
      
      public function getChildWndList() : Vector.<WndConfig>
      {
         return this.m_objChildWndList;
      }
      
      public function update(param1:Map) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:KeyValuePair = null;
         var _loc6_:WndConfig = null;
         var _loc2_:String = this.getProperty(Wnd_Property.WND_ID);
         if(_loc2_ != null)
         {
            _loc4_ = int(_loc2_);
            _loc5_ = param1.find(_loc4_);
            if(_loc5_ != null)
            {
               this.setProperty(Wnd_Property.WND_VALUE,_loc5_.Value);
            }
         }
         for(_loc3_ in this.m_objChildWndList)
         {
            _loc6_ = this.m_objChildWndList[_loc3_];
            _loc6_.update(param1);
         }
         return true;
      }
      
      public function getProperty(param1:String) : String
      {
         var _loc2_:KeyValuePair = this.m_objPropertyMap.find(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.Value;
      }
      
      public function getAppointedChild(param1:int) : WndConfig
      {
         if(param1 >= this.m_objChildWndList.length)
         {
            return null;
         }
         return this.m_objChildWndList[param1.toString()];
      }
      
      public function getChildSize() : int
      {
         return this.m_objChildWndList.length;
      }
      
      public function getXmlElement(param1:XMLNode) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:WndConfig = null;
         var _loc5_:XMLNode = null;
         if(null == this.m_strWndType)
         {
            return false;
         }
         var _loc2_:Object = new Object();
         if(this.m_strWndType == Wnd_Type.TAB_CONTROL || this.m_strWndType == Wnd_Type.Tab || this.m_strWndType == Wnd_Type.Group)
         {
            this.setFrameAttribute(_loc2_);
         }
         else
         {
            this.setConponentAttribute(_loc2_);
         }
         param1.attributes = _loc2_;
         for(_loc3_ in this.m_objChildWndList)
         {
            _loc4_ = this.m_objChildWndList[_loc3_];
            _loc5_ = new XMLNode(XMLNodeType.ELEMENT_NODE,_loc4_.getWndType());
            _loc4_.getXmlElement(_loc5_);
            if(null != _loc5_)
            {
               param1.appendChild(_loc5_);
            }
         }
         return true;
      }
      
      private function setFrameAttribute(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:KeyValuePair = null;
         for(_loc2_ in this.m_objPropertyMap.getDataMap())
         {
            _loc3_ = this.m_objPropertyMap.getDataMap()[_loc2_];
            if(_loc3_.Key == Wnd_Property.WND_KEY)
            {
               param1.key = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_X)
            {
               param1.x = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_Y)
            {
               param1.y = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_WIDTH)
            {
               param1.width = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_HEIGHT)
            {
               param1.height = _loc3_.Value;
            }
            if(_loc3_.Key == "descript")
            {
               param1.descript = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_REALTIME)
            {
               param1.realtime = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_ID)
            {
               param1.id = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_VALUE)
            {
               param1.value = _loc3_.Value;
            }
         }
      }
      
      private function setConponentAttribute(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:KeyValuePair = null;
         for(_loc2_ in this.m_objPropertyMap.getDataMap())
         {
            _loc3_ = this.m_objPropertyMap.getDataMap()[_loc2_];
            this.setFrameAttribute(param1);
            if(_loc3_.Key == Wnd_Property.WND_MIN)
            {
               param1.min = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_MAX)
            {
               param1.max = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_INDEX)
            {
               param1.index = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_ENABLELIST)
            {
               param1.enable_list = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_CHECKFLAG)
            {
               param1.checkflag = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_SHOWLIST)
            {
               param1.show_list = _loc3_.Value;
            }
            if(_loc3_.Key == Wnd_Property.WND_SHOW)
            {
               param1.show = _loc3_.Value;
            }
         }
      }
      
      public function parse(param1:XMLDocument) : Boolean
      {
         var _loc6_:String = null;
         var _loc7_:WndConfig = null;
         if(null == param1)
         {
            return false;
         }
         this.m_strWndType = param1.firstChild.nodeName;
         if(this.m_strWndType == Wnd_Type.TAB_CONTROL || this.m_strWndType == Wnd_Type.Tab || this.m_strWndType == Wnd_Type.Group)
         {
            this.setFrameProperty(param1);
         }
         else
         {
            this.setComponentProperty(param1);
         }
         var _loc2_:int = param1.firstChild.childNodes.length;
         var _loc3_:int = 0;
         var _loc4_:String = param1.firstChild.childNodes[_loc3_];
         var _loc5_:XMLDocument = null;
         while(_loc3_ < _loc2_)
         {
            if(null != _loc4_ && _loc4_.indexOf("<") != -1)
            {
               _loc5_ = new XMLDocument(_loc4_);
               _loc6_ = _loc5_.firstChild.nodeName;
               _loc7_ = new WndConfig();
               _loc7_.parse(_loc5_);
               this.m_objChildWndList.push(_loc7_);
            }
            _loc3_++;
            _loc4_ = param1.firstChild.childNodes[_loc3_];
         }
         this.m_objChildWndList.sort(this.sorts);
         return true;
      }
      
      private function compare(param1:int, param2:int) : int
      {
         if(param1 > param2)
         {
            return 1;
         }
         if(param1 < param2)
         {
            return -1;
         }
         return 0;
      }
      
      private function sorts(param1:WndConfig, param2:WndConfig) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc3_:String = param1.getWndType();
         if(_loc3_ == Wnd_Type.ActionButton || _loc3_ == Wnd_Type.Checkbox || _loc3_ == Wnd_Type.Combobox || _loc3_ == Wnd_Type.RadioButton || _loc3_ == Wnd_Type.Slider)
         {
            _loc4_ = int(param1.getProperty("x"));
            _loc5_ = int(param1.getProperty("Y"));
            _loc6_ = int(param2.getProperty("x"));
            _loc7_ = int(param2.getProperty("Y"));
            _loc8_ = this.compare(_loc4_,_loc6_);
            _loc9_ = this.compare(_loc5_,_loc7_);
            if(_loc8_ > 0)
            {
               return 1;
            }
            if(_loc8_ < 0)
            {
               return -1;
            }
            if(_loc9_ > 0)
            {
               return 1;
            }
            if(_loc9_ < 0)
            {
               return -1;
            }
            return 0;
         }
         return 0;
      }
      
      private function setProperty(param1:String, param2:String) : void
      {
         var _loc3_:KeyValuePair = this.m_objPropertyMap.find(param1);
         if(_loc3_ == null)
         {
            this.m_objPropertyMap.push(param1,param2);
         }
         else
         {
            _loc3_.Value = param2;
         }
      }
      
      private function setFrameProperty(param1:XMLDocument) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         _loc3_ = param1.firstChild.attributes.key;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_KEY;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.x;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_X;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.y;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_Y;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.width;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_WIDTH;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.height;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_HEIGHT;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.descript;
         if(_loc3_ != undefined)
         {
            _loc2_ = "descript";
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.realtime;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_REALTIME;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.id;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_ID;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.value;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_VALUE;
            this.setProperty(_loc2_,_loc3_);
         }
      }
      
      private function setComponentProperty(param1:XMLDocument) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         this.setFrameProperty(param1);
         _loc3_ = param1.firstChild.attributes.min;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_MIN;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.max;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_MAX;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.index;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_INDEX;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.enable_list;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_ENABLELIST;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.checkflag;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_CHECKFLAG;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.show_list;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_SHOWLIST;
            this.setProperty(_loc2_,_loc3_);
         }
         _loc3_ = param1.firstChild.attributes.show;
         if(_loc3_ != undefined)
         {
            _loc2_ = Wnd_Property.WND_SHOW;
            this.setProperty(_loc2_,_loc3_);
         }
      }
   }
}
