let
    Source = Excel.Workbook(File.Contents("C:\Users\balaj\Downloads\Store+Data.xlsx"), null, true),
    #"Dim Customers_Sheet" = Source{[Item="Dim Customers",Kind="Sheet"]}[Data],
    #"Promoted Headers" = Table.PromoteHeaders(#"Dim Customers_Sheet", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Customer ID", type text}, {"Customer Name", type text}, {"City", type text}, {"State", type text}, {"Pincode", Int64.Type}, {"EmailID", type text}, {"Phone Number", Int64.Type}})
in
    #"Changed Type"