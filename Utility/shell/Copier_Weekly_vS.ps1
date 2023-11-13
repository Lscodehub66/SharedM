robocopy "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\Weekly\vS" "$Env:UserProfile\Desktop\TransferHub\Weekly" 交银国际境外债市周报*.pdf /S /xo /z /e /NFL /NDL /NJH
Get-ChildItem "$Env:UserProfile\Desktop\TransferHub\Weekly" -recurse -force -filter "*.pdf" | Copy-Item -Destination "Z:\0 DCM Base\4 Markets\境外债市周报合集"
exit 3 