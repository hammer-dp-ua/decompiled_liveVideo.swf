package common.logic.command.AVStream
{
   import common.logic.command.Command;
   import common.logic.command.CommandConst;
   import common.logic.command.CommandHead;
   import common.logic.domain.AVStream.AVStreamParam;
   import common.logic.includes.CommandError;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import common.service.SNSocket.InetAddr;
   import flash.utils.ByteArray;
   import flash.xml.XMLDocument;
   
   public class VideoStreamResponseCommand extends Command
   {
       
      
      private var m_iConsumerId:int;
      
      private var m_objAVStreamParam:AVStreamParam;
      
      private var m_objStreamAddr:InetAddr;
      
      public function VideoStreamResponseCommand()
      {
         this.m_objAVStreamParam = new AVStreamParam();
         this.m_objStreamAddr = new InetAddr();
         super();
         setCommandId(CommandConst.CONST_COMMANDID_VIDEO_STREAM_RESPONSE);
         this.m_iConsumerId = 0;
      }
      
      public function set ConsumerId(param1:int) : void
      {
         this.m_iConsumerId = param1;
      }
      
      public function get ConsumerId() : int
      {
         return this.m_iConsumerId;
      }
      
      public function setAVStreamParam(param1:AVStreamParam) : void
      {
         this.m_objAVStreamParam = param1;
      }
      
      public function getAVStreamParam() : AVStreamParam
      {
         return this.m_objAVStreamParam;
      }
      
      public function setStreamAddr(param1:InetAddr) : void
      {
         this.m_objStreamAddr = param1;
      }
      
      public function getStreamAddr() : InetAddr
      {
         return this.m_objStreamAddr;
      }
      
      public function parseCommand(param1:Buffer) : int
      {
         var _loc2_:int = parseCommandHead(param1);
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         if(getCommondId() != CommandConst.CONST_COMMANDID_VIDEO_STREAM_RESPONSE)
         {
            return CommandError.SN_ERROR_COMMAND_UNKNOW;
         }
         if(getPayloadLength() != param1.getDataLength() - CommandHead.getLength())
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         var _loc3_:ByteArray = param1.getData();
         if(null == _loc3_)
         {
            return CommandError.SN_ERROR_COMMAND_PAYLOAD_PARSE_ERROR;
         }
         var _loc4_:int = CommandHead.getLength();
         var _loc5_:String = new String(_loc3_.readMultiByte(_loc3_.bytesAvailable,CommonConst.SOCKET_DATA_ENCODE_GB));
         var _loc6_:XMLDocument = new XMLDocument(_loc5_);
         var _loc7_:XMLDocument = new XMLDocument(_loc6_.firstChild.childNodes[1]);
         var _loc8_:XMLDocument = new XMLDocument(_loc6_.firstChild.childNodes[3]);
         var _loc9_:XMLDocument = new XMLDocument(_loc8_.firstChild.childNodes[1]);
         this.m_iConsumerId = int(_loc6_.firstChild.attributes.ConsumerId);
         this.parseXMLAVStreamParam(this.m_objAVStreamParam,_loc9_);
         this.parseXMLStreamAddr(this.m_objStreamAddr,_loc7_);
         return GeneralError.SN_SUCCESS;
      }
      
      public function parseXMLStreamAddr(param1:InetAddr, param2:XMLDocument) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeMultiByte(param2.firstChild.attributes.IP,CommonConst.SOCKET_DATA_ENCODE_GB);
         _loc3_.position = 0;
         param1.setIP(_loc3_);
         param1.Port = int(param2.firstChild.attributes.Port);
         param1.IPProtoVer = int(param2.firstChild.attributes.IPProtoVar);
      }
      
      public function parseXMLAVStreamParam(param1:AVStreamParam, param2:XMLDocument) : void
      {
         param1.CameraId = int(param2.firstChild.attributes.CameraId);
         param1.StreamId = int(param2.firstChild.attributes.StreamId);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeObject(param2.firstChild.attributes.CameraId);
         _loc3_.position = 0;
         param1.setStreamName(_loc3_);
         param1.VideoHeight = int(param2.firstChild.attributes.VideoHeight);
         param1.VideoWidth = int(param2.firstChild.attributes.VideoWidth);
         param1.FrameRate = int(param2.firstChild.attributes.FrameRate);
         param1.BitRateType = int(param2.firstChild.attributes.BitRateType);
         param1.BitRate = int(param2.firstChild.attributes.BitRate);
         param1.Quality = int(param2.firstChild.attributes.Quality);
         param1.IFrameInterval = int(param2.firstChild.attributes.IFrameInterval);
         param1.AudioEncoderType = int(param2.firstChild.attributes.AudioEncoderType);
      }
   }
}
