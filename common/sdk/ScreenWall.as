package common.sdk
{
   import flash.events.MouseEvent;
   import flash.system.Capabilities;
   import mx.core.UIComponent;
   
   public class ScreenWall
   {
      
      public static const SCREEN_STYLE_UNSELECT:String = "VideoContainer";
      
      public static const SCREEN_STYLE_SELECT:String = "SelectedVideoContainer";
      
      public static const SCREEN_ID_PREFIX:String = "Screen";
       
      
      private var m_uLayoutMode:int;
      
      private var m_objScreenList:Vector.<Screen>;
      
      private var m_uScreenNum:uint;
      
      private var m_nWidth:Number;
      
      private var m_nHeight:Number;
      
      private var m_nInitHeight:Number;
      
      private var m_nInitWidth:Number;
      
      private var m_uCurrnetSelectedScreenIndex:uint;
      
      private var m_uOldSelectedScreenIndex:uint;
      
      private var m_objUIComponet:UIComponent;
      
      private var m_bScreenFullWall:Boolean;
      
      private var m_bFullWall:Boolean;
      
      private var m_objDoubleClickFunc:Function;
      
      public function ScreenWall(param1:Number, param2:Number, param3:UIComponent, param4:Function)
      {
         super();
         this.m_uScreenNum = 0;
         this.m_nInitWidth = this.m_nWidth = param1;
         this.m_nInitHeight = this.m_nHeight = param2;
         this.m_objUIComponet = param3;
         this.m_uCurrnetSelectedScreenIndex = 0;
         this.m_uOldSelectedScreenIndex = 0;
         this.m_bScreenFullWall = false;
         this.m_bFullWall = false;
         this.m_objScreenList = new Vector.<Screen>();
         this.m_objDoubleClickFunc = param4;
      }
      
      public function set FullWall(param1:Boolean) : void
      {
         this.m_bFullWall = param1;
      }
      
      public function resetWallSize(param1:Boolean) : void
      {
         if(param1)
         {
            this.m_nWidth = Capabilities.screenResolutionX;
            this.m_nHeight = Capabilities.screenResolutionY;
         }
         else
         {
            this.m_nWidth = this.m_nInitWidth;
            this.m_nHeight = this.m_nInitHeight;
         }
         this.resetScreen(this.m_uCurrnetSelectedScreenIndex - 1);
      }
      
      public function set screenNum(param1:uint) : void
      {
         this.m_uScreenNum = param1;
      }
      
      public function set layoutMode(param1:uint) : void
      {
         this.m_uLayoutMode = param1;
      }
      
      public function get currentSelectedScreenIndex() : uint
      {
         return this.m_uCurrnetSelectedScreenIndex;
      }
      
      public function createScreens() : void
      {
         var _loc2_:Screen = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.m_uScreenNum)
         {
            _loc2_ = new Screen();
            if(NVRVideoUIConst.LAYOUT_MODE_ONE == this.m_uLayoutMode)
            {
               this.changePosisition_OnOne(_loc2_);
               _loc2_.addEventListener(MouseEvent.CLICK,this.click_OnOne);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_FOUR == this.m_uLayoutMode)
            {
               this.changePosisition_OnFour(_loc2_,_loc1_);
               _loc2_.addEventListener(MouseEvent.CLICK,this.click_OnFour);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL == this.m_uLayoutMode)
            {
               this.changePosisition_OnSixNormal(_loc2_,_loc1_);
               _loc2_.addEventListener(MouseEvent.CLICK,this.click_OnSixNormal);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIX_SPECIAL == this.m_uLayoutMode)
            {
               this.changePosisition_OnSixSpecial(_loc2_,_loc1_);
               _loc2_.addEventListener(MouseEvent.CLICK,this.click_OnSixSpecial);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_EIGHT_SPECIAL == this.m_uLayoutMode)
            {
               this.changePosisition_OnEightSpecial(_loc2_,_loc1_);
               _loc2_.addEventListener(MouseEvent.CLICK,this.click_OnEightSpecia);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_NINE == this.m_uLayoutMode)
            {
               this.changePosisition_OnNine(_loc2_,_loc1_);
               _loc2_.addEventListener(MouseEvent.CLICK,this.click_OnNine);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIXTEEN == this.m_uLayoutMode)
            {
               this.changePosisition_OnSixteen(_loc2_,_loc1_);
               _loc2_.addEventListener(MouseEvent.CLICK,this.click_OnSixteen);
            }
            _loc2_.doubleClickEnabled = true;
            _loc2_.addEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClick);
            _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,_loc2_.changeCursorType);
            _loc2_.styleName = ScreenWall.SCREEN_STYLE_UNSELECT;
            _loc2_.id = ScreenWall.SCREEN_ID_PREFIX + _loc1_;
            _loc2_.useFlag = false;
            this.m_objScreenList.push(_loc2_);
            this.m_objUIComponet.addChild(_loc2_);
            _loc1_++;
         }
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex = 1;
         this.changeStyle();
      }
      
      public function changePosisition_OnOne(param1:Screen, param2:uint = 0) : void
      {
         param1.width = this.m_nWidth;
         param1.height = this.m_nHeight;
         param1.x = 0;
         param1.y = 0;
      }
      
      private function click_OnOne(param1:MouseEvent) : void
      {
         this.m_uCurrnetSelectedScreenIndex = 1;
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
         this.changeStyle();
      }
      
      private function changePosisition_OnFour(param1:Screen, param2:uint) : void
      {
         param1.width = this.m_nWidth * 2 / this.m_uScreenNum;
         param1.height = this.m_nHeight / 2;
         if(param2 % 2 == 0)
         {
            param1.x = 0;
            if(param2 == 0)
            {
               param1.y = 0;
            }
            else
            {
               param1.y = param1.height;
            }
         }
         else
         {
            param1.x = param1.width;
            if(param2 == 1)
            {
               param1.y = 0;
            }
            else
            {
               param1.y = param1.height;
            }
         }
      }
      
      public function adjustFullScreenSize() : void
      {
         if(this.m_bScreenFullWall)
         {
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].x = 0;
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].y = 0;
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].width = this.m_nWidth;
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].height = this.m_nHeight;
         }
      }
      
      private function click_OnFour(param1:MouseEvent) : void
      {
         if(this.m_bScreenFullWall)
         {
            return;
         }
         var _loc2_:Number = this.m_nWidth / 2;
         var _loc3_:Number = this.m_nHeight / 2;
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
         if(param1.stageX >= 0 && param1.stageX < _loc2_)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 1;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 3;
            }
         }
         else if(param1.stageY >= 0 && param1.stageY < _loc3_)
         {
            this.m_uCurrnetSelectedScreenIndex = 2;
         }
         else
         {
            this.m_uCurrnetSelectedScreenIndex = 4;
         }
         this.changeStyle();
      }
      
      private function doubleClick(param1:MouseEvent) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Screen = null;
         var _loc4_:Vector.<Screen> = null;
         var _loc5_:uint = 0;
         if(this.m_bScreenFullWall)
         {
            _loc2_ = 0;
            while(_loc2_ < this.m_objScreenList.length)
            {
               _loc3_ = this.m_objScreenList[_loc2_];
               if(NVRVideoUIConst.LAYOUT_MODE_ONE == this.m_uLayoutMode)
               {
                  this.changePosisition_OnOne(_loc3_);
               }
               else if(NVRVideoUIConst.LAYOUT_MODE_FOUR == this.m_uLayoutMode)
               {
                  this.changePosisition_OnFour(_loc3_,_loc2_);
               }
               else if(NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL == this.m_uLayoutMode)
               {
                  this.changePosisition_OnSixNormal(_loc3_,_loc2_);
               }
               else if(NVRVideoUIConst.LAYOUT_MODE_SIX_SPECIAL == this.m_uLayoutMode)
               {
                  this.changePosisition_OnSixSpecial(_loc3_,_loc2_);
               }
               else if(NVRVideoUIConst.LAYOUT_MODE_EIGHT_SPECIAL == this.m_uLayoutMode)
               {
                  this.changePosisition_OnEightSpecial(_loc3_,_loc2_);
               }
               else if(NVRVideoUIConst.LAYOUT_MODE_NINE == this.m_uLayoutMode)
               {
                  this.changePosisition_OnNine(_loc3_,_loc2_);
               }
               else if(NVRVideoUIConst.LAYOUT_MODE_SIXTEEN == this.m_uLayoutMode)
               {
                  this.changePosisition_OnSixteen(_loc3_,_loc2_);
               }
               this.m_objUIComponet.addChild(_loc3_);
               _loc2_++;
            }
         }
         else
         {
            _loc4_ = this.m_objScreenList.filter(this.filterOnFor);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               this.m_objUIComponet.removeChild(_loc4_[_loc5_]);
               _loc5_++;
            }
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].width = this.m_nWidth;
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].height = this.m_nHeight;
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].x = 0;
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].y = 0;
         }
         this.adjustScreenWidth();
         this.m_bScreenFullWall = !this.m_bScreenFullWall;
         if(null != this.m_objDoubleClickFunc)
         {
            this.m_objDoubleClickFunc.call(null,this.m_uCurrnetSelectedScreenIndex - 1,this.m_bScreenFullWall);
         }
      }
      
      private function filterOnFor(param1:*, param2:int, param3:Vector.<Screen>) : Boolean
      {
         return param2 != this.m_uCurrnetSelectedScreenIndex - 1;
      }
      
      private function click_OnSixNormal(param1:MouseEvent) : void
      {
         if(this.m_bScreenFullWall)
         {
            return;
         }
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
         var _loc2_:Number = this.m_nWidth / 3;
         var _loc3_:Number = this.m_nHeight / 2;
         if(param1.stageX >= 0 && param1.stageX < _loc2_)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 1;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 4;
            }
         }
         else if(param1.stageX >= _loc2_ && param1.stageX < _loc2_ * 2)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 2;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 5;
            }
         }
         else if(param1.stageY >= 0 && param1.stageY < _loc3_)
         {
            this.m_uCurrnetSelectedScreenIndex = 3;
         }
         else
         {
            this.m_uCurrnetSelectedScreenIndex = 6;
         }
         this.changeStyle();
      }
      
      private function changePosisition_OnSixNormal(param1:Screen, param2:uint) : void
      {
         param1.width = this.m_nWidth * 2 / this.m_uScreenNum;
         param1.height = this.m_nHeight / 2;
         if(0 == param2 % 3)
         {
            param1.x = 0;
            if(param2 == 0)
            {
               param1.y = 0;
            }
            else
            {
               param1.y = param1.height;
            }
         }
         else if(1 == param2 % 3)
         {
            param1.x = param1.width;
            if(1 == param2)
            {
               param1.y = 0;
            }
            else
            {
               param1.y = param1.height;
            }
         }
         else
         {
            param1.x = param1.width * 2;
            if(2 == param2)
            {
               param1.y = 0;
            }
            else
            {
               param1.y = param1.height;
            }
         }
      }
      
      private function changePosisition_OnSixSpecial(param1:Screen, param2:uint) : void
      {
         if(0 == param2)
         {
            param1.width = this.m_nWidth * 4 / this.m_uScreenNum;
            param1.height = this.m_nHeight * 2 / 3;
            param1.x = 0;
            param1.y = 0;
         }
         else
         {
            param1.width = this.m_nWidth * 2 / this.m_uScreenNum;
            param1.height = this.m_nHeight / 3;
            if(0 == param2 % 3)
            {
               param1.x = 0;
               param1.y = param1.height * 2;
            }
            else if(1 == param2 % 3)
            {
               if(1 == param2)
               {
                  param1.x = param1.width * 2;
                  param1.y = 0;
               }
               else
               {
                  param1.x = param1.width;
                  param1.y = param1.height * 2;
               }
            }
            else
            {
               param1.x = param1.width * 2;
               if(2 == param2)
               {
                  param1.y = param1.height;
               }
               else
               {
                  param1.y = param1.height * 2;
               }
            }
         }
      }
      
      protected function adjustScreenWidth() : void
      {
         if(!this.m_bFullWall)
         {
            return;
         }
         if(this.m_uLayoutMode == NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL)
         {
            if(this.m_objScreenList[1].x + this.m_objScreenList[1].width > this.m_objScreenList[2].x)
            {
               this.m_objScreenList[1].width = this.m_objScreenList[1].width - 1;
            }
         }
         if(this.m_uLayoutMode == NVRVideoUIConst.LAYOUT_MODE_NINE || this.m_uLayoutMode == NVRVideoUIConst.LAYOUT_MODE_SIX_SPECIAL || this.m_uLayoutMode == NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL)
         {
            if(this.m_objScreenList[4].x + this.m_objScreenList[4].width > this.m_objScreenList[5].x)
            {
               this.m_objScreenList[4].width = this.m_objScreenList[4].width - 1;
            }
         }
         if(this.m_uLayoutMode == NVRVideoUIConst.LAYOUT_MODE_NINE)
         {
            if(this.m_objScreenList[7].x + this.m_objScreenList[7].width > this.m_objScreenList[8].x)
            {
               this.m_objScreenList[7].width = this.m_objScreenList[7].width - 1;
            }
         }
      }
      
      private function changePosisition_OnEightSpecial(param1:Screen, param2:uint) : void
      {
         if(0 == param2)
         {
            param1.width = this.m_nWidth * 6 / this.m_uScreenNum;
            param1.height = this.m_nHeight * 3 / 4;
            param1.x = 0;
            param1.y = 0;
         }
         else
         {
            param1.width = this.m_nWidth * 2 / this.m_uScreenNum;
            param1.height = this.m_nHeight / 4;
            if(0 == param2 % 4)
            {
               param1.x = 0;
               param1.y = param1.height * 3;
            }
            else if(1 == param2 % 4)
            {
               if(1 == param2)
               {
                  param1.x = param1.width * 3;
                  param1.y = 0;
               }
               else
               {
                  param1.x = param1.width;
                  param1.y = param1.height * 3;
               }
            }
            else if(2 == param2 % 4)
            {
               if(2 == param2)
               {
                  param1.x = param1.width * 3;
                  param1.y = param1.height;
               }
               else
               {
                  param1.x = param1.width * 2;
                  param1.y = param1.height * 3;
               }
            }
            else
            {
               param1.x = param1.width * 3;
               if(3 == param2)
               {
                  param1.y = param1.height * 2;
               }
               else
               {
                  param1.y = param1.height * 3;
               }
            }
         }
      }
      
      private function changePosisition_OnNine(param1:Screen, param2:uint) : void
      {
         param1.width = this.m_nWidth * 3 / this.m_uScreenNum;
         param1.height = this.m_nHeight / 3;
         if(0 == param2 % 3)
         {
            param1.x = 0;
            if(param2 == 0)
            {
               param1.y = 0;
            }
            else if(param2 == 3)
            {
               param1.y = param1.height;
            }
            else
            {
               param1.y = param1.height * 2;
            }
         }
         else if(1 == param2 % 3)
         {
            param1.x = param1.width;
            if(1 == param2)
            {
               param1.y = 0;
            }
            else if(4 == param2)
            {
               param1.y = param1.height;
            }
            else
            {
               param1.y = param1.height * 2;
            }
         }
         else
         {
            param1.x = param1.width * 2;
            if(2 == param2)
            {
               param1.y = 0;
            }
            else if(5 == param2)
            {
               param1.y = param1.height;
            }
            else
            {
               param1.y = param1.height * 2;
            }
         }
      }
      
      private function changePosisition_OnSixteen(param1:Screen, param2:uint) : void
      {
         param1.width = this.m_nWidth * 4 / this.m_uScreenNum;
         param1.height = this.m_nHeight / 4;
         if(0 == param2 % 4)
         {
            param1.x = 0;
            if(param2 == 0)
            {
               param1.y = 0;
            }
            else if(param2 == 4)
            {
               param1.y = param1.height;
            }
            else if(param2 == 8)
            {
               param1.y = param1.height * 2;
            }
            else
            {
               param1.y = param1.height * 3;
            }
         }
         else if(1 == param2 % 4)
         {
            param1.x = param1.width;
            if(1 == param2)
            {
               param1.y = 0;
            }
            else if(5 == param2)
            {
               param1.y = param1.height;
            }
            else if(9 == param2)
            {
               param1.y = param1.height * 2;
            }
            else
            {
               param1.y = param1.height * 3;
            }
         }
         else if(2 == param2 % 4)
         {
            param1.x = param1.width * 2;
            if(2 == param2)
            {
               param1.y = 0;
            }
            else if(6 == param2)
            {
               param1.y = param1.height;
            }
            else if(10 == param2)
            {
               param1.y = param1.height * 2;
            }
            else
            {
               param1.y = param1.height * 3;
            }
         }
         else
         {
            param1.x = param1.width * 3;
            if(3 == param2)
            {
               param1.y = 0;
            }
            else if(7 == param2)
            {
               param1.y = param1.height;
            }
            else if(11 == param2)
            {
               param1.y = param1.height * 2;
            }
            else
            {
               param1.y = param1.height * 3;
            }
         }
      }
      
      private function click_OnSixteen(param1:MouseEvent) : void
      {
         if(this.m_bScreenFullWall)
         {
            return;
         }
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
         var _loc2_:Number = this.m_nWidth / 4;
         var _loc3_:Number = this.m_nHeight / 4;
         if(param1.stageX >= 0 && param1.stageX < _loc2_)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 1;
            }
            else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
            {
               this.m_uCurrnetSelectedScreenIndex = 5;
            }
            else if(param1.stageY >= _loc3_ * 2 && param1.stageY < _loc3_ * 3)
            {
               this.m_uCurrnetSelectedScreenIndex = 9;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 13;
            }
         }
         else if(param1.stageX >= _loc2_ && param1.stageX < _loc2_ * 2)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 2;
            }
            else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
            {
               this.m_uCurrnetSelectedScreenIndex = 6;
            }
            else if(param1.stageY >= _loc3_ * 2 && param1.stageY < _loc3_ * 3)
            {
               this.m_uCurrnetSelectedScreenIndex = 10;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 14;
            }
         }
         else if(param1.stageX >= _loc2_ * 2 && param1.stageX < _loc2_ * 3)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 3;
            }
            else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
            {
               this.m_uCurrnetSelectedScreenIndex = 7;
            }
            else if(param1.stageY >= _loc3_ * 2 && param1.stageY < _loc3_ * 3)
            {
               this.m_uCurrnetSelectedScreenIndex = 11;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 15;
            }
         }
         else if(param1.stageY >= 0 && param1.stageY < _loc3_)
         {
            this.m_uCurrnetSelectedScreenIndex = 4;
         }
         else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
         {
            this.m_uCurrnetSelectedScreenIndex = 8;
         }
         else if(param1.stageY >= _loc3_ * 2 && param1.stageY < _loc3_ * 3)
         {
            this.m_uCurrnetSelectedScreenIndex = 12;
         }
         else
         {
            this.m_uCurrnetSelectedScreenIndex = 16;
         }
         this.changeStyle();
      }
      
      private function click_OnNine(param1:MouseEvent) : void
      {
         if(this.m_bScreenFullWall)
         {
            return;
         }
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
         var _loc2_:Number = this.m_nWidth / 3;
         var _loc3_:Number = this.m_nHeight / 3;
         if(param1.stageX >= 0 && param1.stageX < _loc2_)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 1;
            }
            else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
            {
               this.m_uCurrnetSelectedScreenIndex = 4;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 7;
            }
         }
         else if(param1.stageX >= _loc2_ && param1.stageX < _loc2_ * 2)
         {
            if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 2;
            }
            else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
            {
               this.m_uCurrnetSelectedScreenIndex = 5;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 8;
            }
         }
         else if(param1.stageY >= 0 && param1.stageY < _loc3_)
         {
            this.m_uCurrnetSelectedScreenIndex = 3;
         }
         else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
         {
            this.m_uCurrnetSelectedScreenIndex = 6;
         }
         else
         {
            this.m_uCurrnetSelectedScreenIndex = 9;
         }
         this.changeStyle();
      }
      
      private function click_OnSixSpecial(param1:MouseEvent) : void
      {
         if(this.m_bScreenFullWall)
         {
            return;
         }
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
         var _loc2_:Number = this.m_nWidth / 3;
         var _loc3_:Number = this.m_nHeight / 3;
         if(param1.stageY >= 0 && param1.stageY < _loc3_ * 2)
         {
            if(param1.stageX >= 0 && param1.stageX < _loc2_ * 2)
            {
               this.m_uCurrnetSelectedScreenIndex = 1;
            }
            else if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 2;
            }
            else
            {
               this.m_uCurrnetSelectedScreenIndex = 3;
            }
         }
         else if(param1.stageX >= 0 && param1.stageX < _loc2_)
         {
            this.m_uCurrnetSelectedScreenIndex = 4;
         }
         else if(param1.stageX >= _loc2_ && param1.stageX < _loc2_ * 2)
         {
            this.m_uCurrnetSelectedScreenIndex = 5;
         }
         else
         {
            this.m_uCurrnetSelectedScreenIndex = 6;
         }
         this.changeStyle();
      }
      
      private function click_OnEightSpecia(param1:MouseEvent) : void
      {
         if(this.m_bScreenFullWall)
         {
            return;
         }
         this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
         var _loc2_:Number = this.m_nWidth / 4;
         var _loc3_:Number = this.m_nHeight / 4;
         if(param1.stageY >= 0 && param1.stageY < _loc3_ * 3)
         {
            if(param1.stageX >= 0 && param1.stageX < _loc2_ * 3)
            {
               this.m_uCurrnetSelectedScreenIndex = 1;
            }
            else if(param1.stageY >= 0 && param1.stageY < _loc3_)
            {
               this.m_uCurrnetSelectedScreenIndex = 2;
            }
            else if(param1.stageY >= _loc3_ && param1.stageY < _loc3_ * 2)
            {
               this.m_uCurrnetSelectedScreenIndex = 3;
            }
            else if(param1.stageY >= _loc3_ * 2 && param1.stageY < _loc3_ * 3)
            {
               this.m_uCurrnetSelectedScreenIndex = 4;
            }
         }
         else if(param1.stageX >= 0 && param1.stageX < _loc2_)
         {
            this.m_uCurrnetSelectedScreenIndex = 5;
         }
         else if(param1.stageX >= _loc2_ && param1.stageX < _loc2_ * 2)
         {
            this.m_uCurrnetSelectedScreenIndex = 6;
         }
         else if(param1.stageX >= _loc2_ * 2 && param1.stageX < _loc2_ * 3)
         {
            this.m_uCurrnetSelectedScreenIndex = 7;
         }
         else
         {
            this.m_uCurrnetSelectedScreenIndex = 8;
         }
         this.changeStyle();
      }
      
      private function changeStyle() : void
      {
         if(0 != this.m_uOldSelectedScreenIndex)
         {
            this.m_objScreenList[this.m_uOldSelectedScreenIndex - 1].styleName = ScreenWall.SCREEN_STYLE_UNSELECT;
         }
         if(0 != this.m_uCurrnetSelectedScreenIndex)
         {
            this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].styleName = ScreenWall.SCREEN_STYLE_SELECT;
         }
      }
      
      public function addScreen() : void
      {
         this.changeCurrentLayoutMode(this.m_objScreenList.length);
         this.removeListener();
         var _loc1_:Screen = new Screen();
         this.m_objScreenList.push(_loc1_);
         _loc1_.useFlag = false;
         this.m_objUIComponet.addChild(_loc1_);
         this.m_uCurrnetSelectedScreenIndex = this.m_objScreenList.length;
         this.changeCurrentLayoutMode(this.m_objScreenList.length);
         this.resetScreen(this.m_uCurrnetSelectedScreenIndex - 1);
      }
      
      public function removeScreen(param1:uint) : void
      {
         var _loc2_:Screen = this.m_objScreenList[param1];
         _loc2_.useFlag = false;
         this.m_objUIComponet.removeChild(_loc2_);
         this.removeListener();
         this.m_objScreenList.splice(param1,1);
         if(param1 != this.m_uCurrnetSelectedScreenIndex)
         {
            this.m_uCurrnetSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex - 1;
            this.m_uOldSelectedScreenIndex = this.m_uOldSelectedScreenIndex - 1;
         }
         else
         {
            this.m_uCurrnetSelectedScreenIndex = 0;
            this.m_uOldSelectedScreenIndex = 0;
         }
         this.changeCurrentLayoutMode(this.m_objScreenList.length);
         this.resetScreen(this.m_uCurrnetSelectedScreenIndex - 1);
      }
      
      public function removeAllScreen() : void
      {
         var _loc2_:uint = 0;
         if(this.m_bScreenFullWall)
         {
            this.m_objUIComponet.removeChild(this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1]);
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < this.m_objScreenList.length)
            {
               this.m_objUIComponet.removeChild(this.m_objScreenList[_loc2_]);
               _loc2_++;
            }
         }
         this.removeListener();
         var _loc1_:uint = 0;
         while(_loc1_ < this.m_objScreenList.length)
         {
            this.m_objScreenList[_loc1_].removeAllElements();
            this.m_objScreenList[_loc1_].removeEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClick);
            this.m_objScreenList[_loc1_] = null;
            _loc1_++;
         }
      }
      
      private function resetScreen(param1:int) : void
      {
         var _loc3_:Screen = null;
         var _loc2_:uint = 0;
         while(_loc2_ < this.m_objScreenList.length)
         {
            _loc3_ = this.m_objScreenList[_loc2_];
            if(NVRVideoUIConst.LAYOUT_MODE_ONE == this.m_uLayoutMode)
            {
               this.changePosisition_OnOne(_loc3_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.click_OnOne);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_FOUR == this.m_uLayoutMode)
            {
               this.changePosisition_OnFour(_loc3_,_loc2_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.click_OnFour);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL == this.m_uLayoutMode)
            {
               this.changePosisition_OnSixNormal(_loc3_,_loc2_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.click_OnSixNormal);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIX_SPECIAL == this.m_uLayoutMode)
            {
               this.changePosisition_OnSixSpecial(_loc3_,_loc2_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.click_OnSixSpecial);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_EIGHT_SPECIAL == this.m_uLayoutMode)
            {
               this.changePosisition_OnEightSpecial(_loc3_,_loc2_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.click_OnEightSpecia);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_NINE == this.m_uLayoutMode)
            {
               this.changePosisition_OnNine(_loc3_,_loc2_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.click_OnNine);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIXTEEN == this.m_uLayoutMode)
            {
               this.changePosisition_OnSixteen(_loc3_,_loc2_);
               _loc3_.addEventListener(MouseEvent.CLICK,this.click_OnSixteen);
            }
            if(param1 == _loc2_)
            {
               _loc3_.styleName = ScreenWall.SCREEN_STYLE_SELECT;
            }
            else
            {
               _loc3_.styleName = ScreenWall.SCREEN_STYLE_UNSELECT;
            }
            _loc3_.id = ScreenWall.SCREEN_ID_PREFIX + _loc2_;
            _loc3_.doubleClickEnabled = true;
            _loc3_.addEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClick);
            _loc2_++;
         }
         this.adjustScreenWidth();
      }
      
      private function removeListener() : void
      {
         var _loc2_:Screen = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.m_objScreenList.length)
         {
            _loc2_ = this.m_objScreenList[_loc1_];
            if(NVRVideoUIConst.LAYOUT_MODE_ONE == this.m_uLayoutMode)
            {
               _loc2_.removeEventListener(MouseEvent.CLICK,this.click_OnOne);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_FOUR == this.m_uLayoutMode)
            {
               _loc2_.removeEventListener(MouseEvent.CLICK,this.click_OnFour);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL == this.m_uLayoutMode)
            {
               _loc2_.removeEventListener(MouseEvent.CLICK,this.click_OnSixNormal);
            }
            else if(NVRVideoUIConst.LAYOUT_MODE_SIX_SPECIAL == this.m_uLayoutMode)
            {
               _loc2_.removeEventListener(MouseEvent.CLICK,this.click_OnSixSpecial);
            }
            _loc2_.removeEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClick);
            _loc1_++;
         }
      }
      
      private function changeCurrentLayoutMode(param1:uint) : void
      {
         if(param1 <= 1)
         {
            this.m_uLayoutMode = NVRVideoUIConst.LAYOUT_MODE_ONE;
            this.m_uScreenNum = 1;
         }
         else if(param1 <= 4 && param1 > 1)
         {
            this.m_uLayoutMode = NVRVideoUIConst.LAYOUT_MODE_FOUR;
            this.m_uScreenNum = 4;
         }
         else if(param1 > 4 && param1 <= 6)
         {
            this.m_uLayoutMode = NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL;
            this.m_uScreenNum = 6;
         }
      }
      
      public function getScreen(param1:int) : Screen
      {
         if(param1 < 0 || this.m_objScreenList.length - 1 < param1)
         {
            return null;
         }
         return this.m_objScreenList[param1];
      }
      
      public function getScreenIndex(param1:Boolean = true) : int
      {
         if(this.m_uCurrnetSelectedScreenIndex > 0 && !this.m_objScreenList[this.m_uCurrnetSelectedScreenIndex - 1].useFlag)
         {
            return this.m_uCurrnetSelectedScreenIndex - 1;
         }
         return this.selectFirstNoUseScreen(param1);
      }
      
      public function selectFirstNoUseScreen(param1:Boolean = true) : int
      {
         var _loc3_:Screen = null;
         var _loc2_:uint = 0;
         while(_loc2_ < this.m_objScreenList.length)
         {
            _loc3_ = this.m_objScreenList[_loc2_];
            if(!_loc3_.useFlag)
            {
               this.m_uOldSelectedScreenIndex = this.m_uCurrnetSelectedScreenIndex;
               this.m_uCurrnetSelectedScreenIndex = _loc2_ + 1;
               if(param1)
               {
                  this.changeStyle();
               }
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function getScreenNum(param1:int) : int
      {
         if(NVRVideoUIConst.LAYOUT_MODE_ONE == param1)
         {
            return 1;
         }
         if(NVRVideoUIConst.LAYOUT_MODE_FOUR == param1)
         {
            return 4;
         }
         if(NVRVideoUIConst.LAYOUT_MODE_SIX_NORMAL == param1)
         {
            return 6;
         }
         if(NVRVideoUIConst.LAYOUT_MODE_SIX_SPECIAL == param1)
         {
            return 6;
         }
         return -1;
      }
      
      public function isUse() : Boolean
      {
         var _loc2_:Screen = null;
         var _loc1_:uint = 0;
         while(_loc1_ < this.m_objScreenList.length)
         {
            _loc2_ = this.m_objScreenList[_loc1_];
            if(_loc2_.useFlag)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
   }
}
