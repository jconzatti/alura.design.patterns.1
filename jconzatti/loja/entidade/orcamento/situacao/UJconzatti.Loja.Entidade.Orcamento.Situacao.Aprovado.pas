unit UJconzatti.Loja.Entidade.Orcamento.Situacao.Aprovado;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato,
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Finalizado;

type
   TEntidadeOrcamentoSituacaoAprovado = class(TEntidadeOrcamentoSituacaoAbstrato)
   public
      function CalcularValorDescontoExtra: Currency; override;
      procedure Finalizar; override;
      function ObterDescricao: String; override;
   end;

implementation

{ TEntidadeOrcamentoSituacaoAprovado }

function TEntidadeOrcamentoSituacaoAprovado.CalcularValorDescontoExtra: Currency;
begin
   Result := Orcamento.Valor * 0.02
end;


procedure TEntidadeOrcamentoSituacaoAprovado.Finalizar;
begin
   Orcamento.AtualizarSituacao(TEntidadeOrcamentoSituacaoFinalizado.Create(Orcamento));
end;

function TEntidadeOrcamentoSituacaoAprovado.ObterDescricao: String;
begin
   Result := 'Aprovado'
end;

end.
