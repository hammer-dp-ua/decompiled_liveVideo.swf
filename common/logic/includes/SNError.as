package common.logic.includes
{
   public class SNError
   {
      
      public static const SN_ERROR_BEGIN:int = -500;
      
      public static const SN_ERROR_NOT_EXPECT_RESPONSE:int = SN_ERROR_BEGIN - 1;
      
      public static const SN_ERROR_REMOTE_FAILED:int = SN_ERROR_BEGIN - 2;
      
      public static const SN_ERROR_DEVICE_NOT_OPEN:int = SN_ERROR_BEGIN - 3;
      
      public static const SN_ERROR_DEVICE_OPEN_FAILED:int = SN_ERROR_BEGIN - 4;
      
      public static const SN_ERROR_DEVICE_USED:int = SN_ERROR_BEGIN - 5;
      
      public static const SN_ERROR_DEVICE_NOT_SUPPORT:int = SN_ERROR_BEGIN - 6;
      
      public static const SN_ERROR_LOGIN_USERNAME_ERROR:int = SN_ERROR_BEGIN - 7;
      
      public static const SN_ERROR_LOGIN_USERPASSWORD_ERROR:int = SN_ERROR_BEGIN - 8;
      
      public static const SN_ERROR_ADSL_DIAL_FAILED:int = SN_ERROR_BEGIN - 9;
      
      public static const SN_ERROR_COM_ISUSED:int = SN_ERROR_BEGIN - 10;
      
      public static const SN_ERROR_MAX_CONNECTION:int = SN_ERROR_BEGIN - 11;
      
      public static const SN_ERROR_NO_PRIVILEGE:int = SN_ERROR_BEGIN - 12;
      
      public static const SN_ERROR_DEVICE_NOT_CONFIGURE:int = SN_ERROR_BEGIN - 13;
      
      public static const SN_ERROR_FORMAT_FAIL_BY_USING:int = SN_ERROR_BEGIN - 14;
      
      public static const SN_ERROR_USER_LOCKED:int = SN_ERROR_BEGIN - 15;
      
      public static const SN_ERROR_USER_REPEATED:int = SN_ERROR_BEGIN - 16;
      
      public static const SN_ERROR_USER_LONGINING:int = SN_ERROR_BEGIN - 17;
      
      public static const SN_ERROR_DEVICE_ABILITY_NOT_ENOUGH:int = SN_ERROR_BEGIN - 18;
       
      
      public function SNError()
      {
         super();
      }
   }
}
