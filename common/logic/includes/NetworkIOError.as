package common.logic.includes
{
   public class NetworkIOError
   {
      
      public static const SN_ERROR_DETWORKIO_BEGIN:int = -200;
      
      public static const SN_ERROR_NETWORKIO_NOTCREATE:int = SN_ERROR_DETWORKIO_BEGIN - 1;
      
      public static const SN_ERROR_NETWORKIO_CREATE_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 2;
      
      public static const SN_ERROR_NETWORKIO_BIND_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 3;
      
      public static const SN_ERROR_NETWORKIO_CONNECT_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 4;
      
      public static const SN_ERROR_NETWORKIO_CONNECT_TIMEOUT:int = SN_ERROR_DETWORKIO_BEGIN - 5;
      
      public static const SN_ERROR_NETWORKIO_LISTEN_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 6;
      
      public static const SN_ERROR_NETWORKIO_ACCEPT_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 7;
      
      public static const SN_ERROR_NETWORKIO_ACCEPT_TIMEOUT:int = SN_ERROR_DETWORKIO_BEGIN - 8;
      
      public static const SN_ERROR_NETWORKIO_DISCONNECT:int = SN_ERROR_DETWORKIO_BEGIN - 9;
      
      public static const SN_ERROR_NETWORKIO_SEND_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 10;
      
      public static const SN_ERROR_NETWORKIO_SEND_TIMEOUT:int = SN_ERROR_DETWORKIO_BEGIN - 11;
      
      public static const SN_ERROR_NETWORKIO_RECEIVE_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 12;
      
      public static const SN_ERROR_NETWORKIO_RECEIVE_TIMEOUT:int = SN_ERROR_DETWORKIO_BEGIN - 13;
      
      public static const SN_ERROR_NETWORKIO_GETSOCKADDR_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 14;
      
      public static const SN_ERROR_NETWORKIO_SETOPTION_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 15;
      
      public static const SN_ERROR_NETWORKIO_GETOPTION_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 16;
      
      public static const SN_ERROR_NETWORKIO_PROTOCOL_NOT_SUPPORT:int = SN_ERROR_DETWORKIO_BEGIN - 17;
      
      public static const SN_ERROR_NETWORKIO_PORT_USED:int = SN_ERROR_DETWORKIO_BEGIN - 18;
      
      public static const SN_ERROR_PACKET_CREATE_FAILED:int = SN_ERROR_DETWORKIO_BEGIN - 30;
      
      public static const SN_ERROR_PACKET_HEAD_PARSE_ERROR:int = SN_ERROR_DETWORKIO_BEGIN - 31;
      
      public static const SN_ERROR_PACKET_HEAD_CREATE_ERROR:int = SN_ERROR_DETWORKIO_BEGIN - 32;
      
      public static const SN_ERROR_PACKET_PAYLOAD_PARSE_ERROR:int = SN_ERROR_DETWORKIO_BEGIN - 33;
      
      public static const SN_ERROR_PACKET_PAYLOAD_CREATE_ERROR:int = SN_ERROR_DETWORKIO_BEGIN - 34;
      
      public static const SN_ERROR_RTP_EXTENDHEAD_PARSE_ERROR:int = SN_ERROR_DETWORKIO_BEGIN - 35;
      
      public static const SN_ERROR_PACKET_COMPRESS_ERROR:int = SN_ERROR_DETWORKIO_BEGIN - 36;
      
      public static const SN_ERROR_DOMAIN_NAME_PARSE_ERROR:int = SN_ERROR_DETWORKIO_BEGIN - 37;
      
      public static const SN_ERROR_NETWORKIO_SOCKET_AGAIN:int = SN_ERROR_DETWORKIO_BEGIN - 38;
      
      public static const SN_ERROR_RECEIVE_NO_FINISH:int = SN_ERROR_DETWORKIO_BEGIN - 39;
       
      
      public function NetworkIOError()
      {
         super();
      }
   }
}
