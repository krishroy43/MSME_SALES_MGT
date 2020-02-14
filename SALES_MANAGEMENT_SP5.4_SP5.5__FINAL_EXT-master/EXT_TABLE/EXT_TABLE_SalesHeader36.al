tableextension 50019 "Ext. Sales Header" extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        modify("Bill-to Customer No.")
        {
            trigger
            OnBeforeValidate()
            var
                SalesHeaderRecL: Record "Sales Header";
                CustomerRecL: Record Customer;
                AvailableCreditLimit: Decimal;
            begin
                IF NOT CustomerRecL.GET("Bill-to Customer No.") THEN
                    CustomerRecL.GET("Sell-to Customer No.");

                AvailableCreditLimit := CustomerRecL.CalcAvailableCredit;
                IF AvailableCreditLimit < 0 THEN
                    Error('The Customer %1 Credit limit has been exceeded.', "Bill-to Contact No.");


                // Start 01-07-2019
                //CheckCustomerVATRegNo("Bill-to Customer No.");
                // Stop 01-07-2019
            end;
        }
    }

    var
        myInt: Integer;

        // Start 01-07-2019
    procedure CheckCustomerVATRegNo(CustomerNo: code[20])
    var
        CustomerRecL: Record Customer;
    begin
        if CustomerRecL.get(CustomerNo) then begin

            if NOT ((CustomerRecL."Customer Posting Group" = 'INDIVIDUAL') OR (CustomerRecL."Customer Posting Group" = 'FOREIGN')) then
                if CustomerRecL."VAT Registration No." = '' then
                    Error('Please Specify VAT Registration Number.');
        end;
    end;
    // Stop 01-07-2019
}