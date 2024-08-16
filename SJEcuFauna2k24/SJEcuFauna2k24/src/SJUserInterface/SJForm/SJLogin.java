package SJUserInterface.SJForm;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class SJLogin {
    private JFrame frame;

    public SJLogin() {
        // Crear el frame de la ventana
        frame = new JFrame("Login");
        frame.setSize(350, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(null);

        // Etiqueta y campo de texto para el usuario
        JLabel userLabel = new JLabel("Usuario:");
        userLabel.setBounds(50, 30, 80, 25);
        frame.add(userLabel);

        JTextField userText = new JTextField(20);
        userText.setBounds(150, 30, 150, 25);
        frame.add(userText);

        // Etiqueta y campo de texto para la contraseña
        JLabel passwordLabel = new JLabel("Contraseña:");
        passwordLabel.setBounds(50, 70, 80, 25);
        frame.add(passwordLabel);

        JPasswordField passwordText = new JPasswordField(20);
        passwordText.setBounds(150, 70, 150, 25);
        frame.add(passwordText);

        // Botón de login
        JButton loginButton = new JButton("Login");
        loginButton.setBounds(150, 110, 150, 25);
        frame.add(loginButton);

        // Acción del botón de login
        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String user = userText.getText();
                String password = new String(passwordText.getPassword());

                if (user.equals("patmic") && password.equals("123456")) {
                    JOptionPane.showMessageDialog(frame, "Login exitoso", "Éxito", JOptionPane.INFORMATION_MESSAGE);
                    // Cerrar la ventana de login
                    frame.dispose();
                    // Abrir la ventana principal
                    SwingUtilities.invokeLater(() -> new SJForm().setVisible(true));
                } else {
                    JOptionPane.showMessageDialog(frame, "Usuario o contraseña incorrectos", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        // Centrar la ventana en la pantalla
        frame.setLocationRelativeTo(null);
    }

    // Método para controlar la visibilidad de la ventana
    public void setVisible(boolean visible) {
        frame.setVisible(visible);
    }

    public static void main(String[] args) {
        // Crear una instancia de SJLogin
        SJLogin login = new SJLogin();
        
        // Hacer visible la ventana de login
        login.setVisible(true);
    }
}
