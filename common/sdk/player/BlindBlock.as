package common.sdk.player
{
   import flash.display.CapsStyle;
   import flash.display.LineScaleMode;
   import flash.geom.Rectangle;
   import spark.core.SpriteVisualElement;
   
   public class BlindBlock extends SpriteVisualElement
   {
       
      
      private var m_bUseFlag:Boolean;
      
      private var m_objRectangle:Rectangle;
      
      private var m_iIndex:uint;
      
      public function BlindBlock()
      {
         super();
         this.m_bUseFlag = false;
         this.m_objRectangle = null;
      }
      
      public function drawSelectedBlock() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(65535,0.2);
         this.graphics.lineStyle(0,8027511,0.2,true,LineScaleMode.NONE,CapsStyle.SQUARE);
         this.drawRect(this.m_objRectangle);
         this.m_bUseFlag = true;
      }
      
      public function clearBlock() : void
      {
         this.graphics.clear();
         this.drawBlock();
         this.m_bUseFlag = false;
      }
      
      public function get userFlag() : Boolean
      {
         return this.m_bUseFlag;
      }
      
      public function changeBlockSize(param1:Rectangle, param2:Boolean = true) : void
      {
         this.m_objRectangle = param1;
         if(param2)
         {
            this.x = this.m_objRectangle.x;
            this.y = this.m_objRectangle.y;
            this.width = this.m_objRectangle.width;
            this.height = this.m_objRectangle.height;
            this.m_objRectangle.x = 0;
            this.m_objRectangle.y = 0;
         }
      }
      
      public function drawBlock() : void
      {
         this.graphics.lineStyle(0,8027511,0.2,true,LineScaleMode.NONE,CapsStyle.SQUARE);
         this.drawRect(this.m_objRectangle);
      }
      
      private function drawRect(param1:Rectangle) : void
      {
         this.graphics.drawRect(param1.x,param1.y,param1.width,param1.height);
      }
   }
}
