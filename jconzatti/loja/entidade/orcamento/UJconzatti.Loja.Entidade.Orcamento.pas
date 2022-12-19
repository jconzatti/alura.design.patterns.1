unit UJconzatti.Loja.Entidade.Orcamento;

interface

uses
   System.SysUtils,
   UJconzatti.Loja.Entidade.Orcamento.Situacao;

type
   TEntidadeOrcamento = class
   private
      FValor: Currency;
      FQuantidadeItem: Cardinal;
      FSituacao : TEntidadeOrcamentoSituacao;
      procedure DestruirSituacaoSeNecessario;
   public
      constructor Create(aValor : Double; aQuantidadeItem : Cardinal);
      destructor Destroy; override;
      function ObterInformacao: String;
      procedure AplicarDescontoExtra;
      procedure AtualizarSituacao(aSitucao : TEntidadeOrcamentoSituacao);
      procedure Aprovar;
      procedure Reprovar;
      procedure Finalizar;
      property Valor: Currency read FValor;
      property QuantidadeItem: Cardinal read FQuantidadeItem;
   end;

implementation

uses
   UJconzatti.Loja.Entidade.Orcamento.Situacao.EmAnalise;

{ TEntidadeOrcamento }

constructor TEntidadeOrcamento.Create(aValor : Double; aQuantidadeItem : Cardinal);
begin
   FValor := aValor;
   FQuantidadeItem := aQuantidadeItem;
   FSituacao := TEntidadeOrcamentoSituacaoEmAnalise.Create(Self);
end;

destructor TEntidadeOrcamento.Destroy;
begin
   DestruirSituacaoSeNecessario;
   inherited;
end;

function TEntidadeOrcamento.ObterInformacao: String;
begin
   Result := Format('%d itens com valor total de R$ %s [%s]', [FQuantidadeItem, FormatFloat('###,###,###,##0.00', FValor), FSituacao.ObterDescricao])
end;

procedure TEntidadeOrcamento.AplicarDescontoExtra;
var VlDescontoExtra : Currency;
begin
   VlDescontoExtra := FSituacao.CalcularValorDescontoExtra;
   FValor := FValor - VlDescontoExtra;
end;

procedure TEntidadeOrcamento.Aprovar;
begin
   FSituacao.Aprovar;
end;

procedure TEntidadeOrcamento.Reprovar;
begin
   FSituacao.Reprovar;
end;

procedure TEntidadeOrcamento.Finalizar;
begin
   FSituacao.Finalizar;
end;

procedure TEntidadeOrcamento.AtualizarSituacao(aSitucao : TEntidadeOrcamentoSituacao);
begin
   DestruirSituacaoSeNecessario;
   FSituacao := aSitucao;
end;

procedure TEntidadeOrcamento.DestruirSituacaoSeNecessario;
begin
   if Assigned(FSituacao) then
      FSituacao.Destroy;
end;

end.
