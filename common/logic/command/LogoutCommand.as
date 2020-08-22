package common.logic.command
{
   import common.logic.domain.User;
   import common.logic.includes.GeneralError;
   import common.service.Communication.Buffer;
   import flash.utils.ByteArray;
   
   public class LogoutCommand extends Command
   {
       
      
      private var m_objUser:User;
      
      public function LogoutCommand()
      {
         super();
         setCommandId(CommandConst.CONST_COMMANDID_LOGOUT);
         this.m_objUser = new User();
      }
      
      public function setUser(param1:User) : void
      {
         this.m_objUser = param1;
      }
      
      public function getUser() : User
      {
         return this.m_objUser;
      }
      
      public function getCommand(param1:Buffer) : int
      {
         var _loc2_:Buffer = new Buffer();
         var _loc3_:int = this.getUserBuffer(_loc2_);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         var _loc4_:int = _loc2_.getDataLength();
         var _loc5_:int = CommandHead.getLength() + _loc4_;
         var _loc6_:Boolean = param1.alloc(_loc5_);
         if(!_loc6_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         var _loc7_:Buffer = new Buffer();
         setPayloadLength(_loc4_);
         _loc3_ = super.getCommandHead(_loc7_);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         _loc6_ = param1.append(_loc7_);
         if(!_loc6_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         _loc6_ = param1.append(_loc2_);
         if(!_loc6_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         param1.getByBuffer().position = 0;
         return GeneralError.SN_SUCCESS;
      }
      
      public function getUserBuffer(param1:Buffer) : int
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(this.m_objUser.Port);
         _loc2_.position = 0;
         var _loc3_:int = this.m_objUser.SourceId.length + this.m_objUser.IP.length + _loc2_.length + this.m_objUser.UserName.length + this.m_objUser.Password.length;
         if(_loc3_ > getPayloadMaxLength())
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         param1.alloc(_loc3_);
         var _loc4_:Boolean = param1.append(this.m_objUser.SourceId);
         if(!_loc4_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         _loc4_ = param1.append(this.m_objUser.IP);
         if(!_loc4_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         _loc4_ = param1.append(_loc2_);
         if(!_loc4_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         _loc4_ = param1.append(this.m_objUser.UserName);
         if(!_loc4_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         _loc4_ = param1.append(this.m_objUser.Password);
         if(!_loc4_)
         {
            return GeneralError.SN_ERROR_NOT_ENOUGH_MEMORY;
         }
         param1.getByBuffer().position = 0;
         return GeneralError.SN_SUCCESS;
      }
   }
}
