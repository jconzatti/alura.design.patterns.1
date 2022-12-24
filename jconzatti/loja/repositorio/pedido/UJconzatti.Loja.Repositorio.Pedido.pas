unit UJconzatti.Loja.Repositorio.Pedido;

interface

uses
   System.SysUtils,
   UJconzatti.Loja.Entidade.Pedido;

type
   TRepositorioPedido = class
   public
      procedure Salvar(aPedido : TEntidadePedido);
   end;

implementation

{ TRepositorioPedido }

procedure TRepositorioPedido.Salvar(aPedido: TEntidadePedido);
begin
   Writeln(Format('Pedido %s SALVO no banco de dados!', [aPedido.ObterInformacao]));
   Writeln;
end;

end.
