unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFrmPrincipal = class(TForm)
    Layout1: TLayout;
    img_Menu: TImage;
    Circle1: TCircle;
    Image1: TImage;
    Label1: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Image2: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Layout6: TLayout;
    Image3: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Rectangle1: TRectangle;
    Image4: TImage;
    Rectangle2: TRectangle;
    Layout7: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    lv_lancamento: TListView;
    img_categoria: TImage;
    procedure FormShow(Sender: TObject);
    procedure lv_lancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure AddLancamento(id_lancamento, descricao, categoria: String;
      valor: Double; dt: TDateTime; foto: TStream);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.AddLancamento(id_lancamento, descricao,
  categoria: String; valor: Double; dt: TDateTime; foto: TStream);
var
  txt: TListItemText;
  img: TListItemImage;
  bmp: TBitmap;
begin
  with lv_lancamento.Items.Add do
  begin
    // exemplo de uso com variável
    txt := TListItemText(Objects.FindDrawable('txtDescricao'));
    txt.Text := descricao;

    // outro exemplo, porém com acesso direto, dispensando o usu de variáveis
    TListItemText(Objects.FindDrawable('txtCategoria')).Text := categoria;
    // Sem o formatFloat a atribuição retornaria um erro devido ao tipo double ser incompatível com o tipo string
    TListItemText(Objects.FindDrawable('txtValor')).Text :=
      FormatFloat('#,##0.00', valor);
    TListItemText(Objects.FindDrawable('txtData')).Text := FormatDateTime('dd/mm', dt);

    //Ícone -> também poderia ser feito sem o uso da variável
    img := TListItemImage(Objects.FindDrawable('imgIcone'));

    if foto <> nil then
    begin
      bmp := TBitmap.Create;
      bmp.LoadFromStream(foto);

      //Essa parte só faz quando a imagem está sendo setada em tempo de execução
      //Se a imagem estiver estática, vindo do disco ou banco, dará access violation
      //Caso o comando abaixo não existisse, a lista no android viria em branco
      img.OwnsBitmap := True;

      img.Bitmap := bmp;
    end;
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  foto: TStream;
  x: integer;
begin
  foto := TMemoryStream.Create;
  img_categoria.Bitmap.SaveToStream(foto);
  foto.Position := 0;

  for x := 1 to 10 do
    AddLancamento('0001', 'Compra equipamento', 'Informática', -99, date, foto);

  foto.DisposeOf;
end;

procedure TFrmPrincipal.lv_lancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
  txt: TListItemText;
begin
  //determina até onde o texto da descrição pode extender antes de cortar a descrição
    txt := TListItemText(AItem.Objects.FindDrawable('txtDescricao'));
    txt.Width := lv_lancamento.Width - txt.PlaceOffset.X - 80;
end;

end.
