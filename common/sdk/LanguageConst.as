package common.sdk
{
   public class LanguageConst
   {
      
      public static const DOCUMENT_TYPE_XML:String = ".xml";
      
      public static const LANGUAGE_ENGLISH:int = 1;
      
      public static const LANGUAGE_CHINESE:int = 2;
      
      public static const LANGUAGE_RUSSIAN:int = 3;
      
      public static const LANGUAGE_GERMAN:int = 6;
      
      public static const LANGUAGE_POLISH:int = 9;
      
      public static const LANGUAGE_CHINESETRADITIONAL:int = 14;
      
      public static const LANG_CHINESE:String = "Chinese";
      
      public static const LANG_RUSSIAN:String = "Russian";
      
      public static const LANG_POLISH:String = "Polish";
      
      public static const LANG_GERMAN:String = "German";
      
      public static const LANG_ENGLISH:String = "English";
      
      public static const LANG_CHINESETRADITIONAL:String = "ChineseTraditional";
      
      public static const File_Name_PTZ:int = 1;
      
      public static const File_Name_VideoParam:int = 2;
      
      public static const File_Name_RightMenu:int = 3;
      
      public static const File_Name_Track:int = 4;
      
      public static const File_Name_PrePos:int = 5;
      
      public static const File_Name_Playback:int = 6;
       
      
      public function LanguageConst()
      {
         super();
      }
      
      public static function FileName(param1:int, param2:int) : String
      {
         var _loc3_:String = "";
         _loc3_ = getFileNamePrefix(param1) + getLanguage(param2) + DOCUMENT_TYPE_XML;
         return _loc3_;
      }
      
      protected static function getLanguage(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case LANGUAGE_CHINESE:
               _loc2_ = LANG_CHINESE;
               break;
            case LANGUAGE_RUSSIAN:
               _loc2_ = LANG_RUSSIAN;
               break;
            case LANGUAGE_POLISH:
               _loc2_ = LANG_POLISH;
               break;
            case LANGUAGE_CHINESETRADITIONAL:
               _loc2_ = LANG_CHINESETRADITIONAL;
               break;
            case LANGUAGE_GERMAN:
               _loc2_ = LANG_GERMAN;
               break;
            default:
               _loc2_ = LANG_ENGLISH;
         }
         return _loc2_;
      }
      
      protected static function getFileNamePrefix(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case File_Name_PTZ:
               _loc2_ = "ShowVideo_PTZ_";
               break;
            case File_Name_VideoParam:
               _loc2_ = "ShowVideo_VideoParam_";
               break;
            case File_Name_RightMenu:
               _loc2_ = "RightKey_Menu_";
               break;
            case File_Name_Track:
               _loc2_ = "ShowVideo_Track_";
               break;
            case File_Name_PrePos:
               _loc2_ = "ShowVideo_PrePos_";
               break;
            case File_Name_Playback:
               _loc2_ = "Playback_";
               break;
            default:
               _loc2_ = "";
         }
         return _loc2_;
      }
   }
}
