unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls,
  FMX.TabControl,
  System.Actions, FMX.ActnList, u99Permissions, FMX.MediaLibrary.Actions,
  FMX.StdActns;

type
  TFrmLogin = class(TForm)
    Layout1: TLayout;
    img_login_logo: TImage;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    edt_login_email: TEdit;
    StyleBook1: TStyleBook;
    Layout3: TLayout;
    RoundRect2: TRoundRect;
    edt_login_senha: TEdit;
    Layout4: TLayout;
    RoundRect3: TRoundRect;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabConta: TTabItem;
    Layout5: TLayout;
    Image1: TImage;
    Layout6: TLayout;
    RoundRect4: TRoundRect;
    edt_cad_nome: TEdit;
    Layout7: TLayout;
    RoundRect5: TRoundRect;
    edt_cad_email: TEdit;
    Layout8: TLayout;
    rec_Conta_Proximo: TRoundRect;
    Label2: TLabel;
    Layout9: TLayout;
    RoundRect7: TRoundRect;
    edt_cad_senha: TEdit;
    TabFoto: TTabItem;
    Layout10: TLayout;
    c_Foto_Editar: TCircle;
    Layout11: TLayout;
    RoundRect8: TRoundRect;
    Label3: TLabel;
    TabEscolher: TTabItem;
    Layout12: TLayout;
    Label4: TLabel;
    img_Foto: TImage;
    img_Library: TImage;
    Layout13: TLayout;
    img_Foto_Voltar: TImage;
    Layout14: TLayout;
    img_Escolher_Voltar: TImage;
    Layout15: TLayout;
    Layout16: TLayout;
    lbl_login_tab: TLabel;
    lbl_login_conta: TLabel;
    Rectangle1: TRectangle;
    ActionList1: TActionList;
    actConta: TChangeTabAction;
    actEscolher: TChangeTabAction;
    actFoto: TChangeTabAction;
    actLogin: TChangeTabAction;
    Layout17: TLayout;
    lbl_conta_login: TLabel;
    Label6: TLabel;
    Rectangle2: TRectangle;
    Layout18: TLayout;
    actLibrary: TTakePhotoFromLibraryAction;
    actCamera: TTakePhotoFromCameraAction;
    procedure lbl_login_contaClick(Sender: TObject);
    procedure lbl_conta_loginClick(Sender: TObject);
    procedure rec_Conta_ProximoClick(Sender: TObject);
    procedure img_Foto_VoltarClick(Sender: TObject);
    procedure c_Foto_EditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure img_FotoClick(Sender: TObject);
    procedure img_LibraryClick(Sender: TObject);
    procedure img_Escolher_VoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actLibraryDidFinishTaking(Image: TBitmap);
    procedure actCameraDidFinishTaking(Image: TBitmap);
  private
    { Private declarations }
    permissao: T99Permissions;
    procedure TrataErroPermissao(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

procedure TFrmLogin.actCameraDidFinishTaking(Image: TBitmap);
begin
  c_Foto_Editar.Fill.Bitmap.Bitmap := Image;
  actFoto.Execute;
end;

procedure TFrmLogin.actLibraryDidFinishTaking(Image: TBitmap);
begin
  c_Foto_Editar.Fill.Bitmap.Bitmap := Image;
  actFoto.Execute;
end;

procedure TFrmLogin.c_Foto_EditarClick(Sender: TObject);
begin
  actEscolher.Execute;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  permissao := T99Permissions.Create;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  permissao.DisposeOf;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  TabControl1.ActiveTab := TabLogin;
end;

procedure TFrmLogin.TrataErroPermissao(Sender: TObject);
begin
  ShowMessage('Você não tem permissão de acesso para esse recurso!');
end;

procedure TFrmLogin.img_Escolher_VoltarClick(Sender: TObject);
begin
  actFoto.Execute;
end;

procedure TFrmLogin.img_FotoClick(Sender: TObject);
begin
  permissao.Camera(actCamera, TrataErroPermissao);
end;

procedure TFrmLogin.img_Foto_VoltarClick(Sender: TObject);
begin
  actConta.Execute;
end;

procedure TFrmLogin.img_LibraryClick(Sender: TObject);
begin
  permissao.PhotoLibrary(actLibrary, TrataErroPermissao);
end;

procedure TFrmLogin.lbl_conta_loginClick(Sender: TObject);
begin
  actLogin.Execute;
end;

procedure TFrmLogin.lbl_login_contaClick(Sender: TObject);
begin
  actConta.Execute;
end;

procedure TFrmLogin.rec_Conta_ProximoClick(Sender: TObject);
begin
  actFoto.Execute;
end;

end.
