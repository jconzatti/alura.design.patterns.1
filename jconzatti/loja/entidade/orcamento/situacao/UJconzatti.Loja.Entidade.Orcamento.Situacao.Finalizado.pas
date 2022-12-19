unit UJconzatti.Loja.Entidade.Orcamento.Situacao.Finalizado;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato;

type
   TEntidadeOrcamentoSituacaoFinalizado = class(TEntidadeOrcamentoSituacaoAbstrato)
   public
      function ObterDescricao: String; override;
   end;

implementation

{ TEntidadeOrcamentoSituacaoFinalizado }

function TEntidadeOrcamentoSituacaoFinalizado.ObterDescricao: String;
begin
   Result := 'Finalizado'
end;

end.
