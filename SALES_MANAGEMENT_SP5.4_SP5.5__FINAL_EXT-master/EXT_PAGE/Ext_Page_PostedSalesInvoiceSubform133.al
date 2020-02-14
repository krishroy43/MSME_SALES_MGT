//Posted Sales Invoice Subform
pageextension 50045 "Ext Pstd Sales Invoice Subform" extends "Posted Sales Invoice Subform"
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