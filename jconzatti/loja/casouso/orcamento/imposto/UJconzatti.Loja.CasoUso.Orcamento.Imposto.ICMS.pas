unit UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Imposto;

type
   TCasoUsoOrcamentoImpostoICMS = class(TCasoUsoOrcamentoImposto)
   public
      function Calcular(aOrcamento : TEntidadeOrcamento): Currency; override;
   end;

implementation

{ TCasoUsoImpostoOrcamentoICMS }

function TCasoUsoOrcamentoImpostoICMS.Calcular(aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := aOrcamento.Valor * 0.17;
end;

end.
