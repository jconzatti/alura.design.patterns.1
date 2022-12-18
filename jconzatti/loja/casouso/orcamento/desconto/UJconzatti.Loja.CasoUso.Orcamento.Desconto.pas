unit UJconzatti.Loja.CasoUso.Orcamento.Desconto;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento;

type
   TCasoUsoOrcamentoDesconto = class abstract
   private
      FProximoDesconto: TCasoUsoOrcamentoDesconto;
   protected
      function EfeturarCalculoDesconto(aOrcamento : TEntidadeOrcamento): Currency; virtual; abstract;
      function DeveAplicarDesconto(aOrcamento : TEntidadeOrcamento): Boolean; virtual; abstract;
      property ProximoDesconto: TCasoUsoOrcamentoDesconto read FProximoDesconto;
   public
      constructor Create(aProximoDesconto: TCasoUsoOrcamentoDesconto);
      function Calcular(aOrcamento : TEntidadeOrcamento): Currency;
   end;

implementation

{ TCasoUsoOrcamentoDesconto }

function TCasoUsoOrcamentoDesconto.Calcular(aOrcamento: TEntidadeOrcamento): Currency;
begin
   Result := 0;
   if DeveAplicarDesconto(aOrcamento) then
      Result := EfeturarCalculoDesconto(aOrcamento);

   if Result = 0 then
      if Assigned(ProximoDesconto) then
         Result := ProximoDesconto.Calcular(aOrcamento);
end;

constructor TCasoUsoOrcamentoDesconto.Create(aProximoDesconto: TCasoUsoOrcamentoDesconto);
begin
   FProximoDesconto := aProximoDesconto;
end;

end.
