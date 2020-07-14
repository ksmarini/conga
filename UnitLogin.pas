unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl,
  System.Actions, FMX.ActnList;

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
    RoundRect6: TRoundRect;
    Label2: TLabel;
    Layout9: TLayout;
    RoundRect7: TRoundRect;
    edt_cad_senha: TEdit;
    TabFoto: TTabItem;
    Layout10: TLayout;
    Circle1: TCircle;
    Layout11: TLayout;
    RoundRect8: TRoundRect;
    Label3: TLabel;
    TabEscolher: TTabItem;
    Layout12: TLayout;
    Label4: TLabel;
    Image2: TImage;
    Image3: TImage;
    Layout13: TLayout;
    Image4: TImage;
    Layout14: TLayout;
    Image5: TImage;
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
    Label5: TLabel;
    Label6: TLabel;
    Rectangle2: TRectangle;
    Layout18: TLayout;
    procedure lbl_login_contaClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

procedure TFrmLogin.Label2Click(Sender: TObject);
begin
  actFoto.Execute;
end;

procedure TFrmLogin.Label3Click(Sender: TObject);
begin
  actEscolher.Execute;
end;

procedure TFrmLogin.lbl_login_contaClick(Sender: TObject);
begin
  actConta.Execute;
end;

end.
