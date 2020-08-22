package common.sdk.player
{
   import common.logic.includes.GeneralError;
   import common.logic.video.FlashVideoPlayer;
   import common.sdk.AVStream.AVStreamFlashConnector;
   import common.service.SNSocket.DeviceInfoEx;
   
   public class RemoteCamera
   {
       
      
      private var m_objAVStreamFlashConnector:AVStreamFlashConnector;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_iCameraId:int;
      
      private var m_iStreamId:int;
      
      private var m_iTransferProtocol:int;
      
      public function RemoteCamera()
      {
         super();
         this.m_objDeviceInfoEx = null;
         this.m_iTransferProtocol = 2;
         this.m_iCameraId = 1;
         this.m_iStreamId = 1;
      }
      
      public function set deviceInfoEx(param1:DeviceInfoEx) : void
      {
         this.m_objDeviceInfoEx = param1;
      }
      
      public function set streamId(param1:int) : void
      {
         this.m_iStreamId = param1;
      }
      
      public function play(param1:FlashVideoPlayer) : int
      {
         if(null == this.m_objDeviceInfoEx)
         {
            return -1;
         }
         if(null == this.m_objAVStreamFlashConnector)
         {
            this.m_objAVStreamFlashConnector = null;
            this.m_objAVStreamFlashConnector = new AVStreamFlashConnector(this.m_objDeviceInfoEx,this.m_iCameraId,this.m_iStreamId);
         }
         this.m_objAVStreamFlashConnector.deviceInfoEx = this.m_objDeviceInfoEx;
         var _loc2_:int = this.m_objAVStreamFlashConnector.open(param1,param1.connectVideoServer);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function set cameraId(param1:int) : void
      {
         this.m_iCameraId = param1;
      }
      
      public function get cameraId() : int
      {
         return this.m_iCameraId;
      }
      
      public function switchStream(param1:int, param2:Function) : int
      {
         return this.m_objAVStreamFlashConnector.setStreamId(param1,param2);
      }
      
      public function getErrorCode() : int
      {
         return this.m_objAVStreamFlashConnector.getErrorCode();
      }
      
      public function rePlay(param1:FlashVideoPlayer) : void
      {
         this.play(param1);
      }
   }
}
