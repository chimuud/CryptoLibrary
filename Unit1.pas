unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  System.Hash, Vcl.Buttons;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edUserName: TEdit;
    edPassword1: TEdit;
    edPassword2: TEdit;
    Label4: TLabel;
    edSalt: TEdit;
    btnSalt: TButton;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    Shape1: TShape;
    edHashed: TEdit;
    btnRegister: TButton;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    procedure btnSaltClick(Sender: TObject);
    procedure edUserNameExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FHash256: THashSHA2;
    FHashVersion: THashSHA2.TSHA2Version;

    function GenerateSalt(size: Integer = 8): string;
    function StrToHex(value: string): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ShellApi;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Available versions: //SHA224,SHA256,SHA384,SHA512,SHA512_224,SHA512_256
  FHashVersion := SHA256;

  FHash256 := THashSHA2.Create(FHashVersion);
  SpeedButton1.Caption :=
    'Copy source text and' + #13#10 +
    'Verify online' + #13#10 +
    'with SHA256';
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FHash256.Reset;
end;


procedure TForm1.btnRegisterClick(Sender: TObject);
var
  src: string;
begin
  if edPassword1.Text <> edPassword2.Text then
  begin
    ShowMessage('Password must be identical');
    Exit;
  end;

  src := edSalt.Text + edPassword1.Text;
  edHashed.Text := FHash256.GetHashString(src, FHashVersion);
  Memo1.Text := 'Source: ' + src;
  Memo1.Lines.Add('Hashed Password: ' + edHashed.Text);
  Memo1.Lines.Add('Hash as String: ' + FHash256.HashAsString);
  Memo1.Lines.Add('Hash Block Size: ' + FHash256.GetBlockSize.ToString);
  Memo1.Lines.Add('Hash Hash Size: ' + FHash256.GetHashSize.ToString);
end;

procedure TForm1.btnSaltClick(Sender: TObject);
begin
  edSalt.Text := GenerateSalt();
end;

procedure TForm1.edUserNameExit(Sender: TObject);
begin
  edSalt.Text := StrToHex(edUserName.Text);
end;

function TForm1.GenerateSalt(size: Integer = 8): string;
var
  I: Integer;
  arr: TArray<Char>;
begin
  Result := '';
  for I := 0 to size - 1 do
    Result := Result + IntToHex(Random(255), 2);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://www.tools4noobs.com/online_tools/hash?qaz';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

function TForm1.StrToHex(value: string): string;
var
  I: Integer;
begin
  Result := '';
  if value = '' then Exit;
  for I := 1 to value.Length do
    Result := Result + IntToHex(Ord(value[I]), 2);
end;

end.
