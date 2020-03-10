/* REXX */
/* Adapted from CDG.PAS */

say "Change Directory Set/Go - by GLen"

CDSGdir = value('CDSG',,'os2environment')
if CDSGdir = "" then call Error 'Environment string CDSG is not set.'

arg key
if key = "" then call Error 'No key given.'

path = linein(CDSGdir'\'key)
if path = "" then call Error 'Given key "'key'" not previously set, or error in CDSG.'

if path \= directory(path) then call Error 'Path "'path'" not available now.'
exit


Error:
parse arg message
say "Error:" message
say "Type CDS for instructions."
exit 1
