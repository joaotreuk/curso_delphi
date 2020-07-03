unit uCadCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Categoria, uDTMConexao,
  uEnum;

type
  TfrmCadCategorias = class(TfrmTelaHeranca)
    qryListagemID: TIntegerField;
    qryListagemDescricao: TWideStringField;
    edtID: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
  private
    oCategoria: TCategoria;
    function Excluir: Boolean; override;
    function Salvar(EstadoDoCadastro:TEstadoDoCadastro): Boolean; override;
  end;

var
  frmCadCategorias: TfrmCadCategorias;

implementation

{$R *.dfm}

function TfrmCadCategorias.Excluir: Boolean;
begin
  if oCategoria.Selecionar(qryListagem.FieldByName('ID').AsInteger) then
    Result := oCategoria.Excluir()
  else
    Result := False;
end;

function TfrmCadCategorias.Salvar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtID.Text <> EmptyStr then
    oCategoria.id := StrToInt(edtID.Text)
  else
    oCategoria.id := 0;

  oCategoria.descricao := edtDescricao.Text;

  if EstadoDoCadastro = ecInserir then
    Result := oCategoria.Inserir
  else
    Result := oCategoria.Atualizar;
end;

{$Region 'Eventos'}

procedure TfrmCadCategorias.btnAlterarClick(Sender: TObject);
var IDSelecionado: Integer;
begin
  IDSelecionado := qryListagem.FieldByName('ID').AsInteger;

  if oCategoria.Selecionar(IDSelecionado) then
  begin
    edtID.Text := IntToStr(IDSelecionado);
    edtDescricao.Text := oCategoria.descricao;
  end
  else
    Abort;

  inherited;
end;

procedure TfrmCadCategorias.FormClose(Sender: TObject;
Var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then
    FreeAndNil(oCategoria);
end;

procedure TfrmCadCategorias.FormCreate(Sender: TObject);
begin
  inherited;
  oCategoria := TCategoria.Create(dtmConexao.zcConexao);
  IndiceAtual := 'Descricao';
end;

{$EndRegion}

end.
