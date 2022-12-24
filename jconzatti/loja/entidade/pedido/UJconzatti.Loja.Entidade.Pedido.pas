unit UJconzatti.Loja.Entidade.Pedido;

interface

uses
   System.SysUtils,
   UJconzatti.Loja.Entidade.Orcamento;

type
   TEntidadePedido = class
   private
      FCliente: String;
      FData: TDateTime;
      FOrcamento: TEntidadeOrcamento;
   public
      constructor Create(aCliente : String; aData : TDateTime; aOrcamento : TEntidadeOrcamento); reintroduce;
      function ObterInformacao: String;
      property Cliente: String read FCliente;
      property Data: TDateTime read FData;
      property Orcamento: TEntidadeOrcamento read FOrcamento;
   end;

implementation

{ TEntidadePedido }

constructor TEntidadePedido.Create(aCliente: String; aData: TDateTime; aOrcamento: TEntidadeOrcamento);
begin
   FCliente   := aCliente;
   FData      := aData;
   FOrcamento := aOrcamento;
end;

function TEntidadePedido.ObterInformacao: String;
begin
   Result := Format('Cliente: %s, Data: %s, Orçamento: %s',
                    [FCliente,
                     FormatDateTime('dd/mm/yyyy hh:nn:ss', FData),
                     FOrcamento.ObterInformacao]);
end;

end.
