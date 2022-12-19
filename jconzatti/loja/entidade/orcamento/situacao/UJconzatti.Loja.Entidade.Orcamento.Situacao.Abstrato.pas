unit UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato;

interface

uses
   UJconzatti.Loja.Entidade.Orcamento,
   UJconzatti.Loja.Entidade.Orcamento.Situacao;


type
   TEntidadeOrcamentoSituacaoAbstrato = class abstract(TEntidadeOrcamentoSituacao)
   private
      FOrcamento : TEntidadeOrcamento;
   protected
      property Orcamento : TEntidadeOrcamento read FOrcamento;
   public
      constructor Create(aOrcamento : TEntidadeOrcamento); reintroduce;
   end;

implementation

{ TEntidadeOrcamentoSituacao }

constructor TEntidadeOrcamentoSituacaoAbstrato.Create(aOrcamento: TEntidadeOrcamento);
begin
   FOrcamento := aOrcamento;
end;

end.
