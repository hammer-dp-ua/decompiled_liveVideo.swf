package common.sdk.AVStream
{
   import common.logic.domain.AVStream.AVStreamParam;
   import common.logic.handler.AVStream.ChangeAVStreamCommandHandler;
   import common.logic.handler.AVStream.VideoStreamRequestCommandHandler;
   import common.logic.handler.LoginCommandHandler;
   import common.logic.handler.SecuritySession;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import common.service.Communication.ICommandHandler;
   import common.service.Communication.TCPTransfer;
   import common.service.SNSocket.DeviceInfoEx;
   import common.service.SNSocket.InetAddr;
   import flash.utils.ByteArray;
   
   public class AVStreamFlashConnector
   {
       
      
      private var m_bNotRecvAVPacketHead:Boolean;
      
      private var m_byAVPacketHead:ByteArray;
      
      private var m_iComsumerId:int;
      
      private var m_iProtocol:int;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_iRecvLen:int;
      
      private var m_iCameraId:int;
      
      private var m_iStreamId:int;
      
      private var m_iTimeout:int;
      
      private var m_objFrameBuffer:Buffer;
      
      private var m_iSessionId:int;
      
      private var m_isOpenAudio:Boolean;
      
      private var m_iStreamFormat:int;
      
      private var m_objAVStreamParam:AVStreamParam;
      
      private var m_objAVStreamAddr:InetAddr;
      
      private var m_bStop:Boolean;
      
      private var m_objTCPTransfer:TCPTransfer;
      
      public function AVStreamFlashConnector(deviceInfoExParam:DeviceInfoEx, cameraIdParam:int, streamIdParam:int)
      {
         super();
         this.m_bNotRecvAVPacketHead = true;
         this.m_byAVPacketHead = new ByteArray();
         this.m_byAVPacketHead.length = CommonConst.CONST_LENGTH_AV_PACKET_HEAD;
         this.m_iProtocol = 2;
         this.m_objDeviceInfoEx = deviceInfoExParam;
         this.m_iCameraId = cameraIdParam;
         this.m_iStreamId = streamIdParam;
         this.m_iTimeout = 5000;
         this.m_iComsumerId = 0;
         this.m_isOpenAudio = false;
         this.m_bStop = true;
         this.m_objTCPTransfer = new TCPTransfer();
         this.m_objTCPTransfer.open();
      }
      
      public function set deviceInfoEx(deviceInfoExParam:DeviceInfoEx) : void
      {
         this.m_objDeviceInfoEx = deviceInfoExParam;
      }
      
      public function open(invokeObject:Object, invokeFunction:Function) : int
      {
         this.m_objTCPTransfer.clearCommandList();
         this.m_objTCPTransfer.connect(this.m_objDeviceInfoEx.getDeviceAddr());
         this.m_objTCPTransfer.setDestId(this.m_objDeviceInfoEx.DeviceID, this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
         this.m_objDeviceInfoEx.DeviceID.position = 0;
         
         var securitySession:SecuritySession = new SecuritySession(this.m_objTCPTransfer, this.m_objDeviceInfoEx);
         var loginCommandHandler:ICommandHandler = new LoginCommandHandler(this.m_objTCPTransfer, this.m_objDeviceInfoEx, securitySession);
         var videoStreamRequestCommandHandler:ICommandHandler =
               new VideoStreamRequestCommandHandler(this.m_objTCPTransfer, this.m_objDeviceInfoEx, this.m_iCameraId, this.m_iStreamId);
               
         videoStreamRequestCommandHandler.setInvokeFlag(true);
         videoStreamRequestCommandHandler.pushInvokeObject(invokeObject);
         videoStreamRequestCommandHandler.pushInvokeFunction(invokeFunction);
         loginCommandHandler.setReceiveFlag(true);
         videoStreamRequestCommandHandler.setReceiveFlag(true);
         
         this.m_objTCPTransfer.setIsRealError(true);
         this.m_objTCPTransfer.setSecuritySession(securitySession);
         this.m_objTCPTransfer.pushCommandHandler(videoStreamRequestCommandHandler);
         this.m_objTCPTransfer.pushCommandHandler(loginCommandHandler);
         return GeneralError.SN_SUCCESS;
      }
      
      public function setStreamId(streamId:int, invokeFunction:Function) : int
      {
         this.m_objTCPTransfer.connect(this.m_objDeviceInfoEx.getDeviceAddr());
         this.m_iComsumerId = this.m_objTCPTransfer.ConsumerId;
         var securitySession:SecuritySession = new SecuritySession(this.m_objTCPTransfer, this.m_objDeviceInfoEx);
         var loginCommandHandler:ICommandHandler = new LoginCommandHandler(this.m_objTCPTransfer, this.m_objDeviceInfoEx, securitySession);
         var changeAVStreamCommandHandler:ChangeAVStreamCommandHandler = new ChangeAVStreamCommandHandler(this.m_objTCPTransfer);
         changeAVStreamCommandHandler.CameraId = this.m_iCameraId;
         changeAVStreamCommandHandler.ConsumerId = this.m_iComsumerId;
         changeAVStreamCommandHandler.StreamId = streamId;
         changeAVStreamCommandHandler.setReceiveFlag(true);
         changeAVStreamCommandHandler.setInvokeFlag(true);
         changeAVStreamCommandHandler.pushInvokeFunction(invokeFunction);
         loginCommandHandler.setReceiveFlag(true);
         this.m_objTCPTransfer.setIsRealError(true);
         this.m_objTCPTransfer.setSecuritySession(securitySession);
         var iCommandHandler:ICommandHandler = changeAVStreamCommandHandler;
         this.m_objTCPTransfer.pushCommandHandler(iCommandHandler);
         this.m_objTCPTransfer.pushCommandHandler(loginCommandHandler);
         return GeneralError.SN_SUCCESS;
      }
      
      public function getErrorCode() : int
      {
         var errorCode:int = this.m_objTCPTransfer.ErrorCode;
         if(errorCode != GeneralError.SN_SUCCESS)
         {
            this.m_objTCPTransfer.ErrorCode = 0;
            this.m_objTCPTransfer.close();
            return errorCode;
         }
         return errorCode;
      }
   }
}
