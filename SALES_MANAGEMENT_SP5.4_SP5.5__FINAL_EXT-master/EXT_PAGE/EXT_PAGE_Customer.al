pageextension 50008 "Ext. Customer" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("Proof & Verification")
            {
                field("ID Proof Type"; "ID Proof Type")
                {
                    ApplicationArea = All;
                }
                field("ID Proof No."; "ID Proof No.")
                {
                    ApplicationArea = All;
                }
                field("ID Proof Expiry Date"; "ID Proof Expiry Date")
                {
                    ApplicationArea = All;
                }
                field("Trade License"; "Trade License")
                {
                    ApplicationArea = All;
                }
                field("Trade License Expiry Date"; "Trade License Expiry Date")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

    trigger
    OnQueryClosePage(CloseAction: Action): Boolean
    begin
        // 13-09-2019
        // Customer again changes Requirement
        // // // if NOT (("Customer Posting Group" = 'INDIVIDUAL') OR ("Customer Posting Group" = 'FOREIGN')) then
        // // //     if "VAT Registration No." = '' then
        // // //         Error('Please Specify VAT Registration Number.');
    end;
}