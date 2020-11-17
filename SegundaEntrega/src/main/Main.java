package main;

import java.io.FileNotFoundException;
import java.io.FileReader;

public class Main {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		FileReader f = new FileReader("C:\\Users\\German\\Documents\\GitHub\\TPCompilador\\SegundaEntrega\\prueba.txt");
		Lexico Lexer = new Lexico(f);
		parser sintactico = new parser(Lexer);
		sintactico.parse();
	}

}
