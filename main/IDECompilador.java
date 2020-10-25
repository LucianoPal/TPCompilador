package main;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import java.awt.GridLayout;
import java.awt.GridBagLayout;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.GridBagConstraints;
import java.awt.Font;
import java.awt.Insets;
import java.awt.TextArea;
import javax.swing.JTextPane;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JTextField;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.awt.event.ActionEvent;

public class IDECompilador extends JFrame {

	private JPanel contentPane;
	private JTextField txtNombre;
	private FileReader fr;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					IDECompilador frame = new IDECompilador();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public IDECompilador() {
		setTitle("Compilador - Grupo 1");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 575, 482);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		GridBagLayout gbl_contentPane = new GridBagLayout();
		gbl_contentPane.columnWidths = new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		gbl_contentPane.rowHeights = new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		gbl_contentPane.columnWeights = new double[]{1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Double.MIN_VALUE};
		gbl_contentPane.rowWeights = new double[]{0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, Double.MIN_VALUE};
		contentPane.setLayout(gbl_contentPane);
		
		JLabel lblAnalizadorLxico = new JLabel("Compilador");
		lblAnalizadorLxico.setFont(new Font("Tahoma", Font.PLAIN, 16));
		GridBagConstraints gbc_lblAnalizadorLxico = new GridBagConstraints();
		gbc_lblAnalizadorLxico.gridwidth = 6;
		gbc_lblAnalizadorLxico.insets = new Insets(0, 0, 5, 5);
		gbc_lblAnalizadorLxico.gridx = 6;
		gbc_lblAnalizadorLxico.gridy = 1;
		contentPane.add(lblAnalizadorLxico, gbc_lblAnalizadorLxico);
		
		JLabel lblCodigoDePrueba = new JLabel("Codigo a analizar");
		lblCodigoDePrueba.setFont(new Font("Tahoma", Font.PLAIN, 13));
		GridBagConstraints gbc_lblCodigoDePrueba = new GridBagConstraints();
		gbc_lblCodigoDePrueba.gridwidth = 6;
		gbc_lblCodigoDePrueba.insets = new Insets(0, 0, 5, 5);
		gbc_lblCodigoDePrueba.gridx = 2;
		gbc_lblCodigoDePrueba.gridy = 3;
		contentPane.add(lblCodigoDePrueba, gbc_lblCodigoDePrueba);
		
		JLabel lblNombreDelArchivo = new JLabel("Nombre del archivo");
		GridBagConstraints gbc_lblNombreDelArchivo = new GridBagConstraints();
		gbc_lblNombreDelArchivo.gridwidth = 2;
		gbc_lblNombreDelArchivo.anchor = GridBagConstraints.EAST;
		gbc_lblNombreDelArchivo.insets = new Insets(0, 0, 5, 5);
		gbc_lblNombreDelArchivo.gridx = 4;
		gbc_lblNombreDelArchivo.gridy = 4;
		contentPane.add(lblNombreDelArchivo, gbc_lblNombreDelArchivo);
		
		txtNombre = new JTextField();
		GridBagConstraints gbc_txtNombre = new GridBagConstraints();
		gbc_txtNombre.gridwidth = 5;
		gbc_txtNombre.insets = new Insets(0, 0, 5, 5);
		gbc_txtNombre.fill = GridBagConstraints.HORIZONTAL;
		gbc_txtNombre.gridx = 6;
		gbc_txtNombre.gridy = 4;
		contentPane.add(txtNombre, gbc_txtNombre);
		txtNombre.setColumns(10);
		
		TextArea txaArchivo = new TextArea();
		GridBagConstraints gbc_txaArchivo = new GridBagConstraints();
		gbc_txaArchivo.gridwidth = 17;
		gbc_txaArchivo.insets = new Insets(0, 0, 5, 5);
		gbc_txaArchivo.gridx = 0;
		gbc_txaArchivo.gridy = 6;
		contentPane.add(txaArchivo, gbc_txaArchivo);
		
		JButton btnGuardarArchivo = new JButton("Guardar");
		btnGuardarArchivo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String nombreArchivo = txtNombre.getText();
				String carpeta = System.getProperty("user.dir");
				String rutaArchivo = carpeta + "/" + nombreArchivo;
				
				FileWriter fw = null;
				try {
					fw = new FileWriter(rutaArchivo);
				}catch(IOException ex) {
					Logger.getLogger(Main.class.getName()).log(Level.SEVERE,null,ex);
				}
				try { 
					BufferedWriter bw = new BufferedWriter(fw);
					bw.write(txaArchivo.getText());
					bw.close();
					JOptionPane.showMessageDialog(null, "Archivo guardado correctamente");
				}catch (Exception ex){
					
				}
			}
		});
		GridBagConstraints gbc_btnGuardarArchivo = new GridBagConstraints();
		gbc_btnGuardarArchivo.insets = new Insets(0, 0, 5, 5);
		gbc_btnGuardarArchivo.gridx = 11;
		gbc_btnGuardarArchivo.gridy = 4;
		contentPane.add(btnGuardarArchivo, gbc_btnGuardarArchivo);
		
		JButton btnAbrirArchivo = new JButton("Abrir archivo");
		btnAbrirArchivo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				JFileChooser fc = new JFileChooser();
				fc.showOpenDialog(null);
				File archivo = fc.getSelectedFile();
				String nombre = archivo.getName();
				txtNombre.setText(nombre);
				
				try {
					fr = new FileReader(archivo);
					BufferedReader br = new BufferedReader(fr);
					String texto= "";
					String linea= "";
					while((linea=br.readLine()) != null) {
						texto += linea+"\n"
;					}
					txaArchivo.setText(texto);
					fr.close();
					fr=null;
					fr= new FileReader(archivo);
				}catch(Exception ex) {
					
				}
			}
		});
		GridBagConstraints gbc_btnAbrirArchivo = new GridBagConstraints();
		gbc_btnAbrirArchivo.insets = new Insets(0, 0, 5, 5);
		gbc_btnAbrirArchivo.gridx = 12;
		gbc_btnAbrirArchivo.gridy = 4;
		contentPane.add(btnAbrirArchivo, gbc_btnAbrirArchivo);
		

		
		JLabel lblResutadosDelAnlisis = new JLabel("Resutados del an\u00E1lisis l\u00E9xico");
		lblResutadosDelAnlisis.setFont(new Font("Tahoma", Font.PLAIN, 13));
		GridBagConstraints gbc_lblResutadosDelAnlisis = new GridBagConstraints();
		gbc_lblResutadosDelAnlisis.gridwidth = 3;
		gbc_lblResutadosDelAnlisis.insets = new Insets(0, 0, 5, 5);
		gbc_lblResutadosDelAnlisis.gridx = 3;
		gbc_lblResutadosDelAnlisis.gridy = 8;
		contentPane.add(lblResutadosDelAnlisis, gbc_lblResutadosDelAnlisis);
		
		JTextPane resultadoAnalisis = new JTextPane();
		resultadoAnalisis.setEditable(false);
		GridBagConstraints gbc_resultadoAnalisis = new GridBagConstraints();
		gbc_resultadoAnalisis.insets = new Insets(0, 0, 5, 5);
		gbc_resultadoAnalisis.gridheight = 3;
		gbc_resultadoAnalisis.gridwidth = 12;
		gbc_resultadoAnalisis.fill = GridBagConstraints.BOTH;
		gbc_resultadoAnalisis.gridx = 3;
		gbc_resultadoAnalisis.gridy = 9;
		contentPane.add(resultadoAnalisis, gbc_resultadoAnalisis);
		
		JButton btnRealizarAnalisis = new JButton("Realizar An\u00E1lisis");
		btnRealizarAnalisis.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					Lexico Lexer = new Lexico(fr);
					Lexer.next_token();
					//resultadoAnalisis.setText(a.toString());
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		GridBagConstraints gbc_btnRealizarAnalisis = new GridBagConstraints();
		gbc_btnRealizarAnalisis.insets = new Insets(0, 0, 5, 5);
		gbc_btnRealizarAnalisis.gridx = 12;
		gbc_btnRealizarAnalisis.gridy = 7;
		contentPane.add(btnRealizarAnalisis, gbc_btnRealizarAnalisis);
	}

}
