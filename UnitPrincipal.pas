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
    // exemplo de uso com vari�vel
    txt := TListItemText(Objects.FindDrawable('txtDescricao'));
    txt.Text := descricao;

    // outro exemplo, por�m com acesso direto, dispensando o usu de vari�veis
    TListItemText(Objects.FindDrawable('txtCategoria')).Text := categoria;
    // Sem o formatFloat a atribui��o retornaria um erro devido ao tipo double ser incompat�vel com o tipo string
    TListItemText(Objects.FindDrawable('txtValor')).Text :=
      FormatFloat('#,##0.00', valor);
    TListItemText(Objects.FindDrawable('txtData')).Text := FormatDateTime('dd/mm', dt);

    //�cone -> tamb�m poderia ser feito sem o uso da vari�vel
    img := TListItemImage(Objects.FindDrawable('imgIcone'));

    if foto <> nil then
    begin
      bmp := TBitmap.Create;
      bmp.LoadFromStream(foto);

      //Essa parte s� faz quando a imagem est� sendo setada em tempo de execu��o
      //Se a imagem estiver est�tica, vindo do disco ou banco, dar� access violation
      //Caso o comando abaixo n�o existisse, a lista no android viria em branco
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
    AddLancamento('0001', 'Compra equipamento', 'Inform�tica', -99, date, foto);

  foto.DisposeOf;
end;

procedure TFrmPrincipal.lv_lancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
var
  txt: TListItemText;
begin
  //determina at� onde o texto da descri��o pode extender antes de cortar a descri��o
    txt := TListItemText(AItem.Objects.FindDrawable('txtDescricao'));
    txt.Width := lv_lancamento.Width - txt.PlaceOffset.X - 80;
end;

end.
