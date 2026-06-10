let
    Source = Excel.Workbook(File.Contents("C:\Users\balaj\Downloads\Store+Data.xlsx"), null, true),
    #"Dim Promotion _Sheet" = Source{[Item="Dim Promotion ",Kind="Sheet"]}[Data],
    #"Changed Type" = Table.TransformColumnTypes(#"Dim Promotion _Sheet",{{"Column1", type text}, {"Column2", type text}, {"Column3", type text}, {"Column4", type text}, {"Column5", type text}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"PromotionID", type text}, {"Promotion Name", type text}, {"Ad Type", type text}, {"Coupon Code", type text}, {"Price Reduction Type", type text}}),
    #"Added Conditional Column" = Table.AddColumn(#"Changed Type1", "Percentage", each if [PromotionID] = "PR001" then 20 else if [PromotionID] = "PR002" then 10 else if [PromotionID] = "PR003" then 50 else if [PromotionID] = "PR004" then 50 else 70),
    #"Changed Type2" = Table.TransformColumnTypes(#"Added Conditional Column",{{"Percentage", Int64.Type}})
in
    #"Changed Type2"