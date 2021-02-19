with PIN;

package Lock with SPARK_Mode is

   -- tracks whether 'locked' state is true/false
   type Lock is private;

   function Init_Lock(P : PIN.PIN) return Lock;

   function isLocked(L : Lock) return Boolean;

   procedure UnlockPB(L : in out Lock);

   procedure LockPB(L : in out Lock);

   function GetPin(L : Lock) return PIN.PIN;

   procedure SetPin(P : PIN.PIN; L : in out Lock);

private
   type Lock is record
      Locked : Boolean;
      MasterPin: PIN.PIN;
   end record;



end Lock;
