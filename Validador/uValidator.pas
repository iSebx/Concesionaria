unit uValidator;

interface

uses Variants, SysUtils, graphics;

type

  TErrorType = record
    ID: Integer;
    Msj: String;
  end;

  ValidatorExceptionNotNull = class (Exception);
  ValidatorExceptionOnlyNumber = class(Exception);
  ValidatorExceptionOnlyChars = class(Exception);
  ValidatorExceptionNonSpcChars = class(Exception);

  TDigits = set of '0'..'9';
  TLegalChars = set of 'A'..'z';
  TIlegalsChars = set of '['..'_';

  TDataType = (dtNumber, dtString);
  TValidationType = (vtNotNull, vtOnlyNumber, vtOnlyChars, vtNonSpecialChars, vtCanFix);

  TValidationsSet = set of TValidationType;

  TValidator = Class
    private
      FValue: Variant;
      FDataType: TDataType;
      FLastError: TErrorType;
      FSilent: Boolean;

      procedure SetSilent (Value: Boolean);
      procedure CheckNotNull;
      procedure CheckOnlyNumber;
      procedure CheckOnlyChars;
      procedure CheckNonSpecialChars;
      function Fix:String;
    public
      function Validate ( AStr: String; AValidationSets: TValidationsSet): String; overload;
      function Validate ( AInt: Integer; AValidationSets: TValidationsSet): Integer; overload;
    published
      property LastError: TErrorType read FLastError;
      property Silent: Boolean read FSilent write SetSilent;
  End;

const
  DIGITS : TDigits = ['0'..'9'];
  LEGAL_CHARS : TLegalChars = ['A'..'z'];
  ILEGAL_CHARS : TIlegalsChars = ['['..'_'];

  VALIDATION_ERROR_TYPE : array [0..4] of TErrorType = (
      (ID: 0; Msj:'Ancestor Error'),
      (ID: 1; Msj:'Null Value'),
      (ID: 2; Msj:'Not Only Number'),
      (ID: 3; Msj:'Not Only Chars'),
      (ID: 4; Msj:'Special Chars Founds')
    );

  CL_INVALID = clred;
  CL_VALID = clGreen;
implementation



procedure TValidator.CheckNotNull;
var
  LStrAux: String;
begin
    LStrAux:= VarToStr(self.FValue);
    if (Length(LStrAux)=0) then
      raise ValidatorExceptionNotNull.Create('No Null');
end;

procedure TValidator.CheckOnlyNumber;
var
  LStrAux: String;
  iCount: Integer;
  a: char;
begin
  LStrAux:= VarToStr(self.FValue);
  a:= LStrAux[1];
  for iCount := 1 to Length(LStrAux) do
    if  not (LStrAux[iCount] in digits) then
      raise ValidatorExceptionOnlyNumber.Create('No Only Number');
end;

procedure TValidator.CheckOnlyChars;
var
  LStrAux: String;
  iCount: integer;
begin
  LStrAux:= VarToStr(self.FValue);
  for iCount := 1 to Length(LStrAux) do
    if not(LStrAux[iCount]in LEGAL_CHARS) then
      raise ValidatorExceptionOnlyChars.Create('No OnlyChars');
end;

procedure TValidator.CheckNonSpecialChars;
var
  LStrAux: String;
  iCount: integer;
begin
  LStrAux:= VarToStr(self.FValue);
  for iCount := 1 to Length(LStrAux) do
    if not(LStrAux[iCount] in (LEGAL_CHARS+DIGITS)) then
      raise ValidatorExceptionNonSpcChars.Create('Ilegal Chars Found');
end;

function TValidator.Fix : String;
begin

end;

procedure TValidator.SetSilent(Value: Boolean);
begin
  if self.FSilent<>value then FSilent:=value;
end;

function TValidator.Validate ( AStr: String; AValidationSets: TValidationsSet): String;
begin
  FValue:= AStr;
  FDataType:= dtString;

  if vtNotNull in AValidationSets then
    CheckNotNull;
  if vtOnlyNumber in AValidationSets then
    CheckOnlyNumber;
  if vtOnlyChars in AValidationSets then
    CheckOnlyChars;
  if vtNonSpecialChars in AValidationSets then
    CheckNonSpecialChars;

  result:= Astr;
end;

function TValidator.Validate ( AInt: Integer; AValidationSets: TValidationsSet): Integer;
begin
  FValue:= AInt;
  FDataType:= dtNumber;

  if vtNotNull in AValidationSets then
    CheckNotNull;
  if vtOnlyNumber in AValidationSets then
    CheckOnlyNumber;
  if vtOnlyChars in AValidationSets then
    CheckOnlyChars;
  if vtNonSpecialChars in AValidationSets then
    CheckNonSpecialChars;

  result:= AInt;
end;

end.
