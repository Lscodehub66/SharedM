let
    Source = fxLauncher("台账23", "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\PERIODICALs.xlsx"),
    美元债一级20230707_Sheet = Source{[Item="美元债一级",Kind="Sheet"]}[Data],
    #"Promoted Headers1" = Table.PromoteHeaders(美元债一级20230707_Sheet, [PromoteAllScalars=true]),
    PromotedHeaders = Table.PromoteHeaders(#"Promoted Headers1", [PromoteAllScalars=true]),
    Custom3 = fxDMILoad(PromotedHeaders),
    #"Filtered Rows2" = Table.SelectRows(Custom3, each [定价日] > #date(2020, 1, 1)),
    AStructure = Table.AddColumn(#"Filtered Rows2", "结构", each fxSmartClean([发行架构], "Structure")),
    Custom1 = Table.AddColumn(AStructure, "备证行", each fxSNBankCorp([SBLC提供者])),
    SelectedCol = Table.SelectColumns(Custom1,{"Check","债券简称", "信用主体","发行人","备证行","结构","担保人","维好协议提供者"}),
    Custom2 = Table.AddColumn(SelectedCol, "通过分行", each if Text.Contains([信用主体],"银行") and fxSNBranch([发行人]) = "" then "【总行】" else if Text.Contains([信用主体],"银行") then  fxSNBranch([发行人]) & "分行" else ""),
   Replaced2 = Table.ReplaceValue(
            Custom2 ,
        each [备证行],
        each
            if Text.Contains([结构], "备证") and [备证行] = "" then
                "【】"
            else if Text.Contains([信用主体], "银行") and [备证行] <> "" then
                "【" & [备证行] & "】"
            else
                [备证行],
        Replacer.ReplaceValue,
        {"备证行"}
    ),
    Replaced3 = Table.ReplaceValue(
        Replaced2 ,
      each [信用主体],
        each
            if Text.StartsWith([结构], "维好") and [信用主体]<>[维好协议提供者]  then
                "【" & [信用主体] & "】"&"【" & [维好协议提供者] & "】"
            else
                [信用主体],
        Replacer.ReplaceValue,
        {"信用主体"}
    ),
    Replaced4 = Table.ReplaceValue(
        Replaced3 ,
      each [信用主体],
        each
            if Text.Contains([结构], "维好") and [维好协议提供者] = "" then
                 "【" & [信用主体] & "】"&"【" & [维好协议提供者] & "】"
            else
                [信用主体],
        Replacer.ReplaceValue,
        {"信用主体"}
    ),
    Replaced5 = Table.ReplaceValue(
        Replaced4 ,
      each [通过分行],
        each
            if Text.Contains([信用主体], "银行") and [通过分行] = "" then
                "【】"
            else
                [通过分行],
        Replacer.ReplaceValue,
        {"通过分行"}
    ),
        Replaced6 = Table.ReplaceValue(
        Replaced5 ,
      each [维好协议提供者],
        each
            if ([备证行] <> "" and not Text.Contains([结构], "备证")) or
             ([担保人] <> "" and not Text.Contains([结构], "担保")) or 
              ([维好协议提供者] <> "" and not Text.Contains([结构], "维好"))  then
                 "【" & [结构] & "】"
            else
                [结构],
        Replacer.ReplaceValue,
        {"结构"}
    ),
    SelectedRows = Table.SelectRows(Replaced6, each  Text.Contains([通过分行], "【") or Text.Contains([结构], "【") or Text.Contains([维好协议提供者], "【")  or Text.Contains([担保人], "【") or
     Text.Contains([备证行], "【") )
in
 SelectedRows


// originals


   Replaced2 = Table.ReplaceValue(
        #"Sorted Rows",
        each [备证行],
        each
            if Text.Contains([结构], "备证") and [备证行] = "" then
                "【】"
            else if Text.Contains([信用主体], "银行") and [备证行] <> "" then
                "【" & [备证行] & "】"
            else
                [备证行],
        Replacer.ReplaceValue,
        {"备证行"}
    ),
    Replaced3 = Table.ReplaceValue(
        Replaced2 ,
      each [担保人],
        each
            if Text.Contains([结构], "担保") and [担保人] = "" then
                "【】"
            else
                [担保人],
        Replacer.ReplaceValue,
        {"担保人"}
    ),
    Replaced4 = Table.ReplaceValue(
        Replaced3 ,
      each [维好协议提供者],
        each
            if Text.Contains([结构], "维好") and [维好协议提供者] = "" then
                "【】"
            else
                [维好协议提供者],
        Replacer.ReplaceValue,
        {"维好协议提供者"}
    ),
    Replaced5 = Table.ReplaceValue(
        Replaced4 ,
      each [通过分行],
        each
            if Text.Contains([信用主体], "银行") and [通过分行] = "" then
                "【】"
            else
                [通过分行],
        Replacer.ReplaceValue,
        {"通过分行"}
    ),
        Replaced6 = Table.ReplaceValue(
        Replaced5 ,
      each [维好协议提供者],
        each
            if ([备证行] <> "" and not Text.Contains([结构], "备证")) or
             ([担保人] <> "" and not Text.Contains([结构], "担保")) or 
              ([维好协议提供者] <> "" and not Text.Contains([结构], "维好"))  then
                 "【" & [结构] & "】"
            else
                [结构],
        Replacer.ReplaceValue,
        {"结构"}
    ),
    SelectedRows = Table.SelectRows(Replaced6, each  Text.Contains([通过分行], "【") or Text.Contains([结构], "【") or Text.Contains([维好协议提供者], "【")  or Text.Contains([担保人], "【") or
     Text.Contains([备证行], "【") )
in
 SelectedRows

 // 台账23
let
 Source           = fxLauncher ( "台账23", null ), 
 项目收入情况2023_Sheet = Source{[ Item = "项目收入情况2023", Kind = "Sheet" ]}[Data], 
 RemovedTop       = Table.Skip ( 项目收入情况2023_Sheet, 1 ), 
 PromotedHeaders  = Table.PromoteHeaders ( RemovedTop, [ PromoteAllScalars = true ] ), 
 Filtered         = Table.SelectRows ( PromotedHeaders, each if WeeklyFilter <> "OFF" then [项目定价日] < Date.FromText ( Monday ) and [项目定价日] >= Date.AddDays ( Date.FromText ( Monday ), - 7 ) else true ), 
 SelectedCol      = Table.SelectColumns ( Filtered, { "Project Name", "ISIN Code", "项目名称（集团全称）", "序号", "担任角色", "新规角色", "团队", "项目定价日" }, MissingField.UseNull ), 
 Replaced         = Table.ReplaceValue ( SelectedCol, "NON-JGC", "JBR", Replacer.ReplaceText, { "担任角色" } ), 
 Replaced2        = Table.ReplaceValue ( Replaced, each [团队], each if [团队] <> null then [团队] & "组" else "--", Replacer.ReplaceText, { "团队" } ), 
 RenamedCol = Table.RenameColumns ( Replaced2, { { "序号", "台账序号" }, { "团队", "COVERAGE" }, { "ISIN Code", "ISIN" } } ),
 Crossroads       =   if GNG = "GO" then fxDynamicMerge( RenamedCol, DLDconso, "ISIN","ISIN",{headers_BISL},{})
 else Table.SelectColumns(DLDconso, headers_BISL, MissingField.UseNull)


in
 Crossroads 


// 台账23
let
 Source           = fxLauncher ( "台账23", null ), 
 项目收入情况2023_Sheet = Source{[ Item = "项目收入情况2023", Kind = "Sheet" ]}[Data], 
 RemovedTop       = Table.Skip ( 项目收入情况2023_Sheet, 1 ), 
 PromotedHeaders  = Table.PromoteHeaders ( RemovedTop, [ PromoteAllScalars = true ] ), 
 Filtered         = Table.SelectRows ( PromotedHeaders, each if WeeklyFilter <> "OFF" then [项目定价日] < Date.FromText ( Monday ) and [项目定价日] >= Date.AddDays ( Date.FromText ( Monday ), - 7 ) else true ), 
 SelectedCol      = Table.SelectColumns ( Filtered, { "Project Name", "ISIN Code", "项目名称（集团全称）", "序号", "担任角色", "新规角色", "团队", "项目定价日" }, MissingField.UseNull ), 
 Replaced         = Table.ReplaceValue ( SelectedCol, "NON-JGC", "JBR", Replacer.ReplaceText, { "担任角色" } ), 
 Replaced2        = Table.ReplaceValue ( Replaced, each [团队], each if [团队] <> null then [团队] & "组" else "--", Replacer.ReplaceText, { "团队" } ), 
 RenamedCol       =  if MultiSource = "OFF" then Excel.CurrentWorkbook(){[ Name = "台账23" ]}[Content] else Table.RenameColumns ( Replaced2, { { "序号", "台账序号" }, { "团队", "COVERAGE" }, { "ISIN Code", "ISIN" } } )
in
 RenamedCol


 'let
RemovedDMI_headers = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("VZBhboJAEIXvwu/eiHCXtWJdwVaNgULCtsEo1KQqJloX0PYyzMxyiyKrCf7cb9+b92ZM01DuHv0hbRmlmWE9mQZMZioeo5/DedICinpVedF/rKjjHLiA1FU7m4pU49G6uoQYfdbhtAXoeOpoKzZQhwT5Cb3sEdO+hA/3kQF/Adm/xwCXGDH0s1osgJ1bfK0l+jCYVWWA7yttb0W0+rrq+Jrehp0l1PHUFL1LK+mAfG5eTVHtDXYwTTCTVG6ayA6DTQCvnnYVSwzm5Pwg6+lzjHLcOihi/P7Vtf4EFUln7i08tYGHhmX9Aw==", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [Column1 = _t]),
 Headers =RemovedDMI_headers[Column1],
    CheckNew = if List.Count( List.RemoveMatchingItems(Table.ColumnNames(dmi),ColNow_mDMI &Headers) ) = 0 
    then {DateTime.ToText(DateTime.LocalNow(),"yy/M/d h:00"),"未检测到DMI有新增列"} else  List.RemoveMatchingItems(Table.ColumnNames(dmi),ColNow_mDMI & Headers)
in
   CheckNew'