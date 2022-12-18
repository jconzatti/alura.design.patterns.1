unit UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Imposto;

type
   TCasoUsoOrcamentoImpostoISS = class(TCasoUsoOrcamentoImposto)
   public
      function Calcular(aOrcamento : TEntidadeOrcamento): Currency; override;
   end;

implementation

{ TCasoUsoImpostoOrcamentoISS }

function TCasoUsoOrcamentoImpostoISS.Calcular(aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := aOrcamento.Valor * 0.05;
end;

end.
