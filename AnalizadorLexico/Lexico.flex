import java_cup.runtime.Symbol;


%%


/*%cupsym Simbolo*/
%cup
%public
%class Lexico
%line
%column
%char

%{
	final int MAX_STRING = 30;
	final int MAX_INT = Short.MAX_VALUE;
	final float MAX_FLOAT = Float.MAX_VALUE;

	private boolean verify_real(String x) {
		float f = Float.parseFloat(x);
		if (f < -MAX_FLOAT || f > MAX_FLOAT) {
			throw new NumberFormatException();
		}
		return true;
	}

	private boolean verify_int(String x) {
		int i = Integer.parseInt(x);
		if (i > -MAX_INT || i > MAX_INT) {
			throw new NumberFormatException();
		}
		return true;
	}

	private boolean verify_string(String x) {
		if (x.length() > MAX_STRING) {
			throw new NumberFormatException();
		}
		return true;
	}
%}

While = "while" | "WHILE"
If = "if" | "IF"
Print = "print" | "PRINT"
DeclareB = "declare" | "DECLARE"
DeclareE = "enddeclare" | "ENDDECLARE"
ProgramB = "BEGIN.PROGRAM" | "begin.program"
ProgramE = "END.PROGRAM" | "end.program"
InList = "inlist" | "INLIST"
VarId = {Nombre}
Comentario = "</" ~"/>"

And = "&&"
Or = "||"
Mayor = ">"
MayorI = ">="
Menor = "<"
MenorI = "<="
Distinto = "<>"
Igual = "=="
Suma = "+"
Resta = "-"
Multiplicacion = "*"
Division = "/"

Asignacion = ":="
Letra = [a-zA-Z]
Digito = [0-9]
Numero = {Digito}+ | (- {Digito}+)
Real = ({Numero}+ "." {Digito}*) | ({Numero}* "." {Digito}+)
Blanco = \t|\f|\n|\r|\r\n|" "
CaracterEspecial = "!"|"#"|"$"|"%"|"&"|"'"|"("|")"|"*"|"+"|","|"-"|"."|"/"|":"|";"|"{"|"="|"}"|"?"|"@"|"["|"]"|"^"|"_"|"`"|"{"|"|"|"}"|"~"|"\""
String = ({Letra} | {Blanco} | {Digito} | {CaracterEspecial})+
Nombre = ({Digito} | {Letra} | "_")+
ParA = "("
ParC = ")"
LlaveA = "{"
LlaveC = "}"
CorcheteA = "["
CorcheteC = "]"


%%

<YYINITIAL> {

{Comentario}			{/**/}

"WHILE" 				{System.out.println("Token While encontrado, Lexema "+ yytext());}
"IF" 					{System.out.println("Token If encontrado, Lexema "+ yytext());}
"PRINT"					{System.out.println("Token Print encontrado, Lexema "+ yytext());}
"DECLARE"				{System.out.println("Token DeclareB encontrado, Lexema "+ yytext());}
"ENDDECLARE"			{System.out.println("Token DeclareE encontrado, Lexema "+ yytext());}
"BEGIN.PROGRAM"			{System.out.println("Token ProgramB encontrado, Lexema "+ yytext());}
"END.PROGRAM"			{System.out.println("Token ProgramE encontrado, Lexema "+ yytext());}
"INLIST"				{System.out.println("Token InList encontrado, Lexema "+ yytext());}
{VarId}					{System.out.println("Token VarId encontrado, Lexema "+ yytext());}

{ParA}					{System.out.println("Token ParA encontrado, Lexema "+ yytext());}
{ParC}					{System.out.println("Token ParC encontrado, Lexema "+ yytext());}
{LlaveA}				{System.out.println("Token LlaveA encontrado, Lexema "+ yytext());}
{LlaveC}				{System.out.println("Token LlaveC encontrado, Lexema "+ yytext());}
{CorcheteA}				{System.out.println("Token CorcheteA encontrado, Lexema "+ yytext());}
{CorcheteC}				{System.out.println("Token CorcheteC encontrado, Lexema "+ yytext());}

{And}					{System.out.println("Token And encontrado, Lexema "+ yytext());}
{Or}					{System.out.println("Token Or encontrado, Lexema "+ yytext());}
{Mayor}					{System.out.println("Token Mayor encontrado, Lexema "+ yytext());}
{MayorI}				{System.out.println("Token MayorI encontrado, Lexema "+ yytext());}
{Menor}					{System.out.println("Token Menor encontrado, Lexema "+ yytext());}
{MenorI}				{System.out.println("Token MenorI encontrado, Lexema "+ yytext());}
{Distinto}				{System.out.println("Token Distinto encontrado, Lexema "+ yytext());}
{Igual}					{System.out.println("Token Igual encontrado, Lexema "+ yytext());}
{Suma}					{System.out.println("Token Suma encontrado, Lexema "+ yytext());}
{Resta}					{System.out.println("Token Resta encontrado, Lexema "+ yytext());}
{Multiplicacion}		{System.out.println("Token Multiplicacion encontrado, Lexema "+ yytext());}
{Division}				{System.out.println("Token Division encontrado, Lexema "+ yytext());}

{Asignacion}			{System.out.println("Token Asignacion encontrado, Lexema "+ yytext());}
{Numero}				{
							verify_int(yytext());
							System.out.println("Token Numero encontrado, Lexema "+ yytext());
						}
{Real}					{
							verify_real(yytext());
							System.out.println("Token Real encontrado, Lexema "+ yytext());
						}
{String}				{
							verify_string(yytext());
							System.out.println("Token String encontrado, Lexema "+ yytext());
						}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }