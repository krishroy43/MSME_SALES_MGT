//Sales Cr.Memo Line
tableextension 50035 "Ext Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
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
                if FixedAsstRecL.get("Fixed Assets Code") then
                    "FA Description" := FixedAsstRecL.Description;

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
        }
        field(50005; "Renting End Date"; date)
        {
            DataClassification = ToBeClassified;
            trigger
            OnValidate()
            begin
                if "Renting End Date" < "Renting Start Date" then
                    Error('End Date is always greater than Start Date');
            end;
        }


    }

}