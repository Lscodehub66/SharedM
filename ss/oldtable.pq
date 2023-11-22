 Source = Tables,
    CN = List.Range(Tables_CN,List.PositionOf(Tables_CN, CN_Index{1}),6),
   RenamePair = List.Zip({CN, List.Transform(CN,each Text.BeforeDelimiter(_,"_"))}),
    SCol = Table.SelectColumns(Source,CN),
    Renamed = Table.RenameColumns(SCol,   RenamePair),
      Filtered = Table.SelectRows(  Renamed, each [Index] <> null),
#"Sorted Rows" = Table.Sort(Filtered,{{"Index", Order.Ascending}}) in
#"Sorted Rows"