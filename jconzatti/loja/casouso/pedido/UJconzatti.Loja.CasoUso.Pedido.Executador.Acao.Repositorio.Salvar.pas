unit UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Repositorio.Salvar;

interface

uses
   UJconzatti.Loja.CasoUso.Pedido.Executador.Acao,
   UJconzatti.Loja.Repositorio.Pedido,
   UJconzatti.Loja.Entidade.Pedido;

type
   TCasoUsoPedidoExecutadorAcaoRepositorioSalvar = class(TCasoUsoPedidoExecutadorAcao)
   private
      FRepositorioPedido : TRepositorioPedido;
   public
      constructor Create(aRepositorioPedido : TRepositorioPedido); reintroduce;
      procedure Executar(aPedido : TEntidadePedido); override;
   end;
implementation

{ TCasoUsoPedidoExecutadorAcaoRepositorioSalvar }

constructor TCasoUsoPedidoExecutadorAcaoRepositorioSalvar.Create(
  aRepositorioPedido: TRepositorioPedido);
begin
   FRepositorioPedido := aRepositorioPedido;
end;

procedure TCasoUsoPedidoExecutadorAcaoRepositorioSalvar.Executar(aPedido : TEntidadePedido);
begin
   inherited;
   FRepositorioPedido.Salvar(aPedido);
end;

end.
