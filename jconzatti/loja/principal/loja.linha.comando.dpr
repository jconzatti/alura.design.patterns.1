program loja.linha.comando;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UJconzatti.Loja.Entidade.Orcamento in '..\entidade\UJconzatti.Loja.Entidade.Orcamento.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Calculador.Imposto in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Calculador.Imposto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.ICMS.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.ISS.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Imposto in '..\casouso\orcamento\imposto\UJconzatti.Loja.CasoUso.Orcamento.Imposto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Calculador.Desconto in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Calculador.Desconto.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.Quantidade.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.Valor.pas',
  UJconzatti.Loja.CasoUso.Orcamento.Desconto in '..\casouso\orcamento\desconto\UJconzatti.Loja.CasoUso.Orcamento.Desconto.pas';

var aOrcamento : TEntidadeOrcamento;
    aOrcamentoImposto : TCasoUsoOrcamentoImposto;
    aOrcamentoCalculadorImposto : TCasoUsoOrcamentoCalculadorImposto;
    aOrcamentoCalculadorDesconto : TCasoUsoOrcamentoCalculadorDesconto;
    aValor : Currency;
    aMensagem : String;
begin
   try
      //Design Pattern Strategy: Este padr�o pode ser utilizado quando h� diversos poss�veis algoritmos para uma a��o
      //(como calcular imposto, por exemplo). Nele, n�s separamos cada um dos poss�veis algoritmos em classes separadas.
      //Neste projeto, o Strategy foi usado para separar em classes individuais as regras de negocio de calculo de imposto ICMS e ISS
      Writeln('Calculadora de Impostos do Or�amento');
      aOrcamentoCalculadorImposto := TCasoUsoOrcamentoCalculadorImposto.Create;
      try
         aOrcamento := TEntidadeOrcamento.Create(1000, 5);
         try
            Writeln('Or�amento: ' + aOrcamento.ObterInformacao);
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

      //Design Pattern Chain of Responsibility: para criar uma cadeia de algor�tmos.
      //Neste projeto, o Chain of Responsibility foi usado para implementar uma cadeia
      //de descontos na classe TCasoUsoOrcamentoCalculadorDesconto
      Writeln;
      Writeln('Calculadora de Descontos do Or�amento');
      aOrcamentoCalculadorDesconto := TCasoUsoOrcamentoCalculadorDesconto.Create;
      try
         aOrcamento := TEntidadeOrcamento.Create(100, 8);
         try
            Writeln('Or�amento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;

         aOrcamento := TEntidadeOrcamento.Create(600, 2);
         try
            Writeln('Or�amento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;

         aOrcamento := TEntidadeOrcamento.Create(600, 8);
         try
            Writeln('Or�amento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;

         aOrcamento := TEntidadeOrcamento.Create(100, 2);
         try
            Writeln('Or�amento: ' + aOrcamento.ObterInformacao);
            aValor    := aOrcamentoCalculadorDesconto.Calcular(aOrcamento);
            aMensagem := Format('Desconto: R$ %s', [FormatFloat('###,##0.00', aValor)]);
            Writeln(aMensagem);
         finally
            aOrcamento.Destroy;
         end;
      finally
         aOrcamentoCalculadorDesconto.Destroy;
      end;

      Readln(aMensagem);
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;
end.
