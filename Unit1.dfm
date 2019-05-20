object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Info'
  ClientHeight = 272
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lb11: TLabel
    Left = 186
    Top = 162
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object lb8: TLabel
    Left = 129
    Top = 112
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object lb1: TLabel
    Left = 21
    Top = 23
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = dbedtNome
  end
  object lb2: TLabel
    Left = 301
    Top = 24
    Width = 52
    Height = 13
    Caption = 'Identidade'
    FocusControl = dbedtNome
  end
  object lb3: TLabel
    Left = 443
    Top = 24
    Width = 19
    Height = 13
    Caption = 'CPF'
    FocusControl = dbedtNome
  end
  object lb4: TLabel
    Left = 21
    Top = 64
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = dbedtNome
  end
  object lb5: TLabel
    Left = 179
    Top = 64
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lb6: TLabel
    Left = 21
    Top = 112
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object lb9: TLabel
    Left = 408
    Top = 112
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object lb10: TLabel
    Left = 21
    Top = 162
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object lb12: TLabel
    Left = 412
    Top = 162
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object lb13: TLabel
    Left = 456
    Top = 162
    Width = 19
    Height = 13
    Caption = 'Pais'
  end
  object lb14: TLabel
    Left = 469
    Top = 112
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object dbedtNome: TDBEdit
    Left = 21
    Top = 37
    Width = 264
    Height = 21
    DataField = 'Nome'
    DataSource = ds2
    TabOrder = 0
  end
  object dbedtIdentidade: TDBEdit
    Left = 300
    Top = 40
    Width = 122
    Height = 21
    DataField = 'Identidade'
    DataSource = ds2
    TabOrder = 1
  end
  object dbedtCPF: TDBEdit
    Left = 441
    Top = 40
    Width = 119
    Height = 21
    DataField = 'CPF'
    DataSource = ds2
    TabOrder = 2
  end
  object dbedtTelefone: TDBEdit
    Left = 21
    Top = 80
    Width = 125
    Height = 21
    DataField = 'Telefone'
    DataSource = ds2
    TabOrder = 3
  end
  object dbedtEmail: TDBEdit
    Left = 176
    Top = 80
    Width = 384
    Height = 21
    DataField = 'Email'
    DataSource = ds2
    TabOrder = 4
  end
  object dbeLogradouro: TDBEdit
    Left = 128
    Top = 128
    Width = 264
    Height = 21
    DataField = 'Logradouro'
    DataSource = ds2
    TabOrder = 6
  end
  object dbeNumero: TDBEdit
    Left = 408
    Top = 128
    Width = 51
    Height = 21
    DataField = 'Numero'
    DataSource = ds2
    TabOrder = 7
  end
  object dbeComplemento: TDBEdit
    Left = 467
    Top = 128
    Width = 93
    Height = 21
    DataField = 'Complemento'
    DataSource = ds2
    TabOrder = 8
  end
  object dbeBairro: TDBEdit
    Left = 21
    Top = 178
    Width = 149
    Height = 21
    DataField = 'Bairro'
    DataSource = ds2
    TabOrder = 9
  end
  object dbeCidade: TDBEdit
    Left = 186
    Top = 178
    Width = 203
    Height = 21
    DataField = 'Cidade'
    DataSource = ds2
    TabOrder = 10
  end
  object dbeEstado: TDBEdit
    Left = 408
    Top = 178
    Width = 30
    Height = 21
    DataField = 'Estado'
    DataSource = ds2
    TabOrder = 11
  end
  object dbePais: TDBEdit
    Left = 456
    Top = 178
    Width = 104
    Height = 21
    DataField = 'Pais'
    DataSource = ds2
    TabOrder = 12
  end
  object dbedtCep: TDBEdit
    Left = 21
    Top = 128
    Width = 89
    Height = 21
    DataField = 'Cep'
    DataSource = ds2
    TabOrder = 5
    OnExit = dbedtCepExit
  end
  object dbnvgr1: TDBNavigator
    Left = 20
    Top = 213
    Width = 540
    Height = 27
    DataSource = ds2
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    TabOrder = 13
  end
  object btMail: TButton
    Left = 21
    Top = 246
    Width = 78
    Height = 25
    Caption = 'Config. E-mail'
    TabOrder = 14
    OnClick = btMailClick
  end
  object btEnviar: TButton
    Left = 109
    Top = 246
    Width = 78
    Height = 25
    Caption = 'Enviar'
    TabOrder = 15
    OnClick = btEnviarClick
  end
  object pnMail: TPanel
    Left = 190
    Top = 2
    Width = 395
    Height = 271
    TabOrder = 16
    Visible = False
    object Label1: TLabel
      Left = 12
      Top = 163
      Width = 58
      Height = 13
      Caption = 'Destinat'#225'rio'
    end
    object Label2: TLabel
      Left = 40
      Top = 184
      Width = 30
      Height = 13
      Caption = 'anexo'
    end
    object Label5: TLabel
      Left = 42
      Top = 203
      Width = 28
      Height = 13
      Caption = 'Texto'
    end
    object Label6: TLabel
      Left = 49
      Top = 75
      Width = 21
      Height = 13
      Caption = 'host'
    end
    object Label7: TLabel
      Left = 44
      Top = 96
      Width = 26
      Height = 13
      Caption = 'porta'
    end
    object Label8: TLabel
      Left = 23
      Top = 119
      Width = 47
      Height = 13
      Caption = 'username'
    end
    object Label9: TLabel
      Left = 24
      Top = 142
      Width = 46
      Height = 13
      Caption = 'password'
    end
    object Label11: TLabel
      Left = 20
      Top = 33
      Width = 50
      Height = 13
      Caption = 'De (nome)'
    end
    object Label12: TLabel
      Left = 22
      Top = 56
      Width = 48
      Height = 13
      Caption = 'De (email)'
    end
    object Label3: TLabel
      Left = 31
      Top = 13
      Width = 39
      Height = 13
      Caption = 'Assunto'
    end
    object eddestemail: TEdit
      Left = 76
      Top = 156
      Width = 281
      Height = 21
      TabOrder = 7
    end
    object edanexo: TEdit
      Left = 76
      Top = 177
      Width = 281
      Height = 21
      Enabled = False
      TabOrder = 8
    end
    object edcorpodetexto: TMemo
      Left = 76
      Top = 199
      Width = 281
      Height = 41
      Lines.Strings = (
        'Dados do cadastro')
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object edhost: TEdit
      Left = 76
      Top = 72
      Width = 281
      Height = 21
      TabOrder = 3
    end
    object edport: TEdit
      Left = 76
      Top = 93
      Width = 281
      Height = 21
      TabOrder = 4
      Text = '587'
    end
    object edusername: TEdit
      Left = 76
      Top = 114
      Width = 281
      Height = 21
      TabOrder = 5
    end
    object edpassword: TEdit
      Left = 76
      Top = 135
      Width = 281
      Height = 21
      PasswordChar = '*'
      TabOrder = 6
    end
    object edfromname: TEdit
      Left = 76
      Top = 30
      Width = 281
      Height = 21
      TabOrder = 1
      Text = 'Nome Remetente'
    end
    object edfromemail: TEdit
      Left = 76
      Top = 51
      Width = 281
      Height = 21
      TabOrder = 2
    end
    object edAssuntoEmail: TEdit
      Left = 76
      Top = 10
      Width = 281
      Height = 21
      TabOrder = 0
      Text = 'Cadastro Efetuado'
    end
  end
  object qryCDS: TClientDataSet
    Aggregates = <>
    FileName = 'dados.xml'
    Params = <>
    Left = 492
    object qryCDSNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryCDSIdentidade: TStringField
      FieldName = 'Identidade'
    end
    object qryCDSCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryCDSTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object qryCDSEmail: TStringField
      FieldName = 'Email'
      Size = 30
    end
    object qryCDSEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object qryCDSCep: TStringField
      FieldName = 'Cep'
      Size = 8
    end
    object qryCDSLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 100
    end
    object qryCDSNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryCDSComplemento: TStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object qryCDSBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qryCDSCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qryCDSEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object qryCDSPais: TStringField
      FieldName = 'Pais'
      Size = 30
    end
  end
  object ds2: TDataSource
    DataSet = qryCDS
    Left = 524
  end
  object con1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=flavi' +
      'on-sisloc'
    Provider = 'MSDASQL.1'
    Left = 556
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 552
    Top = 32
  end
end
