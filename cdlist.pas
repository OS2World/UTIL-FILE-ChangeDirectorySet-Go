uses TpDos, TpString, DOS;
var StoredPath, CDSGdir, ext, fullname : string;
    cdsgfile : text;
    x : integer;
    rec : searchRec;

procedure error(s:string);
begin
  writeln('Error: ',s);
  writeln('Type CDS for instructions.');
  writeln;
  halt(1);
  end;


begin
  writeln('Change Directory Set/Go - by GLen');
  writeln('CDList - Lists keys and directories currently saved.');
  CDSGdir:=GetEnv('CDSG');
  if CDSGdir='' then error ('Environment string CDSG is not set.');
  findfirst(CDSGdir+'\*.*', AnyFile-Directory, rec);
  writeln('Stored Key         Path refered to by Key');
  writeln('-----------------  --------------------------------------------');
  while DOSError = 0 do begin
     assign(cdsgfile,CDSGdir+'\'+rec.name);
     if IOResult <> 0 then error('Problem with Environment string CDSG.');
     reset(cdsgfile);
     readln(cdsgfile,StoredPath);
     if StoredPath='' then error('Problem with CDSG system - file empty...');
     writeln(Pad(rec.name,19),StoredPath);
     FindNext(rec);
     end;
end.
