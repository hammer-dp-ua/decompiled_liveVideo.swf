package common.logic.domain
{
   public class CommonConst
   {
      
      public static const SOCKET_DATA_ENCODE_GB:String = "GB2312";
      
      public static const SOCKET_DATA_ENCODE_UTF:String = "UTF-8";
      
      public static const IMAGE_PATH_PREFIX:String = "../../image/";
      
      public static const IMAGE_FORMAT_PNG:String = ".png";
      
      public static const CONST_VIDEO_WIDTH:int = 50000;
      
      public static const CONST_VIDEO_HEIGHT:int = 50000;
      
      public static const CONST_VIDEO_RECV_BUFFER_SIZE:int = 1024 * 1024;
      
      public static const CONST_LENGTH_PACKET_HEAD:int = 24;
      
      public static const CONST_LENGTH_PACKET_RESERVE:int = 3;
      
      public static const CONST_MAXLENGTH_NETWORK_MTU:int = 1400;
      
      public static const CONST_MAXLENGTH_PACKET:int = CONST_MAXLENGTH_NETWORK_MTU;
      
      public static const CONST_MAXLENGTH_PACKET_PAYLOAD:int = CONST_MAXLENGTH_PACKET - CONST_LENGTH_PACKET_HEAD;
      
      public static const CONST_LENGTH_AV_PACKET_HEAD:int = 20;
      
      public static const CONST_LENGTH_AV_PACKET_RESERVE:int = 2;
      
      public static const CONST_MAXLENGTH_COMMAND:int = CONST_MAXLENGTH_PACKET - CONST_LENGTH_PACKET_HEAD;
      
      public static const CONST_LENGTH_COMMAND_HEAD:int = 76;
      
      public static const CONST_MAXLENGTH_COMMAND_PAYLOAD:int = CONST_MAXLENGTH_COMMAND - CONST_LENGTH_COMMAND_HEAD;
      
      public static const CONST_LENGTH_COMMAND_SOURCEID:int = 32;
      
      public static const CONST_LENGTH_COMMAND_DESTID:int = 32;
      
      public static const CONST_LENGTH_COMMAND_RESERVE:int = 2;
      
      public static const CONST_LENGTH_FRAMEHEAD:int = 16;
      
      public static const CONST_DEFAULTSIZE_CAPTUREVECTOR:int = 100;
      
      public static const MAX_LEN_SPLIT_DATA:int = (1024 - CONST_LENGTH_COMMAND_HEAD) * 15;
      
      public static const CONST_MAXLENGTH_RESPONSEINFO:int = 512;
      
      public static const CONST_LENGTH_RESPONSE_HEAD:int = 12;
      
      public static const CONST_LENGTH_DATANAME:int = 256;
      
      public static const CONST_INTERVAL_CAPTUREFREE:int = 30;
      
      public static const CONST_INTERVAL_MUX:int = 15;
      
      public static const CONST_MAXLENGTH_VIDEO_FRAME:int = 1920 * 1080;
      
      public static const CONST_MAXLENGTH_AUDIO_FRAME:int = 1024 * 6;
      
      public static const CONST_MPEG2TS_PACKET_LENGTH:int = 188;
      
      public static const RTPEXTENDHEADID:int = 100;
       
      
      public function CommonConst()
      {
         super();
      }
   }
}
