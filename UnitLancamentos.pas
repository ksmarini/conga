unit UnitLancamentos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrmLancamentos = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    img_Voltar: TImage;
    Layout2: TLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    lbl_mes: TLabel;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    img_Add: TImage;
    lv_lancamento: TListView;
    procedure img_VoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lv_lancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lv_lancamentoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure img_AddClick(Sender: TObject);
  private
    procedure EditarLancamento(id_lancamento: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLancamentos: TFrmLancamentos;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitLancamentosCad;

procedure TFrmLancamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Estamos destruindo no close do FrmPrincipal
  // Action := TCloseAction.caFree;
  // FrmLancamentos := nil;
end;

procedure TFrmLancamentos.FormShow(Sender: TObject);
var
  foto: TStream;
  x: integer;
begin
  foto := TMemoryStream.Create;
  FrmPrincipal.img_categoria.Bitmap.SaveToStream(foto);
  foto.Position := 0;

  for x := 1 to 10 do
    FrmPrincipal.AddLancamento(FrmLancamentos.lv_lancamento, '0001',
      'Compra equipamento', 'Informática', -99, date, foto);

  foto.DisposeOf;
end;

procedure TFrmLancamentos.img_AddClick(Sender: TObject);
begin
  EditarLancamento('');
end;

procedure TFrmLancamentos.img_VoltarClick(Sender: TObject);
begin
  Close;
end;

Procedure TFrmLancamentos.EditarLancamento(id_lancamento: string);
begin
  if not assigned(FrmLancamentosCad) then
    Application.CreateForm(TFrmLancamentosCad, FrmLancamentosCad);
  FrmLancamentosCad.Show;
end;

procedure TFrmLancamentos.lv_lancamentoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  EditarLancamento('');
end;

procedure TFrmLancamentos.lv_lancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FrmPrincipal.SetupLancamento(FrmLancamentos.lv_lancamento, AItem);
end;

end.
