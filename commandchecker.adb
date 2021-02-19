package body CommandChecker is

   function CheckCommand(L : in out Lock.Lock;
                         DB: in out PasswordDatabase.Database;
                         FirstToken : in Unbounded_String;
                         SecondToken : in Unbounded_String;
                         ThirdToken : in Unbounded_String)
                         return Unbounded_String is
   Result : Unbounded_String := To_Unbounded_String("");
   U1 : PasswordDatabase.URL;
   P1 : PasswordDatabase.Password;
   begin
      -- locked commands
      if isLocked(L) then
         if FirstToken = "unlock" then
            CommandExecuter.ExecuteUnlock(PIN.From_String(
                                          To_String(SecondToken)),L);
         end if;
      -- unlocked commands
      else
         if FirstToken = "get" then
            U1 := PasswordDatabase.From_String(To_String(SecondToken));
            CommandExecuter.ExecuteGet(U1,DB,
                                       Result);

         elsif FirstToken = "rem" then
            U1 := PasswordDatabase.From_String(To_String(SecondToken));
            CommandExecuter.ExecuteRem(U1,DB);

         elsif FirstToken = "lock" then
            if Ada.Strings.Unbounded.Length(SecondToken) = 0 then
               CommandExecuter.ExecuteLock(L);
            else
               CommandExecuter.ExecuteLock(PIN.From_String(
                                           To_String(SecondToken)), L);
               LockPB(L);
            end if;

         elsif FirstToken = "put" then
            U1 := PasswordDatabase.From_String(To_String(SecondToken));
            P1 := PasswordDatabase.From_String(To_String(ThirdToken));
            CommandExecuter.ExecutePut(U1,P1,DB);
         end if;

      end if;
      return Result;
   end CheckCommand;

end CommandChecker;
