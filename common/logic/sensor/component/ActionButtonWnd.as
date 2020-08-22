package common.logic.sensor.component
{
   import common.logic.sensor.consts.Wnd_Property;
   import common.logic.sensor.styleparser.WndConfig;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import spark.components.Button;
   
   public class ActionButtonWnd extends Wnd
   {
       
      
      private var m_objButton:Button;
      
      private var m_iValue:int;
      
      private var m_iOldValue:int;
      
      private var m_iRealTime:int;
      
      public function ActionButtonWnd()
      {
         super();
      }
      
      override public function setToolTip(param1:String) : void
      {
         this.m_objButton.toolTip = param1;
      }
      
      override public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         var _loc3_:Rectangle = new Rectangle();
         if(!getPosition(param1,param2,_loc3_))
         {
            throw new Error("Actionbutton position failed");
         }
         var _loc4_:String = param2.getProperty(Wnd_Property.WND_ID);
         if(null == _loc4_)
         {
            throw new Error("Actionbutton config has no id");
         }
         var _loc5_:int = int(_loc4_);
         var _loc6_:String = getWndName(param2);
         if(null == _loc6_)
         {
            throw new Error("Actionbutton has no wnd name");
         }
         this.m_objButton = new Button();
         this.m_objButton.label = _loc6_;
         this.m_objButton.id = _loc5_.toString();
         this.m_objButton.x = _loc3_.x;
         this.m_objButton.y = _loc3_.y;
         this.m_objButton.width = _loc3_.width;
         this.m_objButton.height = _loc3_.height;
         this.m_objButton.visible = true;
         _loc4_ = param2.getProperty(Wnd_Property.WND_VALUE);
         if(null == _loc4_)
         {
            throw new Error("actionbutton has no property value");
         }
         this.m_iValue = int(_loc4_);
         _loc4_ = param2.getProperty(Wnd_Property.WND_REALTIME);
         if(null == _loc4_)
         {
            throw new Error("actionbutton has no property value");
         }
         this.m_iRealTime = int(_loc4_);
         this.m_objButton.addEventListener(MouseEvent.CLICK,this.Clicked_EventHandler);
         setTip(this,_loc5_);
         param1.addElementAt(this.m_objButton,param1.BottomChildNumber);
         param1.BottomChildNumber = param1.BottomChildNumber + 1;
         return 0;
      }
      
      public function Clicked_EventHandler(param1:MouseEvent) : void
      {
         if(1 != this.m_iRealTime)
         {
            return;
         }
         this.getParent().RealTime_Handler(this.m_iValue,this.m_iOldValue,int(this.m_objButton.id));
      }
      
      override public function EnableWindow(param1:Boolean) : void
      {
         this.m_objButton.enabled = param1;
      }
      
      override public function ShowWindow(param1:Boolean) : void
      {
         this.m_objButton.visible = param1;
      }
   }
}
