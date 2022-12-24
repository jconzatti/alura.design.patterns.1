unit UJconzatti.Loja.CasoUso.Pedido.Manipulador.Geracao;

interface

uses
   System.SysUtils,
   System.Generics.Collections,
   UJconzatti.Loja.CasoUso.Pedido.Executador.Acao,
   UJconzatti.Loja.CasoUso.Pedido.Gerador,
   UJconzatti.Loja.Entidade.Pedido,
   UJconzatti.Loja.Entidade.Orcamento;

type
   TCasoUsoPedidoManipuladorGeracao = class
   private
      FListaAcao : TObjectList<TCasoUsoPedidoExecutadorAcao>;
   public
      constructor Create;
      destructor Destroy; override;
      procedure AdicionarAcao(aAcao : TCasoUsoPedidoExecutadorAcao);
      procedure Gerar(aPedidoGerador : TCasoUsoPedidoGerador);
   end;

implementation


{ TCasoUsoPedidoManipuladorGeracao }

procedure TCasoUsoPedidoManipuladorGeracao.AdicionarAcao(
  aAcao: TCasoUsoPedidoExecutadorAcao);
begin
   FListaAcao.Add(aAcao);
end;

constructor TCasoUsoPedidoManipuladorGeracao.Create;
begin
   FListaAcao := TObjectList<TCasoUsoPedidoExecutadorAcao>.Create;
end;

destructor TCasoUsoPedidoManipuladorGeracao.Destroy;
begin
   FListaAcao.Destroy;
   inherited;
end;

procedure TCasoUsoPedidoManipuladorGeracao.Gerar(
  aPedidoGerador: TCasoUsoPedidoGerador);
var aOrcamento : TEntidadeOrcamento;
    aPedido : TEntidadePedido;
  aAcao: TCasoUsoPedidoExecutadorAcao;
begin
   aOrcamento := TEntidadeOrcamento.Create(aPedidoGerador.ValorOrcamento, aPedidoGerador.QuantidadeItemOrcamento);
   try
      aPedido := TEntidadePedido.Create(aPedidoGerador.Cliente, Now, aOrcamento);
      try
         for aAcao in FListaAcao do
            aAcao.Executar(aPedido);
      finally
         aPedido.Destroy;
      end;
   finally
      aOrcamento.Destroy;
   end;
end;

end.
