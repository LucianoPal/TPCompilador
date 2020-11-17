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
Numero = {Digito} | ({Numero}{Digito}*) | (- | lambda)
Real = - ({Numero}+ "." {Numero}*) | ({Numero}* "." {Numero}+)
Blanco = \t|\f|\n|" "
CaracterEspecial = "!"|"#"|"$"|"%"|"&"|"'"|"("|")"|"*"|"+"|","|"-"|"."|"/"|":"|";"|"{"|"="|"}"|"?"|"@"|"["|"\"|"]"|"^"|"_"|"`"|"{"|"|"|"}"|"~"|"á"|"í"|"ó"|"ú"|"ª"|"º"|"¿"|"⌐"
String = {Letra} | {Blanco} | {Digito} | {CaracterEspecial} | ({String}{Letra}) | ({String}{Blanco}) | ({String}{Digito}) | ({String}{CaracterEspecial})
Nombre = {Digito} | {Letra} | "_" | ({Nombre}{Digito}) | ({Nombre}{Letra}) | ({Nombre}"_")

-----DUDA-----
While = while | WHILE
If = if | IF

Print = print | PRINT
VariableN = {Nombre}
VariableS = {Nombre}
Asignacion = ({VariableN} ":=" {Numero}) | ({VariableN} ":=" {Real}) | ({VariableS} ":=" {String})
Comentario = "</" {String} "/>"
Salida = {Print} \" {String} \"
CondicionLogica = ("(" {Condicion} ")") | ("(" {Condicion} ")") | ({CondicionLogica} "&&" {Condicion}) | ({CondicionLogica} "||" {Condicion})
Expresion = {VariableN} | {VariableS}
Condicion = ({Expresion} "<" {Expresion}) | ({Expresion} "<=" {Expresion}) | ({Expresion} ">" {Expresion}) | ({Expresion} ">=" {Expresion}) | ({Expresion} "==" {Expresion}) | ({Expresion} "<>" {Expresion})

-----DUDA-----
Declaracion = "DECLARE" {Blanco} {ListaDeDeclaraciones} {Blanco} "ENDDECLARE"
ListaDeDeclaraciones := {LineaDeDeclaracion} | ({ListaDeDeclaraciones} {Blanco} {LineaDeDeclaracion})
Variable = {Nombre}
Tipo = {Numero} | {Real} | {String}
LineaDeDeclaracion = ("[" {VariableTipo} "]")
VariableTipo = ({Variable} "," {VariableTipo} "," {Tipo}) | ({Variable} {FinDeDeclaracion} {Tipo})
FinDeDeclaracion = "]:=["

Programa = BEGIN.PROGRAM {Blanco} {ListaDeSentencias} {Blanco} END.PROGRAM
ListaDeSentencias = {LineaDeSentencia} | ({ListaDeSentencias} {Blanco} {LineaDeSentencia})
LineaDeSentencia = {Asignacion} | {Comentario} | {Salida} | {CondicionLogica} | {Condicion}

Inlist = "INLIST(" {VariableN} ",[" {ListaDeCte} "])"
ListaDeCte = {ListaReal} | {ListaNumero}
ListaReal = {Real} | ({ListaReal} ";" {Real})
ListaNumero = {Numero} | ({ListaNumero} ";" {Numero})


%%

<YYINITIAL> {

{Numero}				{System.out.println("Token Numero encontrado, Lexema "+ yytext());}
{Real}					{System.out.println("Token Real encontrado, Lexema "+ yytext());}
{String}				{System.out.println("Token String encontrado, Lexema "+ yytext());}
{Nombre} 				{System.out.println("Token Nombre encontrado, Lexema "+ yytext());}
{While} 				{System.out.println("Token While encontrado, Lexema "+ yytext());}
{If} 					{System.out.println("Token If encontrado, Lexema "+ yytext());}
{Asignacion}			{System.out.println("Token Asignacion encontrado, Lexema "+ yytext());}
{Comentario}			{System.out.println("Token Comentario encontrado, Lexema "+ yytext());}
{Salida}				{System.out.println("Token Salida encontrado, Lexema "+ yytext());}
{CondicionLogica}		{System.out.println("Token CondicionLogica encontrado, Lexema "+ yytext());}
{Condicion}				{System.out.println("Token Condicion encontrado, Lexema "+ yytext());}
{Declaracion}			{System.out.println("Token Declaracion encontrado, Lexema "+ yytext());}
{LineaDeDeclaracion}	{System.out.println("Token LineaDeDeclaracion encontrado, Lexema "+ yytext());}
{Programa}				{System.out.println("Token Programa encontrado, Lexema "+ yytext());}
{Inlist}				{System.out.println("Token Inlist encontrado, Lexema "+ yytext());}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }