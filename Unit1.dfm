object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 417
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 337
    Height = 404
    Margins.Top = 10
    Align = alLeft
    Caption = ' Register '
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitHeight = 257
    object Label1: TLabel
      Left = 57
      Top = 40
      Width = 52
      Height = 13
      Caption = 'User Name'
    end
    object Label2: TLabel
      Left = 63
      Top = 71
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label3: TLabel
      Left = 32
      Top = 102
      Width = 77
      Height = 13
      Caption = 'Verify Password'
    end
    object Label4: TLabel
      Left = 91
      Top = 134
      Width = 18
      Height = 13
      Caption = 'Salt'
    end
    object Label5: TLabel
      Left = 24
      Top = 212
      Width = 85
      Height = 13
      Caption = 'Hashed Password'
    end
    object Shape1: TShape
      Left = 24
      Top = 162
      Width = 293
      Height = 1
      Shape = stRoundRect
    end
    object SpeedButton1: TSpeedButton
      Left = 115
      Top = 243
      Width = 202
      Height = 73
      OnClick = SpeedButton1Click
    end
    object edUserName: TEdit
      Left = 115
      Top = 37
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = edUserNameExit
    end
    object edPassword1: TEdit
      Left = 115
      Top = 68
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object edPassword2: TEdit
      Left = 115
      Top = 99
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
    object edSalt: TEdit
      Left = 115
      Top = 131
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object btnSalt: TButton
      Left = 242
      Top = 129
      Width = 75
      Height = 25
      Caption = 'Generate'
      TabOrder = 4
      OnClick = btnSaltClick
    end
    object RadioButton1: TRadioButton
      Left = 168
      Top = 120
      Width = 1
      Height = 73
      Caption = 'RadioButton1'
      TabOrder = 5
    end
    object edHashed: TEdit
      Left = 115
      Top = 209
      Width = 202
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object btnRegister: TButton
      Left = 115
      Top = 172
      Width = 121
      Height = 25
      Caption = 'Hash'
      TabOrder = 7
      OnClick = btnRegisterClick
    end
  end
  object Memo1: TMemo
    Left = 343
    Top = 0
    Width = 532
    Height = 417
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssHorizontal
    TabOrder = 1
    WordWrap = False
    ExplicitLeft = 346
    ExplicitTop = -3
    ExplicitWidth = 426
  end
  object ADOConnection1: TADOConnection
    Left = 672
    Top = 40
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 680
    Top = 48
  end
end
