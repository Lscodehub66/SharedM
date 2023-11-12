// Load
let GPS  = try Excel.CurrentWorkbook(){[ Name = "GPS" ]}[Content][Column1]{0} otherwise "Remote",  FilePath = if GPS = "Remote" then "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM\Load" else "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM\Load",  LoadCode = Text.FromBinary ( Binary.Buffer ( File.Contents ( FilePath ) ) ), EVA = Expression.Evaluate ( LoadCode, #shared ) in EVA

// deal_master
let
 Source = fx("Source")("DEALSMASTER_DEAL_MASTER"),
 KeyDate = List.Buffer(Load("Controller")[Monday]){0},
      Filtered = Table.SelectRows(    Source, each [删除及隐藏] = "" and  [定价日] < KeyDate and [定价日]>= #date(2022,1,1) )

in
    Filtered

// CWB
let GPS      = try Excel.CurrentWorkbook(){[ Name = "GPS" ]}[Content][Column1]{0} otherwise "Remote", Path = if GPS = "Remote" then "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM\CWB" else "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM\CWB",  LoadCode = Text.FromBinary ( Binary.Buffer ( File.Contents ( Path ) ) ),EVA = Expression.Evaluate ( LoadCode, #shared ) in EVA

// OVRDMonday
null meta [IsParameterQuery=true, List={"2023/03/20", "2023/03/27", "2023/04/03", "2023/04/10", "2023/04/17", "2023/04/24", "2023/05/01", "2023/05/08", "2023/05/15", "2023/05/22", "2023/05/29", "2023/06/05", "2023/06/12", "2023/06/19", "2023/06/26", "2023/07/03", "2023/07/10", "2023/07/17", "2023/07/24", "2023/07/31", "2023/08/07", "2023/08/14", "2023/08/21", "2023/08/28", "2023/09/04", "2023/09/11", "2023/09/18", "2023/09/25", "2023/10/02", "2023/10/09", "2023/10/16", "2023/10/23"}, DefaultValue=..., Type="Text", IsParameterQueryRequired=false]

// Status
let
    Monday = if OVRDMonday = "" or OVRDMonday = null  then CWB("Monday") else OVRDMonday,
    Source  = #table({"Updator","Monday"}, {{ CWB("UpdatorWeekly"), Date.From(Monday)}}),
    #"Added Custom1" = Table.AddColumn(Source, "当前", each Date.AddDays([Monday] ,-3),type date),
    Custom1 = Table.AddColumn(#"Added Custom1", "上周", each Date.AddDays([当前] ,-7),type date),
    Custom5 = Table.AddColumn(Custom1, "年初", each Load("fxNextWeekDay")(  Date.StartOfYear([Monday])),type date),
    Custom2 = Table.AddColumn(Custom5, "近1年", each Load("fxNextWeekDay")(  Date.AddYears([Monday] ,-1)),type date),
    Custom3 = Table.AddColumn(#"Custom2", "近5年", each Load("fxNextWeekDay")(  Date.AddYears([Monday] ,-5)),type date),
    #"Merged Queries" = Table.NestedJoin(Custom3, {"当前"}, DimDate, {"A_Date"}, "DimDate", JoinKind.LeftOuter),
    #"Expanded DimDate" = Table.ExpandTableColumn(#"Merged Queries", "DimDate", {"YYW"}, {"当前_YYW"}),
    #"Merged Queries1" = Table.NestedJoin(#"Expanded DimDate", {"上周"}, DimDate, {"A_Date"}, "DimDate", JoinKind.LeftOuter),
    #"Expanded DimDate1" = Table.ExpandTableColumn(#"Merged Queries1", "DimDate", {"YYW"}, {"上周_YYW"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Expanded DimDate1",{{"Monday", type date}})
in
    #"Changed Type"

// DimDate
let
    Source = Load("DimDate")
in
    Source

// CNH
let
 Source      = deal_master,
  Fn = Load("fxDBNewIssue")(    Source  , "DIMSUMFTZ")
 in
  Fn

// CNH_Pie
let
 Source             = Table.Buffer(CNH),
    Custom1 = Load("fxPieCount")(Source, "年月", Order.Ascending, "货币细分", "发行规模(亿)","笔数")
in
    Custom1

    // Load
let GPS  = try Excel.CurrentWorkbook(){[ Name = "GPS" ]}[Content][Column1]{0} otherwise "Remote",  FilePath = if GPS = "Remote" then "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM\Load" else "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM\Load",  LoadCode = Text.FromBinary ( Binary.Buffer ( File.Contents ( FilePath ) ) ), EVA = Expression.Evaluate ( LoadCode, #shared ) in EVA

// DimSum_Pie
//  let LoadCode = Load("USDCNH_Pie","Code"), EVA = Expression.Evaluate(LoadCode, #shared) in EVA
let
    Source = Table.Buffer(Load("DimSum")) ,

    Pie2 = Load("fxPie")(Source, "年", Order.Ascending, "板块", "笔数"),
    Pie3 = Load("fxPie")(Source, "年", Order.Ascending, "点心债年期分类", "笔数"),
    Pie4 = Load("fxPie")(Source, "年", Order.Ascending, "清算地", "笔数"),
    Pie5 = Load("fxPie")(Source, "年", Order.Ascending, "上市分类", "笔数"),
    Combined = fx("Combine")({  Pie2 ,Pie3, Pie4, Pie5}),
    Substracted = Table.AddColumn(Combined, "变动", each [23年笔数占比] - [22年笔数占比], Percentage.Type),
    Reordered = Table.ReorderColumns(
        Substracted, List.Distinct({"Index"} & Table.ColumnNames(Substracted)), MissingField.Ignore
    ),
    #"Sorted Rows" = Table.Sort(Reordered,{{"Column1", Order.Ascending}, {"23年笔数占比", Order.Descending}})
in
    #"Sorted Rows"


    // Load
let GPS  = try Excel.CurrentWorkbook(){[ Name = "GPS" ]}[Content][Column1]{0} otherwise "Remote",  FilePath = if GPS = "Remote" then "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM\Load" else "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM\Load",  LoadCode = Text.FromBinary ( Binary.Buffer ( File.Contents ( FilePath ) ) ), EVA = Expression.Evaluate ( LoadCode, #shared ) in EVA

// SBLC_Pie_Size
let
    Source = Table.Buffer(Load("SBLC")) ,

    Pie2 = Load("fxPie")(Source, "年", Order.Ascending, "货币", "亿美元"),
    Pie3 = Load("fxPie")(Source, "年", Order.Ascending, "板块", "亿美元"),
    Combined = fx("Combine")({  Pie2 ,Pie3}),
    Substracted = Table.AddColumn(Combined, "变动", each [23年占比] - [22年占比], Percentage.Type),
    Reordered = Table.ReorderColumns(
        Substracted, List.Distinct({"Index"} & Table.ColumnNames(Substracted)), MissingField.Ignore
    ),
    #"Sorted Rows" = Table.Sort(Reordered,{{"Column1", Order.Ascending}, {"23年占比", Order.Descending}})
in
    #"Sorted Rows"


    // Load
let GPS  = try Excel.CurrentWorkbook(){[ Name = "GPS" ]}[Content][Column1]{0} otherwise "Remote",  FilePath = if GPS = "Remote" then "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM\Load" else "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM\Load",  LoadCode = Text.FromBinary ( Binary.Buffer ( File.Contents ( FilePath ) ) ), EVA = Expression.Evaluate ( LoadCode, #shared ) in EVA

// SBLC_Pie_Count
let
    Source = Table.Buffer(Load("SBLC")) ,
Pie1= Load("fxPie")(deal_master, "年", Order.Ascending, "结构分类", "笔数"),

    Pie2 = Load("fxPie")(Source, "年", Order.Ascending, "结构", "笔数"),
    Pie3 = Load("fxPie")(Source, "年", Order.Ascending, "备证年期分类", "笔数"),

    Combined = fx("Combine")({ Pie1, Pie2 ,Pie3}),
    Substracted = Table.AddColumn(Combined, "变动", each [23年笔数占比] - [22年笔数占比], Percentage.Type),
    Reordered = Table.ReorderColumns(
        Substracted, List.Distinct({"Index"} & Table.ColumnNames(Substracted)), MissingField.Ignore
    ),
    #"Sorted Rows" = Table.Sort(Reordered,{{"Column1", Order.Ascending}, {"23年笔数占比", Order.Descending}})
in
    #"Sorted Rows"

// deal_master
let
 Source = fx("Source")("DEALSMASTER_DEAL_MASTER"),
 KeyDate = List.Buffer(Load("Controller")[Monday]){0},
      Filtered = Table.SelectRows(    Source, each [删除及隐藏] = "" and  [定价日] < KeyDate and [定价日]>= #date(2022,1,1) )

in
    Filtered

// CWB
let GPS      = try Excel.CurrentWorkbook(){[ Name = "GPS" ]}[Content][Column1]{0} otherwise "Remote", Path = if GPS = "Remote" then "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM\CWB" else "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM\CWB",  LoadCode = Text.FromBinary ( Binary.Buffer ( File.Contents ( Path ) ) ),EVA = Expression.Evaluate ( LoadCode, #shared ) in EVA

// OVRDMonday
null meta [IsParameterQuery=true, List={"2023/03/20", "2023/03/27", "2023/04/03", "2023/04/10", "2023/04/17", "2023/04/24", "2023/05/01", "2023/05/08", "2023/05/15", "2023/05/22", "2023/05/29", "2023/06/05", "2023/06/12", "2023/06/19", "2023/06/26", "2023/07/03", "2023/07/10", "2023/07/17", "2023/07/24", "2023/07/31", "2023/08/07", "2023/08/14", "2023/08/21", "2023/08/28", "2023/09/04", "2023/09/11", "2023/09/18", "2023/09/25", "2023/10/02", "2023/10/09", "2023/10/16", "2023/10/23"}, DefaultValue=..., Type="Text", IsParameterQueryRequired=false]

// Status
let
    Monday = if OVRDMonday = "" or OVRDMonday = null  then CWB("Monday") else OVRDMonday,
    Source  = #table({"Updator","Monday"}, {{ CWB("UpdatorWeekly"), Date.From(Monday)}}),
    #"Added Custom1" = Table.AddColumn(Source, "当前", each Date.AddDays([Monday] ,-3),type date),
    Custom1 = Table.AddColumn(#"Added Custom1", "上周", each Date.AddDays([当前] ,-7),type date),
    Custom5 = Table.AddColumn(Custom1, "年初", each Load("fxNextWeekDay")(  Date.StartOfYear([Monday])),type date),
    Custom2 = Table.AddColumn(Custom5, "近1年", each Load("fxNextWeekDay")(  Date.AddYears([Monday] ,-1)),type date),
    Custom3 = Table.AddColumn(#"Custom2", "近5年", each Load("fxNextWeekDay")(  Date.AddYears([Monday] ,-5)),type date),
    #"Merged Queries" = Table.NestedJoin(Custom3, {"当前"}, DimDate, {"A_Date"}, "DimDate", JoinKind.LeftOuter),
    #"Expanded DimDate" = Table.ExpandTableColumn(#"Merged Queries", "DimDate", {"YYW"}, {"当前_YYW"}),
    #"Merged Queries1" = Table.NestedJoin(#"Expanded DimDate", {"上周"}, DimDate, {"A_Date"}, "DimDate", JoinKind.LeftOuter),
    #"Expanded DimDate1" = Table.ExpandTableColumn(#"Merged Queries1", "DimDate", {"YYW"}, {"上周_YYW"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Expanded DimDate1",{{"Monday", type date}})
in
    #"Changed Type"

// DimDate
let
    Source = Load("DimDate")
in
    Source