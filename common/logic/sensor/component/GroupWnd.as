package common.logic.sensor.component
{
   import common.logic.sensor.styleparser.WndConfig;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   import spark.components.BorderContainer;
   
   public class GroupWnd extends Wnd
   {
       
      
      private var m_objBorderContainer:BorderContainer;
      
      private var m_iBottomChildCount:int = 0;
      
      public function GroupWnd()
      {
         super();
      }
      
      override public function setToolTip(param1:String) : void
      {
         this.m_objBorderContainer.toolTip = param1;
      }
      
      override public function getRealWnd() : UIComponent
      {
         return this.m_objBorderContainer;
      }
      
      override public function CreateWnd(param1:Wnd, param2:WndConfig) : int
      {
         var _loc3_:Rectangle = new Rectangle();
         if(!getPosition(param1,param2,_loc3_))
         {
            throw new Error("group position error");
         }
         var _loc4_:String = getWndName(param2);
         if(null == _loc4_)
         {
            throw new Error("group has no wnd name");
         }
         this.m_objBorderContainer = new BorderContainer();
         this.m_objBorderContainer.name = _loc4_;
         this.m_objBorderContainer.x = _loc3_.x;
         this.m_objBorderContainer.y = _loc3_.y;
         this.m_objBorderContainer.width = _loc3_.width;
         this.m_objBorderContainer.height = _loc3_.height;
         param1.addElement(this.m_objBorderContainer);
         return 0;
      }
      
      override public function addElementAt(param1:UIComponent, param2:int) : void
      {
         this.m_objBorderContainer.addElementAt(param1,param2);
      }
      
      override public function get BottomChildNumber() : int
      {
         return this.m_iBottomChildCount;
      }
      
      override public function set BottomChildNumber(param1:int) : void
      {
         this.m_iBottomChildCount = param1;
      }
      
      override public function RealTime_Handler(param1:int, param2:int, param3:int) : void
      {
         this.getParent().RealTime_Handler(param1,param2,param3);
      }
   }
}
