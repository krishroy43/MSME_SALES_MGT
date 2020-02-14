pageextension 50041 "Ext Sales Invoice Subform" extends "Sales Invoice Subform"
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