unit UJconzatti.Loja.CasoUso.Pedido.Executador.Acao;

interface

uses
   UJconzatti.Loja.Entidade.Pedido;

type
   TCasoUsoPedidoExecutadorAcao = class abstract
   public
      procedure Executar(aPedido : TEntidadePedido); virtual; abstract;
   end;

implementation

end.
