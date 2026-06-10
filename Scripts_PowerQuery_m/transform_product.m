let
    Source = Excel.Workbook(File.Contents("C:\Users\balaj\Downloads\Store+Data.xlsx"), null, true),
    #"Dim Product_Sheet" = Source{[Item="Dim Product",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(#"Dim Product_Sheet", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ProductID", type text}, {"Product Name", type text}, {"Product Line", type text}, {"Price (INR)", Int64.Type}}),
    #"Renamed Columns" = Table.RenameColumns(#"Changed Type",{{"Price (INR)", "Price Per Unit (INR)"}})
in
    #"Renamed Columns"