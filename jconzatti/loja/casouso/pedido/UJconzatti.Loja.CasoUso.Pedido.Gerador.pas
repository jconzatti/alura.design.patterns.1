unit UJconzatti.Loja.CasoUso.Pedido.Gerador;

interface

type
   TCasoUsoPedidoGerador = class
   private
      FCliente: String;
      FValorOrcamento: Currency;
      FQuantidadeItemOrcamento: Cardinal;
   public
      constructor Create(aCliente: String;
                         aValorOrcamento: Currency;
                         aQuantidadeItemOrcamento: Cardinal); reintroduce;
      property Cliente: String read FCliente;
      property ValorOrcamento: Currency read FValorOrcamento;
      property QuantidadeItemOrcamento: Cardinal read FQuantidadeItemOrcamento;
   end;

implementation

{ TCasoUsoPedidoGerador }

constructor TCasoUsoPedidoGerador.Create(aCliente: String;
                                         aValorOrcamento: Currency;
                                         aQuantidadeItemOrcamento: Cardinal);
begin
   FCliente                 := aCliente;
   FValorOrcamento          := aValorOrcamento;
   FQuantidadeItemOrcamento := aQuantidadeItemOrcamento;
end;

end.
