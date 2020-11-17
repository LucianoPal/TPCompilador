import java_cup.runtime.Symbol;
import jflex.core.sym;

%%


/*%cupsym Simbolo*/
%cup
%public
%class Lexico
%line
%column
%char
%init{
	try{
		String carpeta = System.getProperty("user.dir");
		String ruta = carpeta + "/ts.txt";
		f = new File(ruta);
		bw = new BufferedWriter(new FileWriter(f,true));
		listaSimbolos = new ArrayList<>();
	}catch (IOException e){
		e.printStackTrace();
	}
%init}

%{
	BufferedWriter bw;
	File f;
	ArrayList<String> listaSimbolos;
	
	public void writeSymbolTable(String s) throws IOException{
		if(!listaSimbolos.contains(s.split(",")[0])){
			bw.write(s);
			bw.newLine();
			bw.flush();
			listaSimbolos.add(s.split(",")[0]);
		}
	}
	
	public String s = "";
	final int MAX_STRING = 30;
	final int MAX_INT = Short.MAX_VALUE;
	final float MAX_FLOAT = Float.MAX_VALUE;

	private boolean verify_real(String x) throws Exception {
		float f = Float.parseFloat(x);
		if (f < -MAX_FLOAT || f > MAX_FLOAT) {
			throw new Exception("La longitud del lexema "+x+" excede la esperada");
		}
		return true;
	}

	private boolean verify_int(String x) throws Exception {
		try {
			int i = Integer.parseInt(x);
			if (i < -MAX_INT || i > MAX_INT) {
				throw new Exception("La longitud del lexema "+x+" excede la esperada");
			}
		}catch (NumberFormatException e) {
			throw new Exception("La longitud del lexema "+x+" excede la esperada");
		}
		return true;
	}

	private boolean verify_string(String x) throws Exception {
		if (x.length() > MAX_STRING) {
			throw new Exception("La longitud del lexema "+x+" excede la esperada");
		}
		return true;
	}
%}

While = while | WHILE
If = if | IF | If
Else = else | ELSE | Else
Print = print | PRINT
DeclareB = declare | DECLARE
DeclareE = enddeclare | ENDDECLARE
ProgramB = BEGIN.PROGRAM | begin.program
ProgramE = END.PROGRAM | end.program
InList = inlist | INLIST
PInt = INT
PFloat = FLOAT
PString = STRING
VarId = {Nombre}
Comentario = "</" ~"/>"

And = "&&"
Or = "||"
Mayor = ">"
MayorI = ">="
Menor = "<"
MenorI = "<="
Distinto = "<>"
Igual = "==" | "="
Suma = "+"
Resta = "-"
Multiplicacion = "*"
Division = "/"
ParA = "("
ParC = ")"
LlaveA = "{"
LlaveC = "}"
CorcheteA = "["
CorcheteC = "]"
Coma = ","
PuntoC = ";"
Comilla = "\""

Asignacion = ":="
Letra = [a-zA-Z]
Digito = [0-9]
Numero = {Digito}+ | (- {Digito}+)
Real = ({Numero}+ "." {Digito}*) | ({Numero}* "." {Digito}+)
Blanco = [ \r\n]
EspacioBlanco = [ \t\f\r\n]
CaracterEspecial = {Letra}|{Digito}|"!"|"#"|"$"|"%"|"&"|"'"|"("|")"|"*"|"+"|","|"-"|"."|"/"|":"|";"|"{"|"="|"}"|"?"|"@"|"["|"]"|"^"|"_"|"`"|"{"|"|"|"}"|"~"|"\""
String = {Blanco} | {CaracterEspecial}*
Nombre = ({Letra})+ ({Digito} | {Letra} | "_")*


%%

<YYINITIAL> {

{Comentario}			{/**/}

{While} 				{
						return new Symbol(sym.While,yytext());
						s=s+"Token While encontrado, Lexema "+ yytext()+"\n";
						}
{If} 					{
						return new Symbol(sym.If,yytext());
						s=s+"Token If encontrado, Lexema "+ yytext()+"\n";
						}
{Else} 					{
						return new Symbol(sym.Else,yytext());
						s=s+"Token Else encontrado, Lexema "+ yytext()+"\n";
						}
{Print}					{
						return new Symbol(sym.Print,yytext());
						s=s+"Token Print encontrado, Lexema "+ yytext()+"\n";
						}
{DeclareB}				{
						return new Symbol(sym.DeclareB,yytext());
						s=s+"Token DeclareB encontrado, Lexema "+ yytext()+"\n";
						}
{DeclareE}				{
						return new Symbol(sym.DeclareE,yytext());
						s=s+"Token DeclareE encontrado, Lexema "+ yytext()+"\n";
						}
{ProgramB}				{
						return new Symbol(sym.ProgramB,yytext());
						s=s+"Token ProgramB encontrado, Lexema "+ yytext()+"\n";
						}
{ProgramE}				{
						return new Symbol(sym.ProgramE,yytext());
						s=s+"Token ProgramE encontrado, Lexema "+ yytext()+"\n";
						}
{InList}				{
						return new Symbol(sym.InList,yytext());
						s=s+"Token InList encontrado, Lexema "+ yytext()+"\n";
						}
{PInt}					{
						return new Symbol(sym.PInt,yytext());
						s=s+"Token PInt encontrado, Lexema "+ yytext()+"\n";
						}
{PFloat}				{
						return new Symbol(sym.PFloat,yytext());
						s=s+"Token PFloat encontrado, Lexema "+ yytext()+"\n";
						}
{PString}				{
						return new Symbol(sym.PString,yytext());
						s=s+"Token PString encontrado, Lexema "+ yytext()+"\n";
						}

{ParA}					{
						return new Symbol(sym.ParA,yytext());
						s=s+"Token ParA encontrado, Lexema "+ yytext()+"\n";
						}
{ParC}					{
						return new Symbol(sym.ParC,yytext());
						s=s+"Token ParC encontrado, Lexema "+ yytext()+"\n";
						}
{LlaveA}				{
						return new Symbol(sym.LlaveA,yytext());
						s=s+"Token LlaveA encontrado, Lexema "+ yytext()+"\n";
						}
{LlaveC}				{
						return new Symbol(sym.LlaveC,yytext());
						s=s+"Token LlaveC encontrado, Lexema "+ yytext()+"\n";
						}
{CorcheteA}				{
						return new Symbol(sym.CorcheteA,yytext());
						s=s+"Token CorcheteA encontrado, Lexema "+ yytext()+"\n";
						}
{CorcheteC}				{
						return new Symbol(sym.CorcheteC,yytext());
						s=s+"Token CorcheteC encontrado, Lexema "+ yytext()+"\n";
						}

{And}					{
						return new Symbol(sym.And,yytext());
						s=s+"Token And encontrado, Lexema "+ yytext()+"\n";
						}
{Or}					{
						return new Symbol(sym.Or,yytext());
						s=s+"Token Or encontrado, Lexema "+ yytext()+"\n";
						}
{Mayor}					{
						return new Symbol(sym.Mayor,yytext());
						s=s+"Token Mayor encontrado, Lexema "+ yytext()+"\n";
						}
{MayorI}				{
						return new Symbol(sym.MayorI,yytext());
						s=s+"Token MayorI encontrado, Lexema "+ yytext()+"\n";
						}
{Menor}					{
						return new Symbol(sym.Menor,yytext());
						s=s+"Token Menor encontrado, Lexema "+ yytext()+"\n";
						}
{MenorI}				{
						return new Symbol(sym.MenorI,yytext());
						s=s+"Token MenorI encontrado, Lexema "+ yytext()+"\n";
						}
{Distinto}				{
						return new Symbol(sym.Distinto,yytext());
						s=s+"Token Distinto encontrado, Lexema "+ yytext()+"\n";
						}
{Igual}					{
						return new Symbol(sym.Igual,yytext());
						s=s+"Token Igual encontrado, Lexema "+ yytext()+"\n";
						}
{Suma}					{
						return new Symbol(sym.Suma,yytext());
						s=s+"Token Suma encontrado, Lexema "+ yytext()+"\n";
						}
{Resta}					{
						return new Symbol(sym.Resta,yytext());
						s=s+"Token Resta encontrado, Lexema "+ yytext()+"\n";
						}
{Multiplicacion}		{
						return new Symbol(sym.Multiplicacion,yytext());
						s=s+"Token Multiplicacion encontrado, Lexema "+ yytext()+"\n";
						}
{Division}				{
						return new Symbol(sym.Division,yytext());
						s=s+"Token Division encontrado, Lexema "+ yytext()+"\n";
						}
{Coma}					{
						return new Symbol(sym.Coma,yytext());
						s=s+"Token Coma encontrado, Lexema "+ yytext()+"\n";
						}
{PuntoC}				{
						return new Symbol(sym.PuntoC,yytext());
						s=s+"Token PuntoC encontrado, Lexema "+ yytext()+"\n";
						}
{Comilla}				{
						return new Symbol(sym.Comilla,yytext());
						s=s+"Token Comilla encontrado, Lexema "+ yytext()+"\n";
						}
{Asignacion}			{
						return new Symbol(sym.Asignacion,yytext());
						s=s+"Token Asignacion encontrado, Lexema "+ yytext()+"\n";
						}

{Numero}				{
							verify_int(yytext());
							return new Symbol(sym.Numero,yytext());
							s=s+"Token Numero encontrado, Lexema "+ yytext()+"\n";
							writeSymbolTable("_"+ yytext() + ",Numero,,"+ yytext()+ ",");
						}
{Real}					{
							verify_real(yytext());
							return new Symbol(sym.Real,yytext());
							s=s+"Token Real encontrado, Lexema "+ yytext()+"\n";
							writeSymbolTable("_"+ yytext() + ",Real,,"+ yytext()+ ",");
						}
"\"" [^\"\n\r]* "\""				{
							verify_string(yytext());
							return new Symbol(sym.String,yytext());
							s=s+"Token String encontrado, Lexema "+ yytext()+"\n";
							writeSymbolTable("_"+ yytext() + ",String,,"+ yytext()+ ","+ yytext().length());
						}

{EspacioBlanco}			{ /* ignore */ }

{VarId}					{
						return new Symbol(sym.VarId,yytext());
						s=s+"Token VarId encontrado, Lexema "+ yytext()+"\n";
						writeSymbolTable(yytext() + ",VarId,,"+",");
						}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }
<<EOF>> {return new Symbol(sym.EOF);}