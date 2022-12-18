unit UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Desconto;

type
   TCasoUsoOrcamentoDescontoQuantidade = class(TCasoUsoOrcamentoDesconto)
   protected
      function EfeturarCalculoDesconto(aOrcamento : TEntidadeOrcamento): Currency; override;
      function DeveAplicarDesconto(aOrcamento : TEntidadeOrcamento): Boolean; override;
   end;

implementation

{ TCasoUsoOrcamentoDescontoQuantidade }

function TCasoUsoOrcamentoDescontoQuantidade.EfeturarCalculoDesconto(aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := aOrcamento.Valor * 0.1;
end;

function TCasoUsoOrcamentoDescontoQuantidade.DeveAplicarDesconto(aOrcamento: TEntidadeOrcamento): Boolean;
begin
   Result := aOrcamento.QuantidadeItem > 5;
end;

end.
