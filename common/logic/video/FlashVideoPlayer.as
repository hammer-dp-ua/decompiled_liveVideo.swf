package common.logic.video
{
   import common.logic.component.DisplaySprite;
   import common.logic.domain.CommonConst;
   import common.logic.includes.GeneralError;
   import common.logic.includes.VideoError;
   import common.service.SNSocket.InetAddr;
   import common.service.util.LoadingXML;
   import flash.events.AsyncErrorEvent;
   import flash.events.IOErrorEvent;
   import flash.events.NetStatusEvent;
   import flash.events.SampleDataEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Rectangle;
   import flash.media.Sound;
   import flash.media.Video;
   import flash.net.NetConnection;
   import flash.net.NetStream;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class FlashVideoPlayer extends Video
   {
       
      
      private var m_objNetConnect:NetConnection;
      
      private var m_objNetStream:NetStream;
      
      private var m_strStreamName:String;
      
      private var m_strConnectAddr:String;
      
      private var m_objVideoMask:DisplaySprite;
      
      private var m_funVideoTip:Function;
      
      private var m_bConnectFlag:Boolean;
      
      private var m_bIsPlay:Boolean;
      
      private var m_nTimeoutId:Number;
      
      private var m_objInetAddr:InetAddr;
      
      private var m_iVideoUseType:int;
      
      private var m_nSourceVideoWidth:Number;
      
      private var m_nSourceVideoHeight:Number;
      
      private var m_nVideoWindowWidth:Number;
      
      private var m_nVideoWindowHeight:Number;
      
      private var m_objVideoAreaRect:Rectangle;
      
      private var m_bConnectFail:Boolean;
      
      private var m_funNetStatusInvoke:Function;
      
      private var m_objSound:Sound;
      
      private var m_uDelayTime:Number;
      
      private var m_bSoundListenFlag:Boolean;
      
      private var m_bOnMetaData:Boolean;
      
      private var m_iFrameRate:int;
      
      private var m_nMinBufferLength:Number;
      
      private var m_objLoadingXML:LoadingXML;
      
      private var m_objXML:XML;
      
      private var m_nBufferTime:Number;
      
      public function FlashVideoPlayer(param1:Number = 320, param2:Number = 240)
      {
         super(param1,param2);
         this.m_objLoadingXML = new LoadingXML();
         this.m_objLoadingXML.loaderXML("/CrtmpServerConfigure.xml");
         this.m_objLoadingXML.addDefaultEventListener();
         this.m_nVideoWindowWidth = param1;
         this.m_nVideoWindowHeight = param2;
         this.m_bConnectFail = true;
         this.m_bConnectFlag = false;
         this.m_bIsPlay = false;
         smoothing = true;
         this.m_objVideoAreaRect = new Rectangle();
         this.m_objNetStream = null;
         this.m_objNetConnect = null;
         this.m_strStreamName = null;
         this.m_bSoundListenFlag = false;
         this.m_nSourceVideoWidth = 16;
         this.m_nSourceVideoHeight = 9;
         this.m_iFrameRate = 0;
         this.m_nMinBufferLength = 0;
         this.m_funNetStatusInvoke = null;
         this.m_bOnMetaData = false;
         this.m_objInetAddr = null;
         this.m_nBufferTime = 0;
      }
      
      public function set StreamName(param1:String) : void
      {
         this.m_strStreamName = param1;
      }
      
      public function setInetAddr(param1:InetAddr) : void
      {
         this.m_objInetAddr = param1;
      }
      
      public function get StreamName() : String
      {
         return this.m_strStreamName;
      }
      
      public function set videoUseType(param1:int) : void
      {
         this.m_iVideoUseType = param1;
      }
      
      public function set videoWindowHeight(param1:Number) : void
      {
         this.m_nVideoWindowHeight = param1;
      }
      
      public function set videoWindowWidth(param1:Number) : void
      {
         this.m_nVideoWindowWidth = param1;
      }
      
      public function set SourceVideoHeight(param1:Number) : void
      {
         this.m_nSourceVideoHeight = param1;
      }
      
      public function set SourceVideoWidth(param1:Number) : void
      {
         this.m_nSourceVideoWidth = param1;
      }
      
      public function setBufferTime(param1:Number) : void
      {
         this.m_nBufferTime = param1;
      }
      
      public function connectVideoServer(param1:String, param2:String) : void
      {
         if(!this.m_bConnectFlag)
         {
            this.connectToServer(param1,param2);
         }
         else
         {
            this.m_strStreamName = param2;
            this.playStream();
         }
      }
      
      private function connectToServer(param1:String, param2:String) : int
      {
         if(param1 != null && param1.length > 0)
         {
            param1 = this.changeConnectAddr(param1);
            if(param2 != null)
            {
               this.StreamName = param2;
            }
            this.m_objNetConnect = new NetConnection();
            this.m_objNetConnect.connect(param1);
            this.m_objNetConnect.client = this;
            this.m_strConnectAddr = param1;
            this.m_objNetConnect.addEventListener(NetStatusEvent.NET_STATUS,this.connectHandler);
            this.m_objNetConnect.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
            this.m_objNetConnect.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityErrorHandler);
            this.m_objNetConnect.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this.asyncErrorHandler);
            return GeneralError.SN_SUCCESS;
         }
         return VideoError.SN_VIDEO_CONNECT_ADDR_NULL;
      }
      
      private function changeConnectAddr(param1:String) : String
      {
         if(null == this.m_objInetAddr)
         {
            return param1;
         }
         this.m_objInetAddr.getIP().position = 0;
         var _loc2_:String = this.getAddr();
         if(_loc2_ == "")
         {
            _loc2_ = this.m_objInetAddr.getIP().readMultiByte(this.m_objInetAddr.getIP().bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_GB);
         }
         var _loc3_:uint = param1.search("//");
         var _loc4_:String = param1.substring(0,_loc3_ + 2);
         var _loc5_:String = param1.substring(_loc3_ + 2,param1.length);
         var _loc6_:uint = _loc5_.search(":");
         var _loc7_:String = _loc5_.substring(0,_loc6_);
         var _loc8_:uint = _loc5_.search("/");
         var _loc9_:String = _loc5_.substring(_loc6_,_loc8_);
         var _loc10_:String = _loc5_.substring(_loc8_,_loc5_.length);
         return _loc4_ + _loc2_ + _loc9_ + _loc10_;
      }
      
      public function playStream() : int
      {
         if(this.m_bConnectFlag)
         {
            if(this.m_strStreamName != null && this.m_strStreamName.length > 0)
            {
               this.clearNetStream();
               this.m_objNetStream = new NetStream(this.m_objNetConnect);
               this.m_objNetStream.addEventListener(NetStatusEvent.NET_STATUS,this.streamHandler);
               this.m_objNetStream.client = this;
               if(this.m_nBufferTime != 0)
               {
                  this.m_objNetStream.bufferTime = this.m_nBufferTime;
                  this.m_objNetStream.bufferTimeMax = this.m_nBufferTime;
               }
               else
               {
                  this.m_objNetStream.bufferTime = 0.1;
                  this.m_objNetStream.bufferTimeMax = 0.1;
               }
               attachNetStream(this.m_objNetStream);
               this.m_objNetStream.play(this.m_strStreamName);
               return GeneralError.SN_SUCCESS;
            }
            return VideoError.SN_VIDEO_STREAM_NAME_NULL;
         }
         return VideoError.SN_VIDEO_CONNECT_FAILED;
      }
      
      public function addSoundEventListener() : void
      {
         if(this.m_objSound == null)
         {
            this.m_objSound = new Sound();
         }
         this.m_objSound.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleDataHandler,false,0,true);
         this.m_objSound.play();
         this.m_bSoundListenFlag = true;
      }
      
      public function removeSoundEventListener() : void
      {
         if(this.m_objSound == null)
         {
            return;
         }
         if(this.m_objSound.bytesLoaded > 1)
         {
            this.m_objSound.close();
            this.m_objSound.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleDataHandler,false);
         }
         this.m_objSound = null;
         this.m_bSoundListenFlag = false;
      }
      
      public function getDelayTime() : Number
      {
         return this.m_uDelayTime;
      }
      
      private function onSampleDataHandler(param1:SampleDataEvent) : void
      {
         param1.data.position = param1.data.length = 4096 * 4;
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
      }
      
      private function asyncErrorHandler(param1:AsyncErrorEvent) : void
      {
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
      }
      
      private function connectHandler(param1:NetStatusEvent) : void
      {
         if(null != this.m_funNetStatusInvoke)
         {
            this.m_funNetStatusInvoke.call(null,param1.info.code);
         }
         if(param1.info.code == "NetConnection.Connect.Success")
         {
            this.m_bConnectFlag = true;
            this.m_bConnectFail = true;
            this.playStream();
         }
         else
         {
            this.m_bIsPlay = false;
            this.m_bConnectFail = false;
            this.m_bConnectFlag = false;
         }
      }
      
      public function get connectFail() : Boolean
      {
         return this.m_bConnectFail;
      }
      
      public function get connectFlag() : Boolean
      {
         return this.m_bConnectFlag;
      }
      
      private function streamHandler(param1:NetStatusEvent) : void
      {
         if(null != this.m_funNetStatusInvoke)
         {
            this.m_funNetStatusInvoke.call(null,param1.info.code);
         }
         this.m_bIsPlay = true;
      }
      
      public function onBWDone() : void
      {
         this.m_nTimeoutId = setTimeout(this.checkVideoConnection,3000);
      }
      
      public function setVideoTipInvoke(param1:Function) : void
      {
         this.m_funVideoTip = param1;
      }
      
      public function setNetStatusInvoke(param1:Function) : void
      {
         this.m_funNetStatusInvoke = param1;
      }
      
      private function checkVideoConnection() : void
      {
         if(this.m_nTimeoutId > 0)
         {
            if(this.m_bSoundListenFlag)
            {
               this.removeSoundEventListener();
            }
            this.addSoundEventListener();
            if(!this.m_bIsPlay)
            {
               if(null != this.m_funVideoTip)
               {
                  this.m_funVideoTip.call();
               }
            }
            if(this.m_nTimeoutId > 0)
            {
               clearTimeout(this.m_nTimeoutId);
               this.m_nTimeoutId = -1;
            }
         }
      }
      
      public function clearNetStream() : void
      {
         if(this.m_bIsPlay)
         {
            this.attachNetStream(null);
            if(this.m_objNetStream != null)
            {
               this.m_objNetStream.close();
            }
            this.clear();
            this.m_bIsPlay = false;
         }
         if(this.m_nTimeoutId > 0)
         {
            clearTimeout(this.m_nTimeoutId);
            this.m_nTimeoutId = -1;
         }
         this.m_nSourceVideoWidth = 16;
         this.m_nSourceVideoHeight = 9;
         this.m_bOnMetaData = false;
      }
      
      public function stop() : void
      {
         this.clearNetStream();
         if(null != this.m_objNetConnect)
         {
            this.m_objNetConnect.close();
         }
      }
      
      public function get videoAreaRect() : Rectangle
      {
         return this.m_objVideoAreaRect;
      }
      
      public function onMetaData(param1:Object) : void
      {
         if(param1["frame_rate"] != null && this.m_iFrameRate != param1["frame_rate"])
         {
            this.m_iFrameRate = param1["frame_rate"];
         }
         if(param1["width"] != null && param1["height"] != null)
         {
            if(this.m_bOnMetaData)
            {
               return;
            }
            this.m_bOnMetaData = true;
            this.m_nSourceVideoWidth = param1["width"];
            this.m_nSourceVideoHeight = param1["height"];
            if(this.m_iVideoUseType == 1)
            {
               this.adjustVideoSize();
            }
            else
            {
               this.width = this.width - 2;
               this.height = this.height - 2;
            }
         }
      }
      
      public function adjustVideoSize(param1:Boolean = false) : void
      {
         var _loc2_:Number = this.m_nSourceVideoHeight / this.m_nSourceVideoWidth * this.m_nVideoWindowWidth;
         var _loc3_:Number = this.m_nVideoWindowHeight * this.m_nSourceVideoWidth / this.m_nSourceVideoHeight;
         if(this.m_nSourceVideoHeight * this.m_nVideoWindowWidth > this.m_nSourceVideoWidth * this.m_nVideoWindowHeight)
         {
            x = (this.m_nVideoWindowWidth - _loc3_) / 2;
            width = _loc3_;
            height = this.m_nVideoWindowHeight;
            this.m_objVideoAreaRect.x = x;
            this.m_objVideoAreaRect.y = 0;
         }
         else
         {
            y = (this.m_nVideoWindowHeight - _loc2_) / 2;
            width = this.m_nVideoWindowWidth;
            height = _loc2_;
            this.m_objVideoAreaRect.x = 0;
            this.m_objVideoAreaRect.y = y;
         }
         this.m_objVideoAreaRect.width = width;
         this.m_objVideoAreaRect.height = height;
      }
      
      public function resetVideoSize(param1:Rectangle) : void
      {
         var _loc2_:Number = this.m_objVideoAreaRect.width / param1.width;
         this.x = this.m_objVideoAreaRect.x - (param1.x - this.m_objVideoAreaRect.x) * _loc2_;
         this.y = this.m_objVideoAreaRect.y - (param1.y - this.m_objVideoAreaRect.y) * _loc2_;
         this.width = this.m_objVideoAreaRect.width * _loc2_;
         this.height = this.m_objVideoAreaRect.height * _loc2_;
      }
      
      public function get timeHead() : Number
      {
         if(this.m_objNetStream != null)
         {
            return this.m_objNetStream.time;
         }
         return 0;
      }
      
      public function get isPlay() : Boolean
      {
         return this.m_bIsPlay;
      }
      
      public function get BufferLength() : Number
      {
         if(this.m_objNetStream != null)
         {
            return this.m_objNetStream.bufferLength;
         }
         return 0;
      }
      
      public function pauseVideoStream() : void
      {
         if(this.m_objNetStream != null)
         {
            this.m_objNetStream.pause();
            this.playAgain();
            return;
         }
      }
      
      private function playAgain() : void
      {
         if(this.m_objNetStream != null)
         {
            this.m_objNetStream.resume();
         }
      }
      
      public function getMinBufferLength() : Number
      {
         if(this.m_nMinBufferLength == 0)
         {
            return 0.8;
         }
         return this.m_nMinBufferLength;
      }
      
      private function getAddr() : String
      {
         var _loc1_:String = null;
         if(this.m_objLoadingXML.getResult() == 0)
         {
            this.m_objXML = new XML(this.m_objLoadingXML.getRequestContent());
            if(this.m_objXML == null || this.m_objXML == "")
            {
               return "";
            }
            _loc1_ = this.m_objXML.Configure[1].@EnableFlashServerParamFlag;
            if(_loc1_ == "true")
            {
               return this.m_objXML.Configure[1].@FlashServerIP;
            }
         }
         return "";
      }
   }
}
