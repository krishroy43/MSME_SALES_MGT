tableextension 50034 "Ext Sales Line" extends "Sales Line"
{
    fields
    {
        field(50002; "Fixed Assets Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset";
            trigger
            OnValidate()
            var
                FixedAsstRecL: Record "Fixed Asset";
            begin
                FixedAsstRecL.Reset();
                if FixedAsstRecL.get("Fixed Assets Code") then
                    "FA Description" := FixedAsstRecL.Description;
                if "Fixed Assets Code" = '' then
                    Clear("FA Description");
            end;
        }
        field(50003; "FA Description"; Text[50])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50004; "Renting Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger
                OnValidate()
            begin
                CheckFixedAssetsAssaignDate("Fixed Assets Code");
            end;
        }
        field(50005; "Renting End Date"; date)
        {
            DataClassification = ToBeClassified;
            // Start 12-07-2019
            trigger
            OnValidate()
            begin
                if "Renting End Date" < "Renting Start Date" then
                    Error('End Date is always greater than Start Date');
            end;
            // Stop 12-07-2019
        }
    }
    // Start 12-07-2019
    procedure CheckFixedAssetsAssaignDate(FixedAssetsCode: Code[20])
    var
        SalesLineRecL: Record "Sales Line";
    begin
        //Message('Sales Order Subform Line main funcation');
        SalesLineRecL.Reset();
        SalesLineRecL.SetRange("Fixed Assets Code", FixedAssetsCode);
        SalesLineRecL.SetRange("Document Type", "Document Type");
        if SalesLineRecL.FindSet() then
            repeat
                if ("Renting Start Date" <= SalesLineRecL."Renting End Date") then
                    Error('Selected Asset is already rented for this period under document number - %1', SalesLineRecL."Document No.");
            until SalesLineRecL.Next() = 0;
    end;
    // Stop 12-07-2019




}

