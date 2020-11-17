package main;

import java.io.FileNotFoundException;
import java.io.FileReader;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FileReader f;
		try {
			f = new FileReader("C:\\Users\\German\\Documents\\GitHub\\TPCompilador\\SegundaEntrega\\prueba.txt");
			Lexico Lexer = new Lexico(f);
			parser sintactico = new parser(Lexer);
			sintactico.parse();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("ERROR");
			e.printStackTrace();
		}
		
	}

}
