package common.logic.handler.sensor
{
   import common.service.Communication.IErrorHandler;
   import common.service.Communication.TCPTransfer;
   
   public class RealTimeErrorCommandHandler implements IErrorHandler
   {
       
      
      private var m_strParameter:String;
      
      private var m_bInvokeFlag:Boolean;
      
      private var m_objFunctionList:Vector.<Function>;
      
      private var m_objObjectList:Vector.<Object>;
      
      private var m_objTCPTransfer:TCPTransfer;
      
      public function RealTimeErrorCommandHandler(param1:TCPTransfer, param2:String)
      {
         super();
         this.m_objTCPTransfer = param1;
         this.m_strParameter = param2;
         this.m_objFunctionList = new Vector.<Function>();
         this.m_objObjectList = new Vector.<Object>();
      }
      
      public function process_ErrorHanlder() : int
      {
         var _loc1_:Function = null;
         if(this.isInvokeFlag())
         {
            while(this.m_objTCPTransfer.getCommandHandlerListLength() > 0)
            {
               this.m_objTCPTransfer.popCommandHandler();
            }
            while(this.m_objTCPTransfer.getErrorHandlerListLength() > 0)
            {
               this.m_objTCPTransfer.popErrorRealCommandHandler();
            }
            _loc1_ = this.m_objFunctionList.pop();
            _loc1_.call(null,this.m_strParameter);
         }
         return 0;
      }
      
      public function setInvokeFlag(param1:Boolean) : void
      {
         this.m_bInvokeFlag = param1;
      }
      
      public function isInvokeFlag() : Boolean
      {
         return this.m_bInvokeFlag;
      }
      
      public function pushInvokeObject(param1:Object) : void
      {
         this.m_objObjectList.push(param1);
      }
      
      public function pushInvokeFunction(param1:Function) : void
      {
         this.m_objFunctionList.push(param1);
      }
   }
}
