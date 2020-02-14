tableextension 50055 "Fixed Asset" extends "Fixed Asset"
{
    fields
    {
        field(50001; "Date Of Issue"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Issued to"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Issues to No.';
            TableRelation = Employee;
            trigger
            OnValidate()
            var
                EmpRecL: Record Employee;
            begin
                if ("Issued to" <> xRec."Issued to") then begin
                    if EmpRecL.Get("Issued to") then begin
                        "Issue to Name" := EmpRecL."First Name";
                        Modify();
                    end
                    else
                        if ("Issued to" = '') then
                            Clear("Issue to Name");
                end;
            end;
        }
        field(50003; "Issue to Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }
}