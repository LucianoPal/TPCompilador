package main;

import java.io.FileNotFoundException;
import java.io.FileReader;

public class main {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		FileReader f = new FileReader("C:\\Users\\German\\Documents\\GitHub\\TPCompilador\\Segunda Entrega\\prueba.txt");
		Lexico Lexer = new Lexico(f);
		parser sintactico = new parser(Lexer);
		sintactico.parse();
	}

}
