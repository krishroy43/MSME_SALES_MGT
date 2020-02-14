report 50013 "Rented Asset Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Sales_Line_; "Sales Line")
        {
            RequestFilterFields = "Document No.";
            DataItemTableView = SORTING("Document No.") WHERE("Fixed Assets Code" = FILTER(<> ''), "Document Type" = CONST(Order));

            column(Document_No_; "Document No.") { }
            column(Description; Description) { }
            column(Description_2; "Description 2") { }
            //column(Renting_Start_Date; "Renting Start Date") { }
            //column(Renting_End_Date; "Renting End Date") { }
            column(Renting_Start_Date; Format("Renting Start Date", 0, '<Day,2>/<Month,2>/<Year4>')) { }
            column(Renting_End_Date; Format("Renting End Date", 0, '<Day,2>/<Month,2>/<Year4>')) { }
            column(Amount; Amount) { }
            column(Line_Amount; "Line Amount") { }

            column(CustomerRecG_Name; CustomerRecG.Name) { }
            //column(CustomerRecG_Name; CustomerRecG.Name) { }
            //column(ContactRecG_Name; ContactRecG.Name) { }
            column(ContactRecG_Name; Contact_NameG) { }
            //column(ContactRecG_Name; SalesHeaderRecG."Sell-to Contact") { }
            column(ContactRecG_phone; ContactRecG."Phone No.") { }
            //column(ContactRecG_phone; Contact_Phone) { }

            column(FixedAsstRecG_Desc1; FixedAsstRecG.Description) { }
            //column(FixedAsstRecG_Desc1; FixedAsstRecG_Desc1) { }
            column(FixedAsstRecG_Desc2; FixedAsstRecG."Description 2") { }
            //column(FixedAsstRecG_Desc2; FixedAsstRecG_Desc2) { }

            trigger
            OnAfterGetRecord()
            begin
                FixedAsstRecG.Reset();
                SalesHeaderRecG.Reset();
                ContactRecG.Reset();
                CustomerRecG.Reset();
                Clear(Contact_NameG);
                Clear(Contact_Phone);
                Clear(Customer_Name);
                Clear(FixedAsstRecG_Desc1);
                Clear(FixedAsstRecG_Desc2);

                IF FixedAsstRecG.Get("Fixed Assets Code") then begin
                    FixedAsstRecG_Desc1 := FixedAsstRecG.Description;
                    FixedAsstRecG_Desc2 := FixedAsstRecG."Description 2";
                end;
                if SalesHeaderRecG.get("Document Type"::Order, "Document No.") then begin
                    if CustomerRecG.get(SalesHeaderRecG."Sell-to Customer No.") then begin
                        Customer_Name := CustomerRecG.Name;

                    end;
                    if ContactRecG.get(SalesHeaderRecG."Sell-to Contact No.") then begin
                        Contact_NameG := ContactRecG.Name;
                        Contact_Phone := ContactRecG."Phone No.";

                    end;
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    //{
                    //   ApplicationArea = All;

                    // }
                }
            }
        }


    }


    labels
    {
        HeaderLBL = 'Rental Details';
        RentalDetailsLBL = 'Rental Details';
        SrNoLBL = 'Sr. No';
        DocumentNoLBL = 'Document No.';
        CabinDetailsLBL = 'Cabin Details';
        RentingDetailsLBL = ' Renting Details';
        RentingStartingdate = 'Renting Starting date';
        RentingEnddateLBL = 'Renting End date';
        CustomerLBL = 'Customer ';
        ContactpersonLBL = 'Contact person';
        ContactDetailsLBL = 'Contact Details';
        RentLBL = 'Rent';
        TaxLBL = 'Tax';
        TotalAmountLBL = 'Total Amount';

    }
    var
        SalesHeaderRecG: Record "Sales Header";
        FixedAsstRecG: Record "Fixed Asset";
        ContactRecG: Record Contact;
        Contact_NameG: Text[80];
        Contact_Phone: Text[20];
        CustomerRecG: Record Customer;
        Customer_Name: Text[80];
        FixedAsstRecG_Desc1: Text[250];
        FixedAsstRecG_Desc2: Text[250];




}

