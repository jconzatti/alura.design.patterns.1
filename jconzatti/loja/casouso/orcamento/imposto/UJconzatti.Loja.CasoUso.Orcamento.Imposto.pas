unit UJconzatti.Loja.CasoUso.Orcamento.Imposto;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento;

type
   TCasoUsoOrcamentoImposto = class abstract
   public
      function Calcular(aOrcamento : TEntidadeOrcamento): Currency; virtual; abstract;
   end;

implementation

end.
