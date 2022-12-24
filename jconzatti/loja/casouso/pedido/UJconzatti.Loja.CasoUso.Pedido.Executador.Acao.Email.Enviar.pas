unit UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Email.Enviar;

interface

uses
   System.SysUtils,
   UJconzatti.Loja.CasoUso.Pedido.Executador.Acao,
   UJconzatti.Loja.CasoUso.Email.Enviador,
   UJconzatti.Loja.Entidade.Pedido;

type
   TCasoUsoPedidoExecutadorAcaoEmailEnviar = class(TCasoUsoPedidoExecutadorAcao)
   private
      FEnviadorEmail : TCasoUsoEmailEnviador;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Executar(aPedido : TEntidadePedido); override;
   end;

implementation

{ TCasoUsoPedidoExecutadorAcaoEmailEnviar }

constructor TCasoUsoPedidoExecutadorAcaoEmailEnviar.Create;
begin
   FEnviadorEmail := TCasoUsoEmailEnviador.Create;
end;

destructor TCasoUsoPedidoExecutadorAcaoEmailEnviar.Destroy;
begin
   FEnviadorEmail.Destroy;
   inherited;
end;

procedure TCasoUsoPedidoExecutadorAcaoEmailEnviar.Executar(
  aPedido: TEntidadePedido);
begin
   inherited;
   FEnviadorEmail.Destinatario := aPedido.Cliente;
   FEnviadorEmail.Mensagem     := Format('Olá %s! Está tudo certo com seu novo pedido %s', [aPedido.Cliente, aPedido.ObterInformacao]);
   FEnviadorEmail.Enviar;
end;

end.
