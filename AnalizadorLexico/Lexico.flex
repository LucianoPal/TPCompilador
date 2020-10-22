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
Blanco = \t|\f|" "
CaracterEspecial = "!"|"#"|"$"|"%"|"&"|"'"|"("|")"|"*"|"+"|","|"-"|"."|"/"|":"|";"|"{"|"="|"}"|"?"|"@"|"["|"\"|"]"|"^"|"_"|"`"|"{"|"|"|"}"|"~"|"á"|"í"|"ó"|"ú"|"ª"|"º"|"¿"|"⌐"
String = {Letra} | {Blanco} | {Digito} | {CaracterEspecial} | ({String}{Letra}) | ({String}{Blanco}) | ({String}{Digito}) | ({String}{CaracterEspecial})
Nombre = {Digito} | {Letra} | "_" | ({Nombre}{Digito}) | ({Nombre}{Letra}) | ({Nombre}"_")
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


Declaracion = "DECLARE" {LineaDeDeclaracion} "ENDDECLARE"
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
LineaDeDeclaracion = AYUDAAAAA
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Programa = BEGIN.PROGRAM {ListaDeSentencias} END.PROGRAM
ListaDeSentencias = {Asignacion} | {Comentario} | {Salida} | {CondicionLogica} | {Condicion}


%%