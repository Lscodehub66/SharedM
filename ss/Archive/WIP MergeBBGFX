  (TableName as table, DateColName as text, BaseCCYCol as text , optional USDCNHHKD as text) =>
    let
        Source = TableName,
        AddCols = {YYQQCol, "QNum", "Date_QStart", "Date_QEnd"},
        Removed = Table.RemoveColumns(Source, AddCols, MissingField.Ignore),
     
  
  #"Merged Queries1" = Table.NestedJoin(#"Removed Other Columns", {DateColName}, Load("DimDate"), {"A_Date"},  "Data", JoinKind.LeftOuter),
    #"Expanded DimDate" = Table.ExpandTableColumn(#"Merged Queries1", "Data", {YYQQCol}, {YYQQCol}),
   
   fxGetBBGFX =
 (TableName as table, TermCCY as text, BaseCCYCol as text , YYQQCol as text)=>
 BBGFX_CurrentQ = Table.Buffer(Load("BBGFX_CurrentQ")),
 Filtered1 = Table.SelectRows(BBGFX_CurrentQ, each [Term Currency] ="USD"),
    #"Merged Queries1" = Table.NestedJoin(TableName, {BaseCCYCol, YYQQCol},  Filtered, {"Base Currency", YYQQCol}, "Data", JoinKind.LeftOuter),
    #"Expanded BBGFXPQ1" = Table.ExpandTableColumn(#"Merged Queries1", "Data", {"C_FX"}, {"C_FX"&"_USD"})

     Filtered2 = Table.SelectRows(BBGFX_CurrentQ, each [Term Currency] ="CNH"),
    #"Merged Queries2" = Table.NestedJoin(TableName, {BaseCCYCol, YYQQCol},  Filtered, {"Base Currency", YYQQCol}, "Data", JoinKind.LeftOuter),
    #"Expanded BBGFXPQ2" = Table.ExpandTableColumn(#"Merged Queries2", "Data", {"C_FX"}, {"C_FX"&"_CNH"})

     Filtered3 = Table.SelectRows(BBGFX_CurrentQ, each [Term Currency] ="HKD"),
    #"Merged Queries3" = Table.NestedJoin(TableName, {BaseCCYCol, YYQQCol},  Filtered, {"Base Currency", YYQQCol}, "Data", JoinKind.LeftOuter),
    #"Expanded BBGFXPQ" = Table.ExpandTableColumn(#"Merged Queries1", "Data", {"C_FX"}, {"C_FX"&"_HKD"})