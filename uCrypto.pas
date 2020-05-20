unit uCrypto;

interface

uses
  Classes, System.Hash, System.Generics.Collections,
  uTPLb_CryptographicLibrary, uTPLb_Codec, uTPLb_Hash;

type
  TCrypto = class
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function GenerateSalt(size: Integer = 8): string;
    function StrToHex(value: string): string;
    function StringToHash(salt, value: string): string;
  private
    FLib: TCryptographicLibrary;
    FCodec: TCodec;
    FHashSHA2: THashSHA2;
  end;

implementation

uses
  uTPLb_Constants, System.SysUtils;

{ TCrypto }

constructor TCrypto.Create(AOwner: TComponent);
var
  FHash: THash;
begin
  FLib   := TCryptographicLibrary.Create(AOwner); { TCrypto }
  FHash := uTPLb_Hash.THash.Create(nil);
  FHash.CryptoLibrary := FLib;
  FHash.HashId := SHA256_ProgId;
  FHash.Begin_Hash;
  FHashSHA2 := THashSHA2.Create(SHA256);
end;

destructor TCrypto.Destroy;
begin
  FCodec.Free;
  FLib.Free;
  FHashSHA2.Reset;
  inherited;
end;

function TCrypto.GenerateSalt(size: Integer = 8): string;
var
  I: Integer;
  arr: TArray<Char>;
begin
  Result := '';
  for I := 0 to size - 1 do
    Result := Result + IntToHex(Random(255), 2);
end;

function TCrypto.StringToHash(salt, value: string): string;
begin
  Result := FHashSHA2.GetHashString(salt + value, SHA256);
end;

function TCrypto.StrToHex(value: string): string;
var
  I: Integer;
begin
  Result := '';
  if value = '' then Exit;
  for I := 1 to value.Length do
    Result := Result + IntToHex(Ord(value[I]), 2);
end;

end.
