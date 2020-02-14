tableextension 50013 "Ext. Job" extends Job
{
    fields
    {
        modify("Bill-to Customer No.")
        {
            trigger
            OnBeforeValidate()
            var
                SalesHeaderRecL: Record "Sales Header";
                TotalSalesAmountL: Decimal;
                CustomerRecL: Record Customer;
            begin
                SalesHeaderRecL.RESET;
                SalesHeaderRecL.SETRANGE("Sell-to Customer No.", "Bill-to Customer No.");
                IF SalesHeaderRecL.FINDSET THEN
                    REPEAT
                        SalesHeaderRecL.CALCFIELDS(Amount);
                        TotalSalesAmountL += SalesHeaderRecL.Amount;
                    UNTIL SalesHeaderRecL.NEXT = 0;

                IF CustomerRecL.GET("Bill-to Customer No.") THEN
                    if CustomerRecL."Credit Limit (LCY)" <> 0 then
                        IF NOT (TotalSalesAmountL < CustomerRecL."Credit Limit (LCY)") THEN
                            ERROR('The Customer %1 Credit limit has been exceeded.', CustomerRecL."No.");
                // Start 01-07-2019
                CheckCustomerVATRegNo("Bill-to Customer No.");
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