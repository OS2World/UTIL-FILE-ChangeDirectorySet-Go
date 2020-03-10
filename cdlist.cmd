/* REXX */
/* Adapted from CDList.PAS */

say "Change Directory Set/Go - by GLen"
say "CDList - Lists keys and directories currently saved."
CDSGdir = value('CDSG',,'os2environment')
if CDSGdir = "" then call error 'Environment string CDSG is not set.'
'@rxqueue /clear'
'@dir' CDSGdir '/b | rxqueue /fifo'
say "Stored Key         Path refered to by Key"
say "-----------------  --------------------------------------------"
do queued()
   parse upper pull keyName
   StoredPath = linein(cdsgdir'\'keyName)
   if StoredPath='' then call error 'Problem with CDSG system - file empty...'
   say left(keyName,18) StoredPath
   end
exit
/* end */

error:
parse arg s
say "Error:" s
say "Type CDS for instructions."
say
exit 1
