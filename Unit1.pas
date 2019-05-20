unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Mask, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, uLkJSON, ExtCtrls, ADODB,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdIOHandlerStack, IdSSL,
  IdServerIOHandler, IdEMailAddress, IdAttachmentFile;


type
  TMain = class(TForm)
    qryCDS: TClientDataSet;
    qryCDSNome: TStringField;
    qryCDSIdentidade: TStringField;
    qryCDSCPF: TStringField;
    qryCDSTelefone: TStringField;
    qryCDSEmail: TStringField;
    qryCDSEndereco: TStringField;
    qryCDSCep: TStringField;
    qryCDSLogradouro: TStringField;
    qryCDSNumero: TStringField;
    qryCDSComplemento: TStringField;
    qryCDSBairro: TStringField;
    qryCDSCidade: TStringField;
    qryCDSEstado: TStringField;
    qryCDSPais: TStringField;
    lb1: TLabel;
    dbedtNome: TDBEdit;
    ds2: TDataSource;
    dbedtIdentidade: TDBEdit;
    dbedtCPF: TDBEdit;
    dbedtTelefone: TDBEdit;
    dbedtEmail: TDBEdit;
    dbeLogradouro: TDBEdit;
    dbeNumero: TDBEdit;
    dbeComplemento: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCidade: TDBEdit;
    dbeEstado: TDBEdit;
    dbePais: TDBEdit;
    dbedtCep: TDBEdit;
    dbnvgr1: TDBNavigator;
    con1: TADOConnection;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lb8: TLabel;
    lb9: TLabel;
    lb10: TLabel;
    lb11: TLabel;
    lb12: TLabel;
    lb13: TLabel;
    lb14: TLabel;
    pnMail: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    eddestemail: TEdit;
    edanexo: TEdit;
    edcorpodetexto: TMemo;
    edhost: TEdit;
    edport: TEdit;
    edusername: TEdit;
    edpassword: TEdit;
    edfromname: TEdit;
    edfromemail: TEdit;
    btMail: TButton;
    btEnviar: TButton;
    IdHTTP1: TIdHTTP;
    edAssuntoEmail: TEdit;
    Label3: TLabel;
    procedure dbedtCepExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btMailClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
  private
    FEndereco: string;
    anexo: string;
    procedure consultacep(cep: string);
    procedure extraicep(endereco: string);
    procedure LimpaEndereco;
    procedure ConfiguraEmail;
    procedure SendSimpleMail;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.consultacep(cep: string);
const VIACEP = 'http://viacep.com.br/ws/%s/json';
var Endereco: string;
begin
  Endereco  := IdHTTP1.Get(format(VIACEP,[cep]));
  FEndereco := endereco;
end;

procedure TMain.extraicep(endereco: string);
var json: TlkJSON;
    jsonbase: TlkJSONbase;
begin
  json := TlkJSON.Create;
  try
    jsonbase := json.ParseText(endereco);
    qryCDSLogradouro.AsString :=  jsonbase.Field['logradouro'].Value;
    qryCDSBairro.AsString     :=  jsonbase.Field['bairro'].Value;
    qryCDSCidade.AsString     :=  jsonbase.Field['localidade'].Value;
    qryCDSEstado.AsString     :=  jsonbase.Field['uf'].Value
  finally
    json.free;
  end;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  qryCDS.CreateDataSet;
  ConfiguraEmail;
end;

procedure TMain.btEnviarClick(Sender: TObject);
var caminho: string;
begin
  if qryCDS.IsEmpty then
    ShowMessage('Não há dados para serem enviados.')
  else
  begin
    caminho := extractfilepath(Application.ExeName);
    qryCDS.SaveToFile(caminho + '\dados.xml', dfXML);
    anexo := caminho + '\dados.xml';
    SendSimpleMail;
  end;
end;

procedure TMain.SendSimpleMail;
  function hasAnexo: Boolean;
  begin
    Result := False;
    if anexo <> '' then
    begin
       Result := True;
       if not fileExists(anexo) then
         raise exception.create('Arquivo anexado inválido. Verifique o caminho do arquivo anexado ou utilize o processo de remover anexo para enviar o email sem nenhum arquivo adicional.');
    end;
  end;
var
  IdSMTP: TIdSMTP;
  IdEmailAddressItem: TIdEmailAddressItem;
  FIdMessage: TIdMessage;
begin
  IdSMTP := TIdSMTP.Create(nil);
  FIdMessage := TIdMessage.Create(nil);
  if hasAnexo then
    TIdAttachmentFile.Create(FIdmessage.MessageParts,anexo);
  try
    try
      IdSMTP.Host := edhost.text;
      IdSMTP.Port := strtoint(edport.text);
      IdSMTP.AuthType := atDefault;
      IdSMTP.Username := edusername.text;
      IdSMTP.Password := edpassword.text;
      IdSMTP.Connect;
      if IdSMTP.Authenticate then
      begin
          FIDMessage.From.Name := edfromname.text;
          FIDMessage.From.Address := edfromemail.text;
          FIDMessage.Subject := edAssuntoEmail.text;
          FIDMessage.Body.Add(edcorpodetexto.Text);
          IdEmailAddressItem := FIDMessage.Recipients.Add;
          IdEmailAddressItem.Address := eddestemail.Text;
          try
            IdSMTP.Send(FIDMessage);
            ShowMessage('SUA MENSAVEM FOI ENVIADA COM SUCESSO.');
          finally
            //
          end;
      end;
      IdSMTP.Disconnect;
    except
     on e: exception do
     begin
       if e.message = '' then
         e.message := 'VERIFICAR SE O EMAIL DIGITADO É VÁLIDO!!!';
       raise exception.create('Erro ao enviar email.  + #13#13 + MENSAGEM TÉCNICA: '+#13+e.message);
     end;
    end;
  finally
    IdSMTP.Free;
    FIDMessage.Free;
  end;
end;

procedure TMain.btMailClick(Sender: TObject);
begin
  pnMail.Visible := not pnMail.Visible;
end;

procedure TMain.ConfiguraEmail;
begin
//  IdSMTP1.Host := 'smtp.gmail.com';
//  IdSMTP1.Password := 'nois12@#';
//  IdSMTP1.Port := 465;
//  IdSMTP1.Username := 'seulogin@gmail.com';
//  IdSMTP1.IOHandler := SSLSocket;
//
//  SSLSocket.SSLOptions.Method := sslvSSLv2;
//  SSLSocket.SSLOptions.Mode := sslmClient;

end;

procedure TMain.LimpaEndereco;
begin
  qryCDSCep.Clear;
  qryCDSLogradouro.Clear;
  qryCDSBairro.Clear;
  qryCDSCidade.Clear;
  qryCDSEstado.Clear;
end;

procedure TMain.dbedtCepExit(Sender: TObject);
begin
  try
    if qryCDS.State in [dsEdit, dsInsert] then
    begin
      consultacep(dbedtCep.Text);
      extraicep(FEndereco);
    end;
  except
    ShowMessage('CEP não encontrado, por favor verifique.');
    LimpaEndereco;
  end;
end;

end.
