package body Lock with SPARK_Mode is

   function Init_Lock(P : PIN.PIN) return Lock is
      -- initially the Lock is locked
      Result : Lock := (Locked => True, MasterPIN => P);
   begin
      return Result;
   end Init_Lock;

   function isLocked(L : Lock) return Boolean is
   begin
      return L.Locked;
   end isLocked;

   procedure UnlockPB(L: in out Lock) is
       begin
             L.Locked := False;
       end UnlockPB;

   procedure LockPB(L : in out Lock) is
      begin
             L.Locked := True;
   end LockPB;

   function GetPin(L : Lock) return PIN.PIN is
   begin
      return L.MasterPin;
   end GetPin;

   procedure SetPin(P: in PIN.PIN; L : in out Lock) is
   begin
      L.MasterPin := P;
   end SetPin;


end Lock;
