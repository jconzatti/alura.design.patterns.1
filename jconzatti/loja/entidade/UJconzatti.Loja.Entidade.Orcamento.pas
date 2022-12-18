unit UJconzatti.Loja.Entidade.Orcamento;

interface

uses
   System.SysUtils;

type
   TEntidadeOrcamento = class
   private
      FValor: Currency;
      FQuantidadeItem: Cardinal;
   public
      constructor Create(aValor : Double; aQuantidadeItem : Cardinal);
      function ObterInformacao: String;
      property Valor: Currency read FValor;
      property QuantidadeItem: Cardinal read FQuantidadeItem;
   end;

implementation

{ TEntidadeOrcamento }

constructor TEntidadeOrcamento.Create(aValor : Double; aQuantidadeItem : Cardinal);
begin
   FValor := aValor;
   FQuantidadeItem := aQuantidadeItem;
end;

function TEntidadeOrcamento.ObterInformacao: String;
begin
   Result := Format('%d itens com valor total de R$ %s', [FQuantidadeItem, FormatFloat('###,###,###,##0.00', FValor)])
end;

end.
