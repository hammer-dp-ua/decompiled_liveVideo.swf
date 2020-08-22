package common.sdk.player
{
   import common.sdk.LanguageConst;
   import common.sdk.LanguageXMLManager;
   import common.sdk.Screen;
   import flash.display.CapsStyle;
   import flash.display.LineScaleMode;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import mx.controls.Alert;
   import spark.core.SpriteVisualElement;
   
   public class BlindRegion
   {
      
      public static const MAX_DETECTION_AREA_NUM:int = 8;
       
      
      private var m_objScreen:Screen;
      
      private var m_objRectArray:Array;
      
      private var _iLanguageId:int;
      
      private var m_objLanguageXMLManager:LanguageXMLManager;
      
      private var m_nVideoWidth:Number;
      
      private var m_nVideoHeight:Number;
      
      private var m_nMoveWidth:Number;
      
      private var m_nMoveHeight:Number;
      
      private var m_nMouseDownX:Number;
      
      private var m_nMouseDownY:Number;
      
      private var m_bMouseDownFlag:Boolean;
      
      private var m_bBeyondAreaFlag:Boolean;
      
      private var m_objBlindRegionSprite:SpriteVisualElement;
      
      private var m_iTrackNum:int;
      
      private var m_objRcRect:Rectangle;
      
      private var m_iColorFlag:int;
      
      private var m_iVideoUseType:int;
      
      private var m_iMaxAreaNum:int;
      
      private var m_objBlindBlockList:Vector.<BlindBlock>;
      
      private var m_nWidthBlock:Number;
      
      private var m_nHeightBlock:Number;
      
      private var m_uWidthBlocks:uint = 22;
      
      private var m_uHeightBlocks:uint = 18;
      
      private var s:Number = 0;
      
      private var t:Number = 0;
      
      private var f:String;
      
      public function BlindRegion(param1:Screen, param2:int, param3:int, param4:int)
      {
         super();
         this._iLanguageId = 1;
         var _loc5_:Object = ExternalInterface.call("getLanguageId");
         if(null != _loc5_)
         {
            this._iLanguageId = int(_loc5_);
         }
         this.m_objLanguageXMLManager = new LanguageXMLManager(LanguageConst.File_Name_VideoParam,param4);
         this.m_objLanguageXMLManager.loaderXML();
         this.m_objScreen = param1;
         this.m_objBlindRegionSprite = new SpriteVisualElement();
         this.m_objBlindBlockList = new Vector.<BlindBlock>();
         if(3 == param3)
         {
            this.m_objScreen.addElementAt(this.m_objBlindRegionSprite,this.m_objScreen.numElements);
         }
         this.m_objRcRect = new Rectangle(0,0,this.m_objScreen.width,this.m_objScreen.height);
         this.m_nVideoWidth = this.m_objScreen.width;
         this.m_nVideoHeight = this.m_objScreen.height;
         this.m_objRectArray = new Array();
         this.m_bMouseDownFlag = false;
         this.m_nMoveWidth = 0;
         this.m_nMoveHeight = 0;
         this.m_bBeyondAreaFlag = false;
         this.m_iColorFlag = param2;
         this.m_iVideoUseType = param3;
         this.m_iMaxAreaNum = MAX_DETECTION_AREA_NUM;
         this.m_iTrackNum = 0;
         this.m_nWidthBlock = 0;
         this.m_nHeightBlock = 0;
      }
      
      public function init(param1:uint, param2:uint) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Rectangle = null;
         var _loc10_:BlindBlock = null;
         if(param1 != 0 && param2 != 0)
         {
            this.m_uWidthBlocks = param1;
            this.m_uHeightBlocks = param2;
         }
         this.m_nWidthBlock = this.m_nVideoWidth / this.m_uWidthBlocks;
         this.m_nHeightBlock = this.m_nVideoHeight / this.m_uHeightBlocks;
         var _loc3_:int = 0;
         while(_loc3_ < this.m_uHeightBlocks)
         {
            _loc4_ = 0;
            while(_loc4_ < this.m_uWidthBlocks)
            {
               _loc5_ = _loc4_ * this.m_nWidthBlock;
               _loc6_ = _loc3_ * this.m_nHeightBlock;
               _loc7_ = this.m_nWidthBlock;
               _loc8_ = this.m_nHeightBlock;
               _loc9_ = new Rectangle(_loc5_,_loc6_,_loc7_,_loc8_);
               _loc10_ = new BlindBlock();
               _loc10_.changeBlockSize(_loc9_);
               _loc10_.drawBlock();
               this.m_objBlindBlockList.push(_loc10_);
               this.m_objScreen.addElementAt(_loc10_,this.m_objScreen.numElements);
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function addEventListener() : void
      {
         this.m_objScreen.addEventListener(MouseEvent.MOUSE_DOWN,this.MouseDown_ClickedHandler);
         this.m_objScreen.addEventListener(MouseEvent.MOUSE_MOVE,this.MouseMove_ClickedHandler);
         this.m_objScreen.addEventListener(MouseEvent.MOUSE_UP,this.MouseUp_ClickedHandler);
      }
      
      public function MouseDown_ClickedHandler(param1:MouseEvent) : void
      {
         this.m_nMoveWidth = 0;
         this.m_nMoveHeight = 0;
         this.m_bMouseDownFlag = true;
         this.m_nMouseDownX = param1.stageX - 1;
         this.m_nMouseDownY = param1.stageY - 1;
      }
      
      public function MouseMove_ClickedHandler(param1:MouseEvent) : void
      {
         if(this.m_bMouseDownFlag)
         {
            if(param1.stageX - 1 >= this.m_nVideoWidth || param1.stageY - 1 >= this.m_nVideoHeight || param1.stageX - 1 <= 0 || param1.stageY - 1 <= 0)
            {
               this.m_bBeyondAreaFlag = true;
               return;
            }
            this.m_bBeyondAreaFlag = false;
            this.m_nMoveWidth = param1.stageX - 1 - this.m_nMouseDownX;
            this.m_nMoveHeight = param1.stageY - 1 - this.m_nMouseDownY;
         }
      }
      
      public function MouseUp_ClickedHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:Rectangle = null;
         if(!this.m_bBeyondAreaFlag && this.m_bMouseDownFlag)
         {
            if(this.m_iVideoUseType == 3 && this.m_nMoveHeight == 0 && this.m_nMoveWidth == 0)
            {
               this.clear();
               this.m_bBeyondAreaFlag = false;
               this.m_bMouseDownFlag = false;
               return;
            }
            if(this.m_nMoveHeight < 0)
            {
               this.m_nMouseDownY = this.m_nMouseDownY + this.m_nMoveHeight;
               this.m_nMoveHeight = Math.abs(this.m_nMoveHeight);
            }
            if(this.m_nMoveWidth < 0)
            {
               this.m_nMouseDownX = this.m_nMouseDownX + this.m_nMoveWidth;
               this.m_nMoveWidth = Math.abs(this.m_nMoveWidth);
            }
            if(this.m_iVideoUseType == 3 && this.m_nMoveHeight <= 16 && this.m_nMoveHeight >= 0 && this.m_nMoveWidth <= 16 && this.m_nMoveWidth >= 0)
            {
               this.clear();
               this.m_bMouseDownFlag = false;
               return;
            }
            if(this.m_iVideoUseType == 3 && this.m_iTrackNum + 1 > this.m_iMaxAreaNum)
            {
               _loc2_ = this.m_objLanguageXMLManager.getNameById("privacyPrompt");
               Alert.show(_loc2_ + this.m_iMaxAreaNum + "!");
            }
            else
            {
               _loc3_ = new Rectangle();
               this.setRectangleValue(this.m_nMouseDownX,this.m_nMouseDownY,this.m_nMoveWidth,this.m_nMoveHeight,_loc3_);
               if(this.m_iVideoUseType == 3)
               {
                  this.drawRect(_loc3_);
                  this.m_objRectArray.push(_loc3_);
                  this.m_iTrackNum++;
               }
               else if(this.m_nMoveHeight == 0 && this.m_nMoveWidth == 0)
               {
                  this.reverseBlockForClick(_loc3_);
               }
               else
               {
                  this.drawSelectedBlock(_loc3_);
               }
            }
         }
         this.clear();
         this.m_bBeyondAreaFlag = false;
         this.m_bMouseDownFlag = false;
      }
      
      public function set MaxAreaNum(param1:int) : void
      {
         if(param1 == -1)
         {
            return;
         }
         this.m_iMaxAreaNum = param1;
      }
      
      public function changeAreaMask(param1:int) : void
      {
         this.m_iColorFlag = param1;
         this.reDrawRect();
      }
      
      private function reDrawRect() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Rectangle = null;
         if(this.m_iVideoUseType == 3)
         {
            this.m_objBlindRegionSprite.graphics.clear();
            _loc1_ = 0;
            while(_loc1_ < this.m_objRectArray.length)
            {
               _loc2_ = this.m_objRectArray[_loc1_];
               this.drawRect(_loc2_);
               _loc1_++;
            }
         }
         else
         {
            this.selectBlock();
         }
      }
      
      private function drawRect(param1:Rectangle) : void
      {
         if(this.m_iColorFlag == 1 && this.m_iVideoUseType == 2)
         {
            this.m_objBlindRegionSprite.graphics.lineStyle(1,16711680,1,true,LineScaleMode.NONE,CapsStyle.SQUARE);
         }
         else
         {
            this.m_objBlindRegionSprite.graphics.lineStyle(1,65280,1,true,LineScaleMode.NONE,CapsStyle.SQUARE);
         }
         this.m_objBlindRegionSprite.graphics.moveTo(param1.x,param1.y);
         this.m_objBlindRegionSprite.graphics.lineTo(param1.x,param1.y + param1.height);
         this.m_objBlindRegionSprite.graphics.lineTo(param1.x + param1.width,param1.y + param1.height);
         this.m_objBlindRegionSprite.graphics.lineTo(param1.x + param1.width,param1.y);
         this.m_objBlindRegionSprite.graphics.lineTo(param1.x,param1.y);
      }
      
      private function selectBlock() : void
      {
         var _loc1_:* = null;
         var _loc2_:uint = 0;
         var _loc3_:BlindBlock = null;
         for(_loc1_ in this.m_objBlindBlockList)
         {
            _loc2_ = uint(this.m_objRectArray[_loc1_]);
            _loc3_ = this.m_objBlindBlockList[_loc1_];
            if(_loc2_)
            {
               if(!_loc3_.userFlag)
               {
                  _loc3_.drawSelectedBlock();
               }
            }
         }
      }
      
      private function reverseBlockForClick(param1:Rectangle) : void
      {
         var _loc2_:* = null;
         var _loc3_:BlindBlock = null;
         for(_loc2_ in this.m_objBlindBlockList)
         {
            _loc3_ = this.m_objBlindBlockList[_loc2_];
            if(_loc3_.x <= param1.x && _loc3_.x + _loc3_.width > param1.x && _loc3_.y <= param1.y && _loc3_.y + _loc3_.height > param1.y && param1.width == 0 && param1.height == 0)
            {
               if(_loc3_.userFlag)
               {
                  _loc3_.clearBlock();
               }
               else
               {
                  _loc3_.drawSelectedBlock();
               }
               break;
            }
         }
      }
      
      public function reverseBlocks() : void
      {
         var _loc1_:* = null;
         var _loc2_:BlindBlock = null;
         for(_loc1_ in this.m_objBlindBlockList)
         {
            _loc2_ = this.m_objBlindBlockList[_loc1_];
            if(_loc2_.userFlag)
            {
               _loc2_.clearBlock();
            }
            else
            {
               _loc2_.drawSelectedBlock();
            }
         }
      }
      
      public function clearBlocks() : void
      {
         var _loc1_:* = null;
         var _loc2_:BlindBlock = null;
         for(_loc1_ in this.m_objBlindBlockList)
         {
            _loc2_ = this.m_objBlindBlockList[_loc1_];
            if(_loc2_.userFlag)
            {
               _loc2_.clearBlock();
            }
         }
      }
      
      private function drawSelectedBlock(param1:Rectangle) : void
      {
         var _loc2_:* = null;
         var _loc3_:BlindBlock = null;
         for(_loc2_ in this.m_objBlindBlockList)
         {
            _loc3_ = this.m_objBlindBlockList[_loc2_];
            if(_loc3_.x < param1.x && _loc3_.x + _loc3_.width > param1.x && _loc3_.y < param1.y && _loc3_.y + _loc3_.height > param1.y || _loc3_.x < param1.x && _loc3_.x + _loc3_.width > param1.x && _loc3_.y > param1.y && param1.y + param1.height > _loc3_.y || _loc3_.y < param1.y && _loc3_.y + _loc3_.height > param1.y && _loc3_.x > param1.x && param1.x + param1.width > _loc3_.x)
            {
               _loc3_.drawSelectedBlock();
            }
            else if(_loc3_.x >= param1.x && _loc3_.x < param1.x + param1.width && (_loc3_.y >= param1.y && _loc3_.y < param1.y + param1.height))
            {
               _loc3_.drawSelectedBlock();
            }
         }
      }
      
      public function popRegion() : Boolean
      {
         if(this.m_objRectArray.length <= 0)
         {
            return true;
         }
         this.m_objRectArray.pop();
         this.m_iTrackNum--;
         this.reDrawRect();
         return true;
      }
      
      public function getRegion() : String
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:Rectangle = null;
         var _loc5_:* = null;
         var _loc6_:BlindBlock = null;
         var _loc1_:* = "";
         if(this.m_iVideoUseType == 3)
         {
            for(_loc2_ in this.m_objRectArray)
            {
               _loc4_ = this.m_objRectArray[_loc2_];
               _loc1_ = _loc1_ + (int(_loc4_.x * 100 / this.m_objRcRect.width) + "," + int(_loc4_.y * 100 / this.m_objRcRect.height) + "," + int(_loc4_.width * 100 / this.m_objRcRect.width) + "," + int(_loc4_.height * 100 / this.m_objRcRect.height) + " ");
            }
            _loc3_ = 0;
            while(_loc3_ < MAX_DETECTION_AREA_NUM - this.m_objRectArray.length)
            {
               _loc1_ = _loc1_ + "0,0,0,0 ";
               _loc3_++;
            }
            _loc1_ = _loc1_ + this.m_iTrackNum;
         }
         else
         {
            for(_loc5_ in this.m_objBlindBlockList)
            {
               _loc6_ = this.m_objBlindBlockList[_loc5_];
               _loc1_ = _loc1_ + (!!_loc6_.userFlag?1:0);
            }
         }
         return _loc1_;
      }
      
      public function setRegion(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Rectangle = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(null == param1 || param1.length <= 0)
         {
            return;
         }
         if(this.m_iVideoUseType == 3)
         {
            while(this.m_objRectArray.length > 0)
            {
               this.m_objRectArray.pop();
               this.m_iTrackNum--;
            }
            _loc2_ = 0;
            _loc3_ = param1.split(" ");
            _loc4_ = 0;
            while(_loc4_ < _loc3_[8])
            {
               _loc5_ = new Rectangle();
               _loc6_ = param1.indexOf(",",_loc2_);
               _loc5_.x = int(Number(param1.substr(_loc2_,_loc6_ - _loc2_)) * this.m_objRcRect.width / 100 + 1);
               _loc7_ = param1.indexOf(",",_loc6_ + 1);
               _loc5_.y = int(Number(param1.substr(_loc6_ + 1,_loc7_ - _loc6_ - 1)) * this.m_objRcRect.height / 100 + 1);
               _loc8_ = param1.indexOf(",",_loc7_ + 1);
               _loc5_.width = int(Number(param1.substr(_loc7_ + 1,_loc8_ - _loc7_ - 1)) * this.m_objRcRect.width / 100 + 1);
               _loc2_ = param1.indexOf(" ",_loc8_ + 1);
               _loc5_.height = int(Number(param1.substr(_loc8_ + 1,_loc2_ - _loc8_ - 1)) * this.m_objRcRect.height / 100 + 1);
               _loc2_ = _loc2_ + 1;
               if(!(_loc5_.width == 0 || _loc5_.height == 0))
               {
                  this.m_objRectArray.push(_loc5_);
                  this.m_iTrackNum++;
               }
               _loc4_++;
            }
         }
         else
         {
            if(param1.indexOf("0") == -1 || param1.indexOf("1") == -1)
            {
               return;
            }
            this.m_objRectArray = param1.split("");
         }
         this.reDrawRect();
      }
      
      private function setRectangleValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Rectangle) : void
      {
         param5.x = param1;
         param5.y = param2;
         param5.width = param3;
         param5.height = param4;
      }
      
      private function clear() : void
      {
         this.m_nMouseDownX = 0;
         this.m_nMouseDownY = 0;
         this.m_nMoveHeight = 0;
         this.m_nMoveWidth = 0;
      }
   }
}
