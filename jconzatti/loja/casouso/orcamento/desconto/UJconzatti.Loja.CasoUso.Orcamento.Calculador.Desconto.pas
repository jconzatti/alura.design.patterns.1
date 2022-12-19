unit UJconzatti.Loja.CasoUso.Orcamento.Calculador.Desconto;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Desconto,
   UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade,
   UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor;

type
   TCasoUsoOrcamentoCalculadorDesconto = class
   public
      function Calcular(aOrcamento : TEntidadeOrcamento): Currency;
   end;

implementation

{ TCasoUsoOrcamentoCalculadorDesconto }

function TCasoUsoOrcamentoCalculadorDesconto.Calcular(aOrcamento: TEntidadeOrcamento): Currency;
var aOrcamentoDescontoComMaisDeCincoItem : TCasoUsoOrcamentoDescontoQuantidade;
    aOrcamentoDescontoComValorMaiorQueQuinhetos : TCasoUsoOrcamentoDescontoValor;
begin
   aOrcamentoDescontoComValorMaiorQueQuinhetos := TCasoUsoOrcamentoDescontoValor.Create(nil);
   try
      aOrcamentoDescontoComMaisDeCincoItem := TCasoUsoOrcamentoDescontoQuantidade.Create(aOrcamentoDescontoComValorMaiorQueQuinhetos);
      try
         Result := aOrcamentoDescontoComMaisDeCincoItem.Calcular(aOrcamento);
      finally
         aOrcamentoDescontoComMaisDeCincoItem.Destroy;
      end;
   finally
      aOrcamentoDescontoComValorMaiorQueQuinhetos.Destroy;
   end;
end;

end.
