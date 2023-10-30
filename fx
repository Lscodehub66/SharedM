// let Name = "fx",Path  = if (try Excel.CurrentWorkbook(){[ Name = "GPS" ]}[Content][Column1]{0} otherwise "Remote" ) = "Remote" then "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM\" else "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM\",  EVA = Expression.Evaluate ( Text.FromBinary ( Binary.Buffer ( File.Contents ( Path&Name ) ) ) ,#shared )in    EVA//
//
(NameInput as text) =>
    let
        //NameInput = "", PathInput = null,
        GPS = try Table.Buffer(Excel.CurrentWorkbook(){[Name = "GPS"]}[Content])[Column1]{0} otherwise "Remote",
        Name_File = if not Text.StartsWith(NameInput,"fx") then "fx" & NameInput else NameInput,
        //
        FolderPath =
            if GPS = "Remote" then
                "C:\Users\ktkt2\OneDrive\EXE Team\DataHub\SharedM"
            else
                "\\itd-m09-fs02\dcm$\Team Folder\Execution Team\DataHub\SharedM",
        Path = FolderPath & (if Text.End(FolderPath, 1) <> "\" then "\" else ""),
        Path_GitHub = "https://raw.githubusercontent.com/Lscodehub66/DataHub/main/",
        //
        File_Folder = Folder.Files(Path),
        File_Filtered = Table.SelectRows(File_Folder, each [Name] = Name_File),
        File_Content = File_Filtered{0}[Content],
        File_Code = Text.FromBinary(Binary.Buffer(File_Content)),
        EVA_Existing = Expression.Evaluate(Name_File, #shared),
        EVA_Code = Expression.Evaluate(File_Code, #shared),
        EVA = try EVA_Existing otherwise EVA_Code
    in
        EVA
