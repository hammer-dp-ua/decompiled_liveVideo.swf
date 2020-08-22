package common.logic.command
{
   import common.logic.domain.DomainConst;
   import common.logic.domain.User;
   import common.logic.includes.GeneralError;
   import common.logic.share.CommonConst;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class LoginCommand extends Command
   {
       
      
      private var m_objUser:User;
      
      public function LoginCommand()
      {
         super();
         setCommandId(CommandConst.CONST_COMMANDID_LOGIN);
         this.m_objUser = new User();
      }
      
      public function setUser(userParam:User) : void
      {
         this.m_objUser = userParam;
      }
      
      public function getUser() : User
      {
         return this.m_objUser;
      }
      
      private function getUserBuffer(bufferParam:Buffer) : int
      {
         var portByteArray:ByteArray = new ByteArray();
         portByteArray.writeShort(this.m_objUser.Port);
         portByteArray.position = 0;
         
         var toBeAllocatedLength:int = CommonConst.CONST_LENGTH_COMMAND_SOURCEID + DomainConst.CONST_MAXLENGTH_IP + portByteArray.length + DomainConst.CONST_MAXLENGTH_USERNAME + DomainConst.CONST_MAXLENGTH_USERPASSWORD;
         if(toBeAllocatedLength > getPayloadMaxLength())
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         bufferParam.alloc(toBeAllocatedLength);
         
         var status:Boolean = bufferParam.append(this.m_objUser.SourceId);
         if(!status)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         status = bufferParam.append(this.m_objUser.IP);
         if(!status)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         status = bufferParam.append(portByteArray);
         if(!status)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         status = bufferParam.append(this.m_objUser.UserName);
         if(!status)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         status = bufferParam.append(this.m_objUser.Password);
         if(!status)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         bufferParam.getByBuffer().position = 0;
         return GeneralError.SN_SUCCESS;
      }
      
      public function getCommand(bufferParam:Buffer) : int
      {
         var userBuffer:Buffer = new Buffer();
         var status:int = this.getUserBuffer(userBuffer);
         if(status != GeneralError.SN_SUCCESS)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         var userBufferLength:int = userBuffer.getDataLength();
         var sumLength:int = CommandHead.getLength() + userBufferLength;
         
         var isAllocated:Boolean = bufferParam.alloc(sumLength);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         var commandHeadBuffer:Buffer = new Buffer();
         setPayloadLength(userBufferLength);
         
         status = super.getCommandHead(commandHeadBuffer);
         if(status != GeneralError.SN_SUCCESS)
         {
            return status;
         }
         
         isAllocated = bufferParam.append(commandHeadBuffer);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         
         isAllocated = bufferParam.append(userBuffer);
         if(!isAllocated)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         bufferParam.getByBuffer().position = 0;
         return GeneralError.SN_SUCCESS;
      }
   }
}
