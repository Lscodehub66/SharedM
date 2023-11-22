robocopy "\\10.10.1.215\dcm$\Team Folder\Execution Team\Weekly AM" "$Env:UserProfile\Desktop\TransferHub\Weekly" 交银国际境外债市周报*.pdf /S /xo /z /e /NFL /NDL /NJH /NJS
Get-ChildItem "$Env:UserProfile\Desktop\TransferHub\Weekly" -recurse -force -filter "*.pdf" | Copy-Item -Destination "Q:\0 DCM Base\4 Markets\境外债市周报合集"
exit 3 