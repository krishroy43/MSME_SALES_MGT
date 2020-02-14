pageextension 50009 "Ext. Customer Listpage" extends "Customer List"
{

    layout
    {
        modify("No.")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;

        }
        modify(Name)
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify("Responsibility Center")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify("Location Code")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify("Phone No.")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify(Contact)
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify("Balance (LCY)")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify("Balance Due (LCY)")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify("Sales (LCY)")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }
        modify("Payments (LCY)")
        {
            StyleExpr = StypeExprBool;
            Style = Unfavorable;
        }


    }

    actions
    {
        // Add changes to page actions here
    }

    var
        StypeExprBool: Boolean;


    trigger
    OnOpenPage()
    begin
        StypeExprBool := false;
    end;

    trigger
    OnAfterGetRecord()
    begin
        AlertCustomerexpiryperiod("No.");


    end;



    procedure AlertCustomerexpiryperiod(CustNo: Code[30])
    var
        CustRecL: Record Customer;
    begin
        CustRecL.Reset();
        if CustRecL.Get(CustNo) then
            if (("Trade License Expiry Date" < Today()) AND ("Trade License Expiry Date" <> 0D)) OR
            (("ID Proof Expiry Date" < Today) AND ("ID Proof Expiry Date" <> 0D))
             then
                StypeExprBool := true
            else
                StypeExprBool := false;
        // CurrPage.Update(true);

    end;
}