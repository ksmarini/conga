unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Ani;

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
    lbl_todos_lanc: TLabel;
    lv_lancamento: TListView;
    img_categoria: TImage;
    StyleBook1: TStyleBook;
    rect_menu: TRectangle;
    layout_principal: TLayout;
    AnimationMenu: TFloatAnimation;
    img_fechar_menu: TImage;
    layout_menu_cat: TLayout;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lv_lancamentoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lbl_todos_lancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure img_MenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AnimationMenuFinish(Sender: TObject);
    procedure AnimationMenuProcess(Sender: TObject);
    procedure img_fechar_menuClick(Sender: TObject);
    procedure layout_menu_catClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AddLancamento(ListView: TListView;
      id_lancamento, descricao, categoria: String; valor: Double; dt: TDateTime;
      foto: TStream);
    procedure SetupLancamento(lv: TListView; Item: TListViewItem);
    procedure AddCategoria(ListView: TListView; id_categoria, categoria: String;
      foto: TStream);
    procedure SetupCategoria(lv: TListView; Item: TListViewItem);
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UnitLancamentos, UnitCategorias;

//******************** UNIT FUNÇÕES GLOBAIS *********************

procedure TFrmPrincipal.AddLancamento(ListView: TListView;
  id_lancamento, descricao, categoria: String; valor: Double; dt: TDateTime;
  foto: TStream);
var
  txt: TListItemText;
  img: TListItemImage;
  bmp: TBitmap;
begin
  with ListView.Items.Add do
  begin
    // exemplo de uso com variável
    txt := TListItemText(Objects.FindDrawable('txtDescricao'));
    txt.Text := descricao;

    // outro exemplo, porém com acesso direto, dispensando o usu de variáveis
    TListItemText(Objects.FindDrawable('txtCategoria')).Text := categoria;
    // Sem o formatFloat a atribuição retornaria um erro devido ao tipo double ser incompatível com o tipo string
    TListItemText(Objects.FindDrawable('txtValor')).Text :=
      FormatFloat('#,##0.00', valor);
    TListItemText(Objects.FindDrawable('txtData')).Text :=
      FormatDateTime('dd/mm', dt);

    // Ícone -> também poderia ser feito sem o uso da variável
    img := TListItemImage(Objects.FindDrawable('imgIcone'));

    if foto <> nil then
    begin
      bmp := TBitmap.Create;
      bmp.LoadFromStream(foto);

      // Essa parte só faz quando a imagem está sendo setada em tempo de execução
      // Se a imagem estiver estática, vindo do disco ou banco, dará access violation
      // Caso o comando abaixo não existisse, a lista no android viria em branco
      img.OwnsBitmap := True;

      img.Bitmap := bmp;
    end;
  end;
end;

procedure TFrmPrincipal.AnimationMenuFinish(Sender: TObject);
begin
  layout_principal.Enabled := AnimationMenu.Inverse;
  AnimationMenu.Inverse := not AnimationMenu.Inverse;
end;

procedure TFrmPrincipal.AnimationMenuProcess(Sender: TObject);
begin
  layout_principal.Margins.Right := -260 - rect_menu.Margins.Left;
end;

procedure TFrmPrincipal.AddCategoria(ListView: TListView;
  id_categoria, categoria: String;
  foto: TStream);
var
  txt: TListItemText;
  img: TListItemImage;
  bmp: TBitmap;
begin
  with ListView.Items.Add do
  begin
    //TagString é uma variável interna que pode armazenar qualquer valor string
    //Aqui estará sendo usanda pra armazenar o ID da categoria
    TagString := id_categoria;

    // exemplo de uso com variável
    txt := TListItemText(Objects.FindDrawable('txtCategoria'));
    txt.Text := categoria;

    // Ícone -> também poderia ser feito sem o uso da variável
    img := TListItemImage(Objects.FindDrawable('imgIcone'));

    if foto <> nil then
    begin
      bmp := TBitmap.Create;
      bmp.LoadFromStream(foto);

      // Essa parte só faz quando a imagem está sendo setada em tempo de execução
      // Se a imagem estiver estática, vindo do disco ou banco, dará access violation
      // Caso o comando abaixo não existisse, a lista no android viria em branco
      img.OwnsBitmap := True;

      img.Bitmap := bmp;
    end;
  end;
end;

procedure TFrmPrincipal.SetupLancamento(lv: TListView; Item: TListViewItem);
var
  txt: TListItemText;
  //img: TListItemImage;
begin
  // determina até onde o texto da descrição pode extender antes de cortar a descrição
  txt := TListItemText(Item.Objects.FindDrawable('txtDescricao'));
  txt.Width := lv.Width - txt.PlaceOffset.x - 80;

//  img := TListItemImage(AItem.Objects.FindDrawable('ImgIcone'));
//
//  if lv_lancamento.Width < 200 then
//  begin
//    img.Visible := False;
//    txt.PlaceOffset.X := 2;
//  end;

end;

procedure TFrmPrincipal.SetupCategoria(lv: TListView; Item: TListViewItem);
var
  txt: TListItemText;

begin
  txt := TListItemText(Item.Objects.FindDrawable('txtCategoria'));
  txt.Width := lv.Width - txt.PlaceOffset.x - 80;

end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FrmLancamentos) then
  begin
    FrmLancamentos.DisposeOf;
    FrmLancamentos := nil;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  rect_menu.Margins.Left := -260;
  rect_menu.Align := TAlignLayout.Left;
  rect_menu.Visible := True;
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
    AddLancamento(FrmPrincipal.lv_lancamento, '0001', 'Compra equipamento',
      'Informática', -99, date, foto);

  foto.DisposeOf;
end;

procedure TFrmPrincipal.img_fechar_menuClick(Sender: TObject);
begin
  AnimationMenu.Start;
end;

procedure TFrmPrincipal.img_MenuClick(Sender: TObject);
begin
  AnimationMenu.Start;
end;

procedure TFrmPrincipal.layout_menu_catClick(Sender: TObject);
begin
  AnimationMenu.Start;

  if not Assigned(FrmCategorias) then
    Application.CreateForm(TFrmCategorias, FrmCategorias);

  FrmCategorias.Show;
end;

procedure TFrmPrincipal.lbl_todos_lancClick(Sender: TObject);
begin
  if not Assigned(FrmLancamentos) then
    Application.CreateForm(TFrmLancamentos, FrmLancamentos);

  FrmLancamentos.Show;
end;

procedure TFrmPrincipal.lv_lancamentoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  SetupLancamento(FrmPrincipal.lv_lancamento, AItem);
end;

end.
