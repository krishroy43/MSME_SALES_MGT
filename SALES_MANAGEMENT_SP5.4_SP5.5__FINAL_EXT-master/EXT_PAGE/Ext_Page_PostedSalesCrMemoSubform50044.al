//Posted Sales Cr. Memo Subform

pageextension 50044 "Ext Pstd Sales Cr Memo Subform" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter("Deferral Code")
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