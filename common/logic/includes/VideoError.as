package common.logic.includes
{
   public class VideoError
   {
      
      public static const SN_VIDEO_ERROR:int = -800;
      
      public static const SN_VIDEO_CONNECT_ADDR_NULL:int = SN_VIDEO_ERROR - 1;
      
      public static const SN_VIDEO_CONNECT_FAILED:int = SN_VIDEO_ERROR - 2;
      
      public static const SN_VIDEO_STREAM_NAME_NULL:int = SN_VIDEO_ERROR - 3;
       
      
      public function VideoError()
      {
         super();
      }
   }
}
