uses TpDos, DOS;
var storedPath, CDSGdir, keyName : string;
    cdsgfile : text;
    x : integer;

procedure error(s:string);
begin
  writeln('Error: ',s);
  writeln('Type CDS for instructions.');
  writeln;
  halt(1);
  end;

begin
  writeln('Change Directory Set/Go - by GLen');
  CDSGdir:=GetEnv('CDSG');
  if CDSGdir='' then error ('Environment string CDSG is not set.');
  if ParamCount=0 then error ('No key given.');
  keyName:=ParamStr(1);
  assign(cdsgfile,CDSGdir+'\'+keyName);
  if IOResult <> 0 then error('Error with Environment string CDSG.');
  reset(cdsgfile);
  if IOResult <> 0 then error('Given key "'+keyName+'" not previously set.');
  readln(cdsgfile,storedPath);
  if storedPath='' then error('Error in CDSG system - file empty...');
  SelectDrive(storedPath[1]);
  if storedPath[1]<>defaultDrive then error('Drive "'+storedPath[1]+':" not available now.');
  chdir(storedPath);
  if IOResult <> 0 then error ('Path "'+storedPath+'" not found on drive.');
end.
