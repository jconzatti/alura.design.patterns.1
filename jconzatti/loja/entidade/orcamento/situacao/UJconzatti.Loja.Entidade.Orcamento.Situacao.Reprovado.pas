unit UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato,
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Finalizado;

type
   TEntidadeOrcamentoSituacaoReprovado = class(TEntidadeOrcamentoSituacaoAbstrato)
   public
      procedure Finalizar; override;
      function ObterDescricao: String; override;
   end;

implementation

{ TEntidadeOrcamentoSituacaoReprovado }


procedure TEntidadeOrcamentoSituacaoReprovado.Finalizar;
begin
   Orcamento.AtualizarSituacao(TEntidadeOrcamentoSituacaoFinalizado.Create(Orcamento));
end;

function TEntidadeOrcamentoSituacaoReprovado.ObterDescricao: String;
begin
   Result := 'Reprovado'
end;

end.
