unit UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Desconto;

type
   TCasoUsoOrcamentoDescontoValor = class(TCasoUsoOrcamentoDesconto)
   protected
      function EfeturarCalculoDesconto(aOrcamento : TEntidadeOrcamento): Currency; override;
      function DeveAplicarDesconto(aOrcamento : TEntidadeOrcamento): Boolean; override;
   end;

implementation

{ TCasoUsoOrcamentoDescontoValor }

function TCasoUsoOrcamentoDescontoValor.EfeturarCalculoDesconto(aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := aOrcamento.Valor * 0.05;
end;

function TCasoUsoOrcamentoDescontoValor.DeveAplicarDesconto(aOrcamento: TEntidadeOrcamento): Boolean;
begin
   Result := aOrcamento.Valor > 500;
end;

end.
