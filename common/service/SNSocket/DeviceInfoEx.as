package common.service.SNSocket
{
   import common.logic.domain.DeviceType;
   import common.logic.domain.DomainConst;
   import flash.utils.ByteArray;
   
   public class DeviceInfoEx
   {
       
      
      private var m_objInetAddr:InetAddr;
      
      private var m_byUserID:ByteArray;
      
      private var m_byPassword:ByteArray;
      
      private var m_byDeviceID:ByteArray;
      
      private var m_byDeviceName:ByteArray;
      
      private var m_byCameraName:ByteArray;
      
      private var m_iDeviceType:int;
      
      private var m_bRouterMappingEnableFlag:Boolean;
      
      private var m_byRouterAddr:ByteArray;
      
      private var m_iRouterMappingControlPort:int;
      
      private var m_iRouterMappingTCPAVPort:int;
      
      private var m_iRouterMappingRTSPPort:int;
      
      private var m_iRouterMappingRTPPort:int;
      
      private var m_iRouterMappingRTCPPort:int;
      
      public function DeviceInfoEx()
      {
         super();
         this.m_byDeviceID = new ByteArray();
         this.m_byDeviceID.length = DomainConst.CONST_MAXLENGTH_DEVICEID + 1;
         this.m_objInetAddr = new InetAddr();
         this.m_byDeviceName = new ByteArray();
         this.m_byDeviceName.length = DomainConst.CONST_MAXLENGTH_DEVICENAME + 1;
         this.m_byPassword = new ByteArray();
         this.m_byPassword.length = DomainConst.CONST_MAXLENGTH_PASSWORD + 1;
         this.m_byUserID = new ByteArray();
         this.m_byUserID.length = DomainConst.CONST_MAXLENGTH_USERID + 1;
         this.m_byRouterAddr = new ByteArray();
         this.m_byRouterAddr.length = DomainConst.CONST_MAXLENGTH_IP + 1;
         this.m_iDeviceType = DeviceType.IPCAMERA;
         this.m_bRouterMappingEnableFlag = false;
         this.m_iRouterMappingControlPort = 0;
         this.m_iRouterMappingTCPAVPort = 0;
         this.m_iRouterMappingRTSPPort = 0;
         this.m_iRouterMappingRTPPort = 0;
         this.m_iRouterMappingRTCPPort = 0;
      }
      
      public function set DeviceID(param1:ByteArray) : void
      {
         if(null == param1)
         {
            return;
         }
         if(param1.length > DomainConst.CONST_MAXLENGTH_DEVICEID + 1)
         {
            return;
         }
         this.m_byDeviceID = param1;
         this.m_byDeviceID.position = 0;
      }
      
      public function get DeviceID() : ByteArray
      {
         this.m_byDeviceID.position = 0;
         return this.m_byDeviceID;
      }
      
      public function setPos() : void
      {
         this.m_byDeviceID.position = 0;
         this.m_byDeviceName.position = 0;
         this.m_byUserID.position = 0;
         this.m_byPassword.position = 0;
         this.m_byRouterAddr.position = 0;
      }
      
      public function set DeviceName(param1:ByteArray) : void
      {
         if(null == param1)
         {
            return;
         }
         if(param1.length > DomainConst.CONST_MAXLENGTH_DEVICENAME + 1)
         {
            return;
         }
         this.m_byDeviceName = param1;
         this.m_byDeviceName.position = 0;
      }
      
      public function get DeviceName() : ByteArray
      {
         return this.m_byDeviceName;
      }
      
      public function set CameraName(param1:ByteArray) : void
      {
         if(null == param1)
         {
            return;
         }
         if(param1.length > DomainConst.CONST_MAXLENGTH_CAMERANAME + 1)
         {
            return;
         }
         this.m_byCameraName = param1;
         this.m_byCameraName.position = 0;
      }
      
      public function get CameraName() : ByteArray
      {
         return this.m_byCameraName;
      }
      
      public function set RouterAddr(param1:ByteArray) : void
      {
         if(null == param1)
         {
            return;
         }
         if(param1.length > DomainConst.CONST_MAXLENGTH_IP + 1)
         {
            return;
         }
         this.m_byRouterAddr = param1;
         this.m_byRouterAddr.position = 0;
      }
      
      public function get RouterAddr() : ByteArray
      {
         return this.m_byRouterAddr;
      }
      
      public function setDeviceType(param1:int) : void
      {
         this.m_iDeviceType = param1;
      }
      
      public function getDeviceType() : int
      {
         return this.m_iDeviceType;
      }
      
      public function setDeviceAddr(param1:InetAddr) : void
      {
         this.m_objInetAddr = param1;
      }
      
      public function getDeviceAddr() : InetAddr
      {
         return this.m_objInetAddr;
      }
      
      public function set UserID(param1:ByteArray) : void
      {
         if(null == param1)
         {
            return;
         }
         if(param1.length > DomainConst.CONST_MAXLENGTH_USERID + 1)
         {
            return;
         }
         this.m_byUserID = param1;
         this.m_byUserID.position = 0;
      }
      
      public function get UserID() : ByteArray
      {
         return this.m_byUserID;
      }
      
      public function set Password(param1:ByteArray) : void
      {
         if(null == param1)
         {
            return;
         }
         if(param1.length > DomainConst.CONST_MAXLENGTH_PASSWORD + 1)
         {
            return;
         }
         this.m_byPassword = param1;
         this.m_byPassword.position = 0;
      }
      
      public function get Password() : ByteArray
      {
         return this.m_byPassword;
      }
      
      public function set RouterMappingRTCPPort(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         _loc2_.position = 0;
         this.m_iRouterMappingRTCPPort = _loc2_.readShort();
      }
      
      public function set RouterMappingRTPPort(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         _loc2_.position = 0;
         this.m_iRouterMappingRTPPort = _loc2_.readShort();
      }
      
      public function set RouterMappingRTSPPort(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         _loc2_.position = 0;
         this.m_iRouterMappingRTSPPort = _loc2_.readShort();
      }
      
      public function set RouterMappingTCPAVPort(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         _loc2_.position = 0;
         this.m_iRouterMappingTCPAVPort = _loc2_.readShort();
      }
      
      public function get RouterMappingRTCPPort() : int
      {
         return this.m_iRouterMappingRTCPPort;
      }
      
      public function get RouterMappingRTPPort() : int
      {
         return this.m_iRouterMappingRTPPort;
      }
      
      public function get RouterMappingRTSPPort() : int
      {
         return this.m_iRouterMappingRTSPPort;
      }
      
      public function get RouterMappingTCPAVPort() : int
      {
         return this.m_iRouterMappingTCPAVPort;
      }
   }
}
