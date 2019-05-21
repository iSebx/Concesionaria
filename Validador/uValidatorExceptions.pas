unit uValidatorExceptions;

interface

uses
  SysUtils;

type

  TErrorType = record
    ID: Integer;
    Msj: String;
  end;

  CustomValidationException = Class(Exception)
    private
      FErrorCode : Integer;
      FSilent: Boolean;
    public
      Constructor Create (ASilent: boolean; AErrorValue: Integer);
    Published
      property ErrorCode: Integer read FErrorCode;
  End;

  ValidatorExceptionNotNull = class (CustomValidationException)
    public
      Constructor Create (ASilent: boolean);
    Published
      property ErrorCode;
  end;

  ValidatorExceptionOnlyNumber = class(CustomValidationException)
    public
      constructor Create (ASilent: boolean);
    Published
      property ErrorCode;
  end;

  ValidatorExceptionOnlyChars = class(CustomValidationException)
    public
      constructor Create (ASilent: boolean);
    Published
      property ErrorCode;
  end;

  ValidatorExceptionNonSpcChars = class(CustomValidationException)
    public
      constructor Create (ASilent: boolean);
    Published
      property ErrorCode;
  end;

const
  VALIDATION_ERROR_TYPE : array [0..4] of TErrorType = (
      (ID: 0; Msj:'Ancestor Error'),
      (ID: 1; Msj:'Null Value'),
      (ID: 2; Msj:'Not Only Number'),
      (ID: 3; Msj:'Not Only Chars'),
      (ID: 4; Msj:'Special Chars Founds')
    );

implementation

Constructor CustomValidationException.Create (ASilent: boolean; AErrorValue: Integer);
begin
  FErrorCode:= AErrorValue;
  if not ASilent
  then
    raise Exception.Create(VALIDATION_ERROR_TYPE[AErrorValue].Msj)
  else
    raise EAbort.Create('');
end;

Constructor ValidatorExceptionNotNull.Create (ASilent: boolean);
begin
  raise CustomValidationException.Create(ASilent, 1);
end;

Constructor ValidatorExceptionOnlyNumber.Create (ASilent: boolean);
begin
  raise CustomValidationException.Create(ASilent, 2);
end;

Constructor ValidatorExceptionOnlyChars.Create (ASilent: boolean);
begin
  raise CustomValidationException.Create(ASilent, 3);
end;

Constructor ValidatorExceptionNonSpcChars.Create (ASilent: boolean);
begin
  raise CustomValidationException.Create(ASilent, 4);
end;

end.
