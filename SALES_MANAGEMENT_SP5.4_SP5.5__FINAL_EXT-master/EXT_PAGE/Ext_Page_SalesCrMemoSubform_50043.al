//Sales Cr. Memo Subform
pageextension 50043 "Ext Sales Cr. Memo Subform" extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter("Qty. Assigned")
        {
            field("Fixed Assets Code"; "Fixed Assets Code")
            {
                ApplicationArea = All;
            }
            field("FA Description"; "FA Description")
            {
                ApplicationArea = All;
            }
            field("Renting Start Date"; "Renting Start Date")
            {
                ApplicationArea = All;
            }
            field("Renting End Date"; "Renting End Date")
            {
                ApplicationArea = All;
            }
        }
    }
}