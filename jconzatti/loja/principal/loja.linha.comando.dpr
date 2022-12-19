program loja.linha.comando;

{.$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UJconzatti.Loja.CasoUso.Orcamento.Calculador.Imposto in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Calculador.Imposto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Calculador.Desconto in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Calculador.Desconto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.pas',
  UJconzatti.Loja.Entidade.Orcamento in '..\entidade\orcamento\UJconzatti.Loja.Entidade.Orcamento.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Abstrato.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Aprovado in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Aprovado.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.EmAnalise in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.EmAnalise.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Finalizado in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Finalizado.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.pas',
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado.pas';

var aOrcamento : TEntidadeOrcamento;
    aOrcamentoImposto : TCasoUsoOrcamentoImposto;
    aOrcamentoCalculadorImposto : TCasoUsoOrcamentoCalculadorImposto;
    aOrcamentoCalculadorDesconto : TCasoUsoOrcamentoCalculadorDesconto;
    aValor : Currency;
    aMensagem : String;
begin
   try
      //Design Pattern Strategy: Este padrão pode ser utilizado quando há diversos possíveis algoritmos para uma ação
      //(como calcular imposto, por exemplo). Nele, nós separamos cada um dos possíveis algoritmos em classes separadas.
      //Neste projeto, o Strategy foi usado para separar em classes individuais as regras de negocio de calculo de imposto ICMS e ISS
      Writeln('Calculadora de Impostos do Orçamento');
      aOrcamentoCalculadorImposto := TCasoUsoOrcamentoCalculadorImposto.Create;
      try
         aOrcamento := TEntidadeOrcamento.Create(1000, 5);
         try
            Writeln('Orçamento: ' + aOrcamento.ObterInformacao);
            aOrcamentoImposto := TCasoUsoOrcamentoImpostoICMS.Create;
            try
               aValor    := aOrcamentoCalculadorImposto.Calcular(aOrcamento, aOrcamentoImposto);
               aMensagem := Format('ICMS: R$ %s', [FormatFloat('###,##0.00', aValor)]);
               Writeln(aMensagem);
            finally
               aOrcamentoImposto.Destroy;
            end;

            aOrcamentoImposto := TCasoUsoOrcamentoImpostoISS.Create;
            try
               aValor    := aOrcamentoCalculadorImposto.Calcular(aOrcamento, aOrcamentoImposto);
               aMensagem := Format('ISS: R$ %s', [FormatFloat('###,##0.00', aValor)]);
               Writeln(aMensagem);
            finally
               aOrcamentoImposto.Destroy;
            end;
         finally
            aOrcamento.Destroy;
         end;
      finally
         aOrcamentoCalculadorImposto.Destroy;
      end;

      //Design Patterns Chain of Responsibility: para criar uma cadeia de algorítmos.
      //Neste projeto, o Chain of Responsibility foi usado para implementar uma cadeia
      //de descontos na classe TCasoUsoOrcamentoCalculadorDesconto

      //Design Patterns Template Method: favorece o reaproveitamento de códigos comuns
      //entre classes, evitando assim duplicações de códigos.
      //Neste projeto, o Template Method foi usado para implementar na classe mãe
      //algorítmos repetidos nas classes filhas

      //Design Patterns State: se o resultado de uma chamada de método depende do estado,
      //podemos delegar esta ação para uma classe específica do estado atual.
      //Neste projeto, o State foi usado para implementar as mudanças de situação do
      //orçamento definindo uma aplicação de desconto extra diferente dependendo da situação atual
      Writeln;
      Writeln('Calculadora de Descontos do Orçamento');
      aOrcamentoCalculadorDesconto := TCasoUsoOrcamentoCalculadorDesconto.Create;
      try
         aOrcamento := TEntidadeOrcamento.Create(100, 8);
         try
            aOrcamento.Reprovar;
            aOrcamento.Finalizar;
            aOrcamento.AplicarDescontoExtra;
            Writeln('Orçamento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;

         aOrcamento := TEntidadeOrcamento.Create(600, 2);
         try
            aOrcamento.Aprovar;
            aOrcamento.AplicarDescontoExtra;
            Writeln('Orçamento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;

         aOrcamento := TEntidadeOrcamento.Create(600, 8);
         try
            aOrcamento.Reprovar;
            aOrcamento.AplicarDescontoExtra;
            Writeln('Orçamento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;

         aOrcamento := TEntidadeOrcamento.Create(100, 2);
         try
            aOrcamento.AplicarDescontoExtra;
            Writeln('Orçamento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;
      finally
         aOrcamentoCalculadorDesconto.Destroy;
      end;
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;

   Readln;
end.
