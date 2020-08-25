package common.logic.handler
{
   import common.logic.command.CommandConst;
   import common.logic.command.LoginCommand;
   import common.logic.command.LogoutCommand;
   import common.logic.command.Response;
   import common.logic.command.ResponseCommand;
   import common.logic.command.SessionHeartbeatCommand;
   import common.logic.domain.User;
   import common.logic.includes.GeneralError;
   import common.logic.includes.SNError;
   import common.service.Communication.Buffer;
   import common.service.Communication.TCPTransfer;
   import common.service.Communication.TransferProtocol;
   import common.service.SNSocket.DeviceInfoEx;
   import common.service.SNSocket.InetAddr;
   
   public class SecuritySession
   {
       
      
      private var m_iFlag:int;
      
      private var m_iTimeout:int;
      
      private var m_iTimeoutTimes:int;
      
      private var m_objDeviceInfoEx:DeviceInfoEx;
      
      private var m_iTransferProtocol:int;
      
      private var m_iSessionId:int;
      
      private var m_iUsageCount:int;
      
      private var m_bLoginFlag:Boolean;
      
      private var m_Users:Vector.<int>;
      
      private var m_objTCPTransfer:TCPTransfer;
      
      public function SecuritySession(objTCPTransferParam:TCPTransfer, objDeviceInfoExParam:DeviceInfoEx)
      {
         super();
         this.m_iTimeout = 5000;
         this.m_iTimeoutTimes = 1;
         this.m_iTransferProtocol = TransferProtocol.TCP;
         this.m_iSessionId = 0;
         this.m_iUsageCount = 0;
         this.m_bLoginFlag = false;
         this.m_iFlag = 0;
         this.m_Users = new Vector.<int>();
         this.m_objTCPTransfer = objTCPTransferParam;
         this.m_objDeviceInfoEx = objDeviceInfoExParam;
      }
      
      public function login(param1:int) : int
      {
         var _loc2_:int = 0;
         _loc2_ = this.sendLoginCommand();
         if(!this.m_bLoginFlag)
         {
            if(_loc2_ != GeneralError.SN_SUCCESS)
            {
               return _loc2_;
            }
         }
         this.m_bLoginFlag = true;
         return GeneralError.SN_SUCCESS;
      }
      
      private function addUser(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.m_Users.length)
         {
            _loc3_ = this.m_Users[_loc2_];
            if(_loc3_ == param1)
            {
               return false;
            }
            _loc2_++;
         }
         this.m_Users.push(param1);
         return true;
      }
      
      public function isLoginSuccess() : Boolean
      {
         return this.m_bLoginFlag;
      }
      
      public function sendLoginCommand() : int
      {
         var status:int = 0;
         var buffer:Buffer = new Buffer();
         
         status = this.createLoginCommand(buffer);
         if(status != GeneralError.SN_SUCCESS)
         {
            return status;
         }
         
         status = this.m_objTCPTransfer.sendCommand(buffer);
         if(status != GeneralError.SN_SUCCESS)
         {
            return status;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      private function createLoginCommand(bufferParam:Buffer) : int
      {
         var inetAddr:InetAddr = this.m_objDeviceInfoEx.getDeviceAddr();
         var user:User = new User();
         user.IP = inetAddr.getIP();
         user.Port = inetAddr.Port;
         user.UserName = this.m_objDeviceInfoEx.UserID;
         user.Password = this.m_objDeviceInfoEx.Password;
         
         var loginCommand:LoginCommand = new LoginCommand();
         loginCommand.setUser(user);
         loginCommand.setDestId(this.m_objDeviceInfoEx.DeviceID, this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
         var loginCommandStatus:int = loginCommand.getCommand(bufferParam);
         bufferParam.getBuffer().position = 0;
         
         if(loginCommandStatus != GeneralError.SN_SUCCESS)
         {
            return loginCommandStatus;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function parseLoginResponseCommand(responseParam:Buffer) : int
      {
         var _loc7_:int = 0;
         var responseCommand:ResponseCommand = new ResponseCommand();
         
         var status:int = responseCommand.parseCommand(responseParam);
         if(status != GeneralError.SN_SUCCESS)
         {
            return status;
         }
         
         var response:Response = responseCommand.getResponse();
         
         var requestId:int = response.RequestId;
         if(requestId != CommandConst.CONST_COMMANDID_LOGIN)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         
         var _loc6_:int = response.SucceedFlag;
         if(_loc6_ == Response::SUCCESSFLAG_ERROR)
         {
            _loc7_ = response.ErrorNo;
            return _loc7_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function getDeviceInfo() : DeviceInfoEx
      {
         return this.m_objDeviceInfoEx;
      }
      
      public function setDeviceInfo(param1:DeviceInfoEx) : void
      {
         this.m_objDeviceInfoEx = param1;
      }
      
      public function getTransferProtocol() : int
      {
         return this.m_iTransferProtocol;
      }
      
      public function setTransferProtocol(param1:int) : void
      {
         this.m_iTransferProtocol = param1;
      }
      
      public function get SessionId() : int
      {
         return this.m_iSessionId;
      }
      
      public function set SessionId(param1:int) : void
      {
         this.m_iSessionId = param1;
      }
      
      public function removeUser(param1:int) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:uint = 0;
         var _loc2_:uint = this.m_Users.length;
         var _loc3_:Vector.<int> = new Vector.<int>();
         while(_loc2_ > 0)
         {
            _loc4_ = this.m_Users.pop();
            if(_loc4_ == param1)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc3_.length)
               {
                  _loc4_ = _loc3_.pop();
                  this.m_Users.push(_loc4_);
                  _loc5_++;
               }
               return true;
            }
            _loc3_.push(_loc4_);
            _loc2_--;
         }
         return false;
      }
      
      public function increaseUsageCount(param1:int) : void
      {
         this.addUser(param1);
      }
      
      public function heartBeat() : int
      {
         if(this.m_Users.length == 0)
         {
            return GeneralError.SN_ERROR_BAD_ENVIRONMENT;
         }
         var _loc1_:int = this.sendHeartbeatCommand();
         if(_loc1_ != GeneralError.SN_SUCCESS)
         {
            this.m_Users.length = 0;
         }
         return _loc1_;
      }
      
      public function sendHeartbeatCommand() : int
      {
         var _loc11_:int = 0;
         var _loc1_:Buffer = new Buffer();
         var _loc2_:SessionHeartbeatCommand = new SessionHeartbeatCommand();
         _loc2_.SessionId = this.m_iSessionId;
         var _loc3_:int = _loc2_.getCommand(_loc1_);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         var _loc4_:TCPTransfer = new TCPTransfer();
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         _loc4_.SessionId = this.m_iSessionId;
         _loc3_ = _loc4_.sendCommand(_loc1_);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         var _loc5_:Buffer = new Buffer();
         var _loc6_:InetAddr = new InetAddr();
         _loc3_ = _loc4_.receiveCommand(_loc5_,_loc6_);
         _loc4_.close();
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         var _loc7_:ResponseCommand = new ResponseCommand();
         _loc3_ = _loc7_.parseCommand(_loc5_);
         if(GeneralError.SN_SUCCESS != _loc3_)
         {
            return _loc3_;
         }
         var _loc8_:Response = _loc7_.getResponse();
         var _loc9_:int = _loc8_.RequestId;
         if(_loc9_ != CommandConst.CONST_COMMANDID_SESSION_HEARTBEAT)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc10_:int = _loc8_.SucceedFlag;
         if(_loc10_ == Response.SUCCESSFLAG_ERROR)
         {
            _loc11_ = _loc8_.ErrorNo;
            return _loc11_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function decreaseUsageCount(param1:int) : void
      {
         this.removeUser(param1);
      }
      
      public function getUsageCount() : int
      {
         return this.m_Users.length;
      }
      
      public function logout(param1:int) : int
      {
         var _loc2_:int = 0;
         if(this.m_bLoginFlag)
         {
            _loc2_ = this.sendLogoutCommand();
            this.m_bLoginFlag = false;
         }
         if(_loc2_ != GeneralError.SN_SUCCESS)
         {
            return _loc2_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function sendLogoutCommand() : int
      {
         var _loc1_:int = 0;
         var _loc2_:Buffer = new Buffer();
         _loc1_ = this.createLogoutCommand(_loc2_);
         if(_loc1_ != GeneralError.SN_SUCCESS)
         {
            return _loc1_;
         }
         _loc1_ = this.m_objTCPTransfer.sendCommand(_loc2_);
         if(_loc1_ != GeneralError.SN_SUCCESS)
         {
            return _loc1_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function createLogoutCommand(param1:Buffer) : int
      {
         var _loc2_:InetAddr = this.m_objDeviceInfoEx.getDeviceAddr();
         var _loc3_:User = new User();
         _loc3_.IP = _loc2_.getIP();
         _loc3_.Port = _loc2_.Port;
         _loc3_.UserName = this.m_objDeviceInfoEx.UserID;
         _loc3_.Password = this.m_objDeviceInfoEx.Password;
         if(!(_loc3_.UserName = this.m_objDeviceInfoEx.UserID))
         {
            return SNError.SN_ERROR_LOGIN_USERNAME_ERROR;
         }
         if(!(_loc3_.Password = this.m_objDeviceInfoEx.Password))
         {
            return SNError.SN_ERROR_LOGIN_USERPASSWORD_ERROR;
         }
         var _loc4_:LogoutCommand = new LogoutCommand();
         _loc4_.setUser(_loc3_);
         _loc4_.setDestId(this.m_objDeviceInfoEx.DeviceID,this.m_objDeviceInfoEx.DeviceID.bytesAvailable);
         var _loc5_:int = _loc4_.getCommand(param1);
         param1.getBuffer().position = 0;
         if(_loc5_ != GeneralError.SN_SUCCESS)
         {
            return _loc5_;
         }
         return GeneralError.SN_SUCCESS;
      }
      
      public function parseLogoutResponseCommand(param1:Buffer) : int
      {
         var _loc7_:int = 0;
         var _loc2_:ResponseCommand = new ResponseCommand();
         var _loc3_:int = _loc2_.parseCommand(param1);
         if(_loc3_ != GeneralError.SN_SUCCESS)
         {
            return _loc3_;
         }
         var _loc4_:Response = _loc2_.getResponse();
         var _loc5_:int = _loc4_.RequestId;
         if(_loc5_ != CommandConst.CONST_COMMANDID_LOGOUT)
         {
            return SNError.SN_ERROR_NOT_EXPECT_RESPONSE;
         }
         var _loc6_:int = _loc4_.SucceedFlag;
         if(_loc6_ == Response::SUCCESSFLAG_ERROR)
         {
            _loc7_ = _loc4_.ErrorNo;
            return _loc7_;
         }
         return GeneralError.SN_SUCCESS;
      }
   }
}
