import java_cup.runtime.Symbol;


%%


/*%cupsym Simbolo*/
%cup
%public
%class Lexico
%line
%column
%char

Letra = [a-zA-Z]
Digito = [0-9]
Numero = {Digito}+ | (- {Digito}+)
Real = ({Numero}+ "." {Digito}*) | ({Numero}* "." {Digito}+)
Blanco = \t|\f|\n|\r|\r\n|" "
CaracterEspecial = "+"|","|"-"|"."|":"|";"
String = ({Letra} | {Blanco} | {Digito} | {CaracterEspecial})+
Nombre = ({Digito} | {Letra} | "_")+
While = while | WHILE
If = if | IF
Print = print | PRINT
DeclareB = declare | DECLARE
DeclareE = enddeclare | ENDDECLARE
ProgramB = BEGIN.PROGRAM | begin.program
ProgramE = END.PROGRAM | end.program
InList = inlist | INLIST
VarId = {Nombre}
Asignacion = ":="
ComA = "</"
ComC = "/>"
And = "&&"
Or = "||"
Mayor = ">"
MayorI = ">="
Menor = "<"
MenorI = "<="
Distinto = "<>"
ParA = "("
ParC = ")"
LlaveA = "{"
LlaveC = "}"
CorcheteA = "["
CorcheteC = "]"


%%

<YYINITIAL> {

{Numero}				{System.out.println("Token Numero encontrado, Lexema "+ yytext());}
{Real}					{System.out.println("Token Real encontrado, Lexema "+ yytext());}
{String}				{System.out.println("Token String encontrado, Lexema "+ yytext());}
{Nombre} 				{System.out.println("Token Nombre encontrado, Lexema "+ yytext());}
{While} 				{System.out.println("Token While encontrado, Lexema "+ yytext());}
{If} 					{System.out.println("Token If encontrado, Lexema "+ yytext());}
{Print}					{System.out.println("Token Print encontrado, Lexema "+ yytext());}
{DeclareB}				{System.out.println("Token DeclareB encontrado, Lexema "+ yytext());}
{DeclareE}				{System.out.println("Token DeclareE encontrado, Lexema "+ yytext());}
{ProgramB}				{System.out.println("Token ProgramB encontrado, Lexema "+ yytext());}
{ProgramE}				{System.out.println("Token ProgramE encontrado, Lexema "+ yytext());}
{InList}				{System.out.println("Token InList encontrado, Lexema "+ yytext());}
{VarId}					{System.out.println("Token VarId encontrado, Lexema "+ yytext());}
{Asignacion}			{System.out.println("Token Asignacion encontrado, Lexema "+ yytext());}
{ComA}					{System.out.println("Token ComA encontrado, Lexema "+ yytext());}
{ComC}					{System.out.println("Token ComC encontrado, Lexema "+ yytext());}
{And}					{System.out.println("Token And encontrado, Lexema "+ yytext());}
{Or}					{System.out.println("Token Or encontrado, Lexema "+ yytext());}
{Mayor}					{System.out.println("Token Mayor encontrado, Lexema "+ yytext());}
{MayorI}				{System.out.println("Token MayorI encontrado, Lexema "+ yytext());}
{Menor}					{System.out.println("Token Menor encontrado, Lexema "+ yytext());}
{MenorI}				{System.out.println("Token MenorI encontrado, Lexema "+ yytext());}
{Distinto}				{System.out.println("Token Distinto encontrado, Lexema "+ yytext());}
{ParA}					{System.out.println("Token ParA encontrado, Lexema "+ yytext());}
{ParC}					{System.out.println("Token ParC encontrado, Lexema "+ yytext());}
{LlaveA}				{System.out.println("Token LlaveA encontrado, Lexema "+ yytext());}
{LlaveC}				{System.out.println("Token LlaveC encontrado, Lexema "+ yytext());}
{CorcheteA}				{System.out.println("Token CorcheteA encontrado, Lexema "+ yytext());}
{CorcheteC}				{System.out.println("Token CorcheteC encontrado, Lexema "+ yytext());}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }