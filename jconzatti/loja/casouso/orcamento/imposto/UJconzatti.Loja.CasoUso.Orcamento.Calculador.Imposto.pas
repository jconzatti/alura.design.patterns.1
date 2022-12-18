unit UJconzatti.Loja.CasoUso.Orcamento.Calculador.Imposto;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.CasoUso.Orcamento.Imposto;

type
   TCasoUsoOrcamentoCalculadorImposto = class
   public
      function Calcular(aOrcamento : TEntidadeOrcamento; aImposto : TCasoUsoOrcamentoImposto): Currency;
   end;

implementation

{ TCasoUsoOrcamentoCalculadorImposto }

function TCasoUsoOrcamentoCalculadorImposto.Calcular(
  aOrcamento: TEntidadeOrcamento;
  aImposto: TCasoUsoOrcamentoImposto): Currency;
begin
   Result := aImposto.Calcular(aOrcamento);
end;

end.
