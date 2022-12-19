unit UJconzatti.Loja.Entidade.Orcamento.Situacao;

interface

uses
   System.SysUtils;

type
   TEntidadeOrcamentoSituacao = class abstract
   public
      function CalcularValorDescontoExtra: Currency; virtual;
      procedure Aprovar; virtual;
      procedure Reprovar; virtual;
      procedure Finalizar; virtual;
      function ObterDescricao: String; virtual; abstract;
   end;

implementation

{ TEntidadeOrcamentoSituacao }

function TEntidadeOrcamentoSituacao.CalcularValorDescontoExtra: Currency;
begin
   Result := 0;
end;

procedure TEntidadeOrcamentoSituacao.Aprovar;
begin
   raise Exception.Create('Orçamento não pode ser aprovado!');
end;

procedure TEntidadeOrcamentoSituacao.Reprovar;
begin
   raise Exception.Create('Orçamento não pode ser reprovado!');
end;

procedure TEntidadeOrcamentoSituacao.Finalizar;
begin
   raise Exception.Create('Orçamento não pode ser finalizado!');
end;

end.
