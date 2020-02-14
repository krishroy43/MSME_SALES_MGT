pageextension 50092 "Ext Fixed Asset Card" extends "Fixed Asset Card"
{
    layout
    {
        addafter(Insured)
        {
            field("Date Of Issue"; "Date Of Issue")
            {
                ApplicationArea = All;
            }
            field("Issued to"; "Issued to")
            {
                ApplicationArea = All;
            }
            field("Issue to Name"; "Issue to Name")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        modify("FA Book Value")
        {
            Visible = false;
        }
        addlast(Reporting)
        {
            action("FA Book Value -1")
            {
                ApplicationArea = All;
                Caption = 'FA Book Value';
                RunObject = report "Custmz.Fixed Asset Buk Val. 01";

            }
        }
    }
}


pageextension 50093 "Ext Fixed  Asset List" extends "Fixed Asset List"
{
    actions
    {
        modify("FA Book Value")
        {
            Visible = false;
        }
        addlast(Reporting)
        {
            action("FA Book Value -1")
            {
                ApplicationArea = All;
                Caption = 'FA Book Value';
                RunObject = report "Custmz.Fixed Asset Buk Val. 01";

            }
        }
    }
}