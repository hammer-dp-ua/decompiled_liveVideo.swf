package common.service.util
{
   import common.logic.share.CommonConst;
   import common.service.SNSocket.DeviceInfoEx;
   import flash.utils.ByteArray;
   
   public class DataConvert
   {
       
      
      public function DataConvert()
      {
         super();
      }
      
      public static function convert(param1:int, param2:ByteArray) : Boolean
      {
         param2.writeMultiByte(param1.toString(),CommonConst.SOCKET_DATA_ENCODE_GB);
         param2.position = 0;
         return true;
      }
      
      public static function byteArrayToString(param1:ByteArray) : String
      {
         param1.position = 0;
         var _loc2_:String = param1.readMultiByte(param1.length,CommonConst.SOCKET_DATA_ENCODE_GB);
         return _loc2_;
      }
      
      public static function stringToByteArray(param1:String) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(param1,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc2_.position = 0;
         return _loc2_;
      }
      
      public static function intToString(param1:int, param2:String = "") : String
      {
         var _loc3_:String = new String();
         if(param1 < 10)
         {
            _loc3_ = "0" + param1.toString() + param2;
            return _loc3_;
         }
         _loc3_ = param1.toString() + param2;
         return _loc3_;
      }
      
      public static function objToBoolen(param1:Object) : Boolean
      {
         var _loc2_:String = new String(param1);
         if(_loc2_ == "false")
         {
            return false;
         }
         return true;
      }
      
      public static function objToDeviceInfo(param1:Object, param2:DeviceInfoEx) : Boolean
      {
         if(null == param1)
         {
            return false;
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeMultiByte(param1.deviceId,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         param2.DeviceID = _loc3_;
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(param1.deviceName,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         param2.DeviceName = _loc3_;
         param2.setDeviceType(int(param1.deviceType));
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(param1.userPWD,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         param2.Password = _loc3_;
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(param1.userName,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         param2.UserID = _loc3_;
         param2.getDeviceAddr().Port = int(param1.serverPort);
         if(param2.getDeviceAddr().Port < 0 || param2.getDeviceAddr().Port > 65535)
         {
         }
         _loc3_ = new ByteArray();
         _loc3_.writeMultiByte(param1.serverHost,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         param2.getDeviceAddr().setIP(_loc3_);
         if(param1.cameraName != null)
         {
            _loc3_ = new ByteArray();
            _loc3_.writeMultiByte(param1.cameraName,CommonConst.SOCKET_DATA_ENCODE_GB);
            _loc3_.position = 0;
            param2.CameraName = _loc3_;
         }
         return true;
      }
      
      public static function deviceInfoToObj(param1:DeviceInfoEx, param2:Object) : Boolean
      {
         param2.deviceId = param1.DeviceID.readMultiByte(param1.DeviceID.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_UTF);
         param1.DeviceID.position = 0;
         param2.serverPort = param1.getDeviceAddr().Port;
         param2.serverHost = param1.getDeviceAddr().getIP().readMultiByte(param1.getDeviceAddr().getIP().bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_UTF);
         param1.getDeviceAddr().getIP().position = 0;
         param2.deviceType = param1.getDeviceType();
         param2.deviceName = param1.DeviceName.readMultiByte(param1.DeviceName.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_UTF);
         param1.DeviceName.position = 0;
         param2.userName = param1.UserID.readMultiByte(param1.UserID.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_UTF);
         param1.UserID.position = 0;
         param2.userPWD = param1.Password.readMultiByte(param1.Password.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_UTF);
         param1.Password.position = 0;
         return true;
      }
   }
}
