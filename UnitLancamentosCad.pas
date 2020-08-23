unit UnitLancamentosCad;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit,
  FMX.DateTimeCtrls;

type
  TFrmLancamentosCad = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    img_Voltar: TImage;
    img_save: TImage;
    Layout2: TLayout;
    Label2: TLabel;
    edt_login_email: TEdit;
    Line1: TLine;
    Layout3: TLayout;
    Label3: TLabel;
    Line2: TLine;
    Layout4: TLayout;
    Label4: TLabel;
    Edit2: TEdit;
    Line3: TLine;
    Layout5: TLayout;
    Label5: TLabel;
    Edit3: TEdit;
    Line4: TLine;
    DateEdit1: TDateEdit;
    Image1: TImage;
    Image2: TImage;
    Rectangle1: TRectangle;
    img_Add: TImage;
    procedure img_VoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancamentosCad: TFrmLancamentosCad;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmLancamentosCad.img_VoltarClick(Sender: TObject);
begin
  Close;
end;

end.
