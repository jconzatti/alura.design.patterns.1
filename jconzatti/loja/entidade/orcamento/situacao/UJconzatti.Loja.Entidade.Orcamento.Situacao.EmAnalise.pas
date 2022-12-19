unit UJconzatti.Loja.Entidade.Orcamento.Situacao.EmAnalise;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato,
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Aprovado,
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado;

type
   TEntidadeOrcamentoSituacaoEmAnalise = class(TEntidadeOrcamentoSituacaoAbstrato)
   public
      function CalcularValorDescontoExtra: Currency; override;
      procedure Aprovar; override;
      procedure Reprovar; override;
      function ObterDescricao: String; override;
   end;

implementation

{ TEntidadeOrcamentoSituacaoEmAnalise }

function TEntidadeOrcamentoSituacaoEmAnalise.CalcularValorDescontoExtra: Currency;
begin
   Result := Orcamento.Valor * 0.05
end;

procedure TEntidadeOrcamentoSituacaoEmAnalise.Aprovar;
begin
   Orcamento.AtualizarSituacao(TEntidadeOrcamentoSituacaoAprovado.Create(Orcamento));
end;

procedure TEntidadeOrcamentoSituacaoEmAnalise.Reprovar;
begin
   Orcamento.AtualizarSituacao(TEntidadeOrcamentoSituacaoReprovado.Create(Orcamento));
end;

function TEntidadeOrcamentoSituacaoEmAnalise.ObterDescricao: String;
begin
   Result := 'Em análise'
end;

end.
