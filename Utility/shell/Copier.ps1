 <# ExcelCopier#> 
robocopy "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub" "Q:\Team Folder\Execution Team\DataHub\SharedM\Backup" *.xlsm   /z 
robocopy "\\itd-m09-fs02\dcm$\0 DCM Base\4 Markets\Data" "Q:\Team Folder\Execution Team\DataHub\SharedM\Backup" Graph.xlsm   /z 
robocopy "\\itd-m09-fs02\dcm$\0 DCM Base\4 Markets" "Q:\Team Folder\Execution Team\DataHub\SharedM\Backup" *.xlsm   /z 
robocopy "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\Rating & Advisory\7. ESG\Pitch book""Q:\Team Folder\Execution Team\DataHub\SharedM\Backup" .xlsx /z 
robocopy "\\itd-m09-fs02\dcm$\0 DCM Base\[DEAL EXECUTION]\KYC & AML" "Q:\Team Folder\Execution Team\DataHub\SharedM\Backup" *.xlsx   /z 
robocopy "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\Weekly AM" "Q:\Team Folder\Execution Team\DataHub\SharedM\Weekly AM" *.xlsm /S /xo /z /e /NFL /NDL  /XD ss*  /XD vS*
robocopy "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\Weekly AM" "Q:\Team Folder\Execution Team\DataHub\SharedM\Weekly AM" *.xlsm /S /xo /z /e /NFL /NDL /XD ss* /XD vS*