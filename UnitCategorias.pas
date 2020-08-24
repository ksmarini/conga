unit UnitCategorias;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TFrmCategorias = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    img_Voltar: TImage;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Label6: TLabel;
    img_Add: TImage;
    lv_categorias: TListView;
    procedure img_VoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lv_categoriasUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure img_AddClick(Sender: TObject);
    procedure lv_categoriasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure CadCategoria(id_Cat: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCategorias: TFrmCategorias;

implementation

{$R *.fmx}

uses UnitPrincipal, UnitCategoriasCad;

procedure TFrmCategorias.CadCategoria(id_Cat: String);
begin
  if not Assigned(FrmCategoriasCad) then
    Application.CreateForm(TFrmCategoriasCad, FrmCategoriasCad);

  if id_Cat = '' then
    FrmCategoriasCad.lbl_titulo.text := 'Nova Categoria'
  else
    FrmCategoriasCad.lbl_titulo.text := 'Editar Categoria';

  FrmCategoriasCad.Show;
end;

procedure TFrmCategorias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FrmCategorias := nil;
end;

procedure TFrmCategorias.FormShow(Sender: TObject);
var
  foto: TStream;
  x: integer;
begin
  foto := TMemoryStream.Create;
  FrmPrincipal.img_categoria.Bitmap.SaveToStream(foto);
  foto.Position := 0;

  for x := 1 to 10 do
    FrmPrincipal.AddCategoria(lv_categorias, '0001', 'Informática', foto);

  foto.DisposeOf;
end;

procedure TFrmCategorias.img_AddClick(Sender: TObject);
begin
  CadCategoria('');
end;

procedure TFrmCategorias.img_VoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCategorias.lv_categoriasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  CadCategoria(AItem.TagString);
end;

procedure TFrmCategorias.lv_categoriasUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FrmPrincipal.SetupCategoria(lv_categorias, AItem);
end;

end.
