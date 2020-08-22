package common.logic.command
{
   public class Response
   {
      
      public static const SUCCESSFLAG_SUCCESS:int = 0;
      
      public static const SUCCESSFLAG_ERROR:int = -1;
       
      
      private var m_iRequestId:int;
      
      private var m_iSucceedFlag:int;
      
      private var m_iErrorNo:int;
      
      public function Response()
      {
         super();
         this.m_iRequestId = 0;
         this.m_iSucceedFlag = 0;
         this.m_iErrorNo = 0;
      }
      
      public function set RequestId(param1:int) : void
      {
         this.m_iRequestId = param1;
      }
      
      public function get RequestId() : int
      {
         return this.m_iRequestId;
      }
      
      public function set SucceedFlag(param1:int) : void
      {
         this.m_iSucceedFlag = param1;
      }
      
      public function get SucceedFlag() : int
      {
         return this.m_iSucceedFlag;
      }
      
      public function set ErrorNo(param1:int) : void
      {
         this.m_iErrorNo = param1;
      }
      
      public function get ErrorNo() : int
      {
         return this.m_iErrorNo;
      }
   }
}
