 <# ExcelCopier#> 
robocopy "\\10.10.1.215\dcm$\0 DCM Base\4 Markets\Data" "Q:\Team Folder\Execution Team\DataHub\SharedM" Graph.xlsm   /z 
robocopy "\\10.10.1.215\dcm$\0 DCM Base\4 Markets" "Q:\Team Folder\Execution Team\DataHub\SharedM" *.xlsm   /z 
robocopy "\\10.10.1.215\dcm$\Team Folder\Execution Team\Rating & Advisory\7. ESG\Pitch book""Q:\Team Folder\Execution Team\DataHub\SharedM" .xlsx /z 
robocopy "\\10.10.1.215\dcm$\0 DCM Base\[DEAL EXECUTION]\KYC & AML" "Q:\Team Folder\Execution Team\DataHub\SharedM" *.xlsx   /z 
robocopy "\\10.10.1.215\dcm$\Team Folder\Execution Team\Weekly AM" "Q:\Team Folder\Execution Team\DataHub\SharedM\Weekly AM" *.xlsm /S /xo /z /e /NFL /NDL  /XD ss*  /XD vS*
robocopy "\\10.10.1.215\dcm$\Team Folder\Execution Team\Weekly AM" "Q:\Team Folder\Execution Team\DataHub\SharedM\Weekly AM" *.xlsm /S /xo /z /e /NFL /NDL /XD ss* /XD vS*