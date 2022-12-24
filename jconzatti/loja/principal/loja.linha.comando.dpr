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
  UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado in '..\entidade\orcamento\situacao\UJconzatti.Loja.Entidade.Orcamento.Situacao.Reprovado.pas',
  UJconzatti.Loja.Entidade.Pedido in '..\entidade\pedido\UJconzatti.Loja.Entidade.Pedido.pas',
  UJconzatti.Loja.CasoUso.Pedido.Gerador in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Gerador.pas',
  UJconzatti.Loja.Repositorio.Pedido in '..\repositorio\pedido\UJconzatti.Loja.Repositorio.Pedido.pas',
  UJconzatti.Loja.CasoUso.Email.Enviador in '..\casouso\email\UJconzatti.Loja.CasoUso.Email.Enviador.pas',
  UJconzatti.Loja.CasoUso.Pedido.Manipulador.Geracao in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Manipulador.Geracao.pas',
  UJconzatti.Loja.CasoUso.Pedido.Executador.Acao in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.pas',
  UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Repositorio.Salvar in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Repositorio.Salvar.pas',
  UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Email.Enviar in '..\casouso\pedido\UJconzatti.Loja.CasoUso.Pedido.Executador.Acao.Email.Enviar.pas';

var aOrcamento : TEntidadeOrcamento;
    aGeradorPedido : TCasoUsoPedidoGerador;
    aRepositorioPedido : TRepositorioPedido;
    aManipuladorGeracaoPedido : TCasoUsoPedidoManipuladorGeracao;
    aOrcamentoImposto : TCasoUsoOrcamentoImposto;
    aOrcamentoCalculadorImposto : TCasoUsoOrcamentoCalculadorImposto;
    aOrcamentoCalculadorDesconto : TCasoUsoOrcamentoCalculadorDesconto;
    aValor : Currency;
    aMensagem : String;
    aCliente : String;
    aQtItem : Cardinal;
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
      //Neste projeto, o Template Method foi usado para implementar na classe mãe de situações de orçamento
      //algorítmos repetidos das classes filhas

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

      //Design Patterns Command Handler.
      //Neste projeto, o Command Handler foi usado para isolar a logica de
      //geração de pedidos atraves de um manipulador (handler) da geração de Pedidos
      Writeln;
      Writeln('Pedidos');
      Write('Nome do Cliente: ');
      Readln(aCliente);
      Write('Valor do Orçamento: ');
      Readln(aValor);
      Write('Quantidade de Itens do Orçamento: ');
      Readln(aQtItem);
      Writeln;
      aManipuladorGeracaoPedido := TCasoUsoPedidoManipuladorGeracao.Create;
      try
         aRepositorioPedido := TRepositorioPedido.Create;
         try
            aManipuladorGeracaoPedido.AdicionarAcao(TCasoUsoPedidoExecutadorAcaoRepositorioSalvar.Create(aRepositorioPedido));
            aManipuladorGeracaoPedido.AdicionarAcao(TCasoUsoPedidoExecutadorAcaoEmailEnviar.Create);
            aGeradorPedido := TCasoUsoPedidoGerador.Create(aCliente, aValor, aQtItem);
            try
               aManipuladorGeracaoPedido.Gerar(aGeradorPedido);
            finally
               aGeradorPedido.Destroy;
            end;
         finally
            aRepositorioPedido.Destroy;
         end;
      finally
         aManipuladorGeracaoPedido.Destroy;
      end;
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;

   Readln;
end.
