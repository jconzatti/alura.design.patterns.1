unit UJconzatti.Loja.CasoUso.Email.Enviador;

interface

uses
   System.SysUtils;

type
   TCasoUsoEmailEnviador = class
   private
      FDestinatario : String;
      FMensagem : String;
   public
      procedure Enviar;
      property Destinatario: String read FDestinatario write FDestinatario;
      property Mensagem: String read FMensagem write FMensagem;
   end;

implementation

{ TCasoUsoEmailEnviador }

procedure TCasoUsoEmailEnviador.Enviar;
begin
   Writeln('ENVIO DE EMAIL!');
   Writeln(Format('Para: %s', [FDestinatario]));
   Writeln(Format('Mensagem: %s', [FMensagem]));
   Writeln;
end;

end.
