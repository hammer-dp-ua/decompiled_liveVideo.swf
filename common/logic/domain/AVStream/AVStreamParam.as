package common.logic.domain.AVStream
{
   import common.logic.domain.DomainConst;
   import flash.utils.ByteArray;
   
   public class AVStreamParam
   {
       
      
      private var m_iCameraId:int;
      
      private var m_iStreamId:int;
      
      private var m_byStreamName:ByteArray;
      
      private var m_iVideoHeight:int;
      
      private var m_iVideoWidth:int;
      
      private var m_iFrameRate:int;
      
      private var m_iBitRateType:int;
      
      private var m_iBitRate:int;
      
      private var m_iQuality:int;
      
      private var m_iIFrameInterval:int;
      
      private var m_iVideoEncoderType:int;
      
      private var m_iAudioEncoderType:int;
      
      public function AVStreamParam()
      {
         super();
         this.m_byStreamName = new ByteArray();
         this.m_byStreamName.length = DomainConst.CONST_MAXLENGTH_AVSREAM_NAME + 1;
      }
      
      public function set CameraId(param1:int) : void
      {
         this.m_iCameraId = param1;
      }
      
      public function get CameraId() : int
      {
         return this.m_iCameraId;
      }
      
      public function set StreamId(param1:int) : void
      {
         this.m_iStreamId = param1;
      }
      
      public function get StreamId() : int
      {
         return this.m_iStreamId;
      }
      
      public function setStreamName(param1:ByteArray) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:int = param1.length;
         if(_loc2_ > DomainConst.CONST_MAXLENGTH_AVSREAM_NAME)
         {
            return false;
         }
         this.m_byStreamName = param1;
         this.m_byStreamName.length = DomainConst.CONST_MAXLENGTH_AVSREAM_NAME + 1;
         this.m_byStreamName.position = 0;
         return true;
      }
      
      public function getStreamName() : ByteArray
      {
         return this.m_byStreamName;
      }
      
      public function set VideoHeight(param1:int) : void
      {
         this.m_iVideoHeight = param1;
      }
      
      public function get VideoHeight() : int
      {
         return this.m_iVideoHeight;
      }
      
      public function set VideoWidth(param1:int) : void
      {
         this.m_iVideoWidth = param1;
      }
      
      public function get VideoWidth() : int
      {
         return this.m_iVideoWidth;
      }
      
      public function set FrameRate(param1:int) : void
      {
         this.m_iFrameRate = param1;
      }
      
      public function get FrameRate() : int
      {
         return this.m_iFrameRate;
      }
      
      public function set BitRateType(param1:int) : void
      {
         this.m_iBitRateType = param1;
      }
      
      public function get BitRateType() : int
      {
         return this.m_iBitRateType;
      }
      
      public function set BitRate(param1:int) : void
      {
         this.m_iBitRate = param1;
      }
      
      public function get BitRate() : int
      {
         return this.m_iBitRate;
      }
      
      public function set Quality(param1:int) : void
      {
         this.m_iQuality = param1;
      }
      
      public function get Quality() : int
      {
         return this.m_iQuality;
      }
      
      public function set IFrameInterval(param1:int) : void
      {
         this.m_iIFrameInterval = param1;
      }
      
      public function get IFrameInterval() : int
      {
         return this.m_iIFrameInterval;
      }
      
      public function set VideoEncoderType(param1:int) : void
      {
         this.m_iVideoEncoderType = param1;
      }
      
      public function get VideoEncoderType() : int
      {
         return this.m_iVideoEncoderType;
      }
      
      public function set AudioEncoderType(param1:int) : void
      {
         this.m_iAudioEncoderType = param1;
      }
      
      public function get AudioEncoderType() : int
      {
         return this.m_iAudioEncoderType;
      }
   }
}
