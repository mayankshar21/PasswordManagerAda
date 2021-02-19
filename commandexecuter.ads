with Lock;
with PasswordDatabase;
with PIN;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package CommandExecuter with SPARK_Mode is

   procedure ExecuteLock(P: in PIN.PIN; L: in out Lock.Lock);
   procedure ExecuteLock (L : in out Lock.Lock);
   
   procedure ExecuteUnlock(P: in PIN.PIN; L: in out Lock.Lock);
   
   procedure ExecuteGet(U : in PasswordDatabase.URL; 
                       DB: in PasswordDatabase.Database;
                       R: in out Unbounded_String);
   
   procedure ExecutePut(U : in PasswordDatabase.URL; 
                        PW: in PasswordDatabase.Password; 
                        DB: in out PasswordDatabase.Database);
   
   procedure ExecuteRem(U: in PasswordDatabase.URL; 
                        DB:in out PasswordDatabase.Database);

end CommandExecuter;
