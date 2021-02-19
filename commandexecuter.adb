pragma Ada_2012;
package body CommandExecuter is

   -----------------
   -- ExecuteLock --
   -----------------

   procedure ExecuteLock (P : in PIN.PIN; L : in out Lock.Lock) is
   begin
      if not Lock.isLocked(L) then
         Lock.SetPin(P,L);
         Lock.LockPB(L);
      end if;
   end ExecuteLock;

   procedure ExecuteLock (L : in out Lock.Lock) is
   begin
      if not Lock.isLocked(L) then
         Lock.LockPB(L);
      end if;
   end ExecuteLock;

   -------------------
   -- ExecuteUnlock --
   -------------------

   procedure ExecuteUnlock (P: in PIN.PIN; L : in out Lock.Lock) is
   begin
      if PIN."="(P, Lock.GetPin(L)) then
               Lock.UnlockPB(L);
            end if;
   end ExecuteUnlock;

   ----------------
   -- ExecuteGet --
   ----------------

   procedure ExecuteGet
     (U : in PasswordDatabase.URL; DB : in PasswordDatabase.Database;
      R : in out Unbounded_String) is
   begin
      if PasswordDatabase.Has_Password_For(DB,U) then
         R := To_Unbounded_String(PasswordDatabase.To_String(PasswordDatabase.Get(DB,U)));
      end if;
   end ExecuteGet;

   ----------------
   -- ExecutePut --
   ----------------

   procedure ExecutePut
     (U  : in     PasswordDatabase.URL; PW : in PasswordDatabase.Password;
      DB : in out PasswordDatabase.Database)
   is
   begin
      PasswordDatabase.Put(DB,U,PW);
   end ExecutePut;

   ----------------
   -- ExecuteRem --
   ----------------

   procedure ExecuteRem
     (U : in PasswordDatabase.URL; DB : in out PasswordDatabase.Database)
   is
   begin
      if PasswordDatabase.Has_Password_For(DB,U) then
         PasswordDatabase.Remove(DB,U);
      end if;

   end ExecuteRem;

end CommandExecuter;
