package SJUserInterface.SJForm;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.Random;

public class SJForm extends JFrame {

    private JTable table;
    private DefaultTableModel tableModel;
    private JTextField txtCedula;
    private JTextField txtNombres;

    // Lista de provincias de Ecuador
    private String[] provincias = {
        "ESMERALDAS", "MANABI", "SANTO DOMINGO DE LOS TSACHILAS", "LOS RIOS", 
        "SANTA ELENA", "GUAYAS", "EL ORO", "CARCHI", "IMBABURA", 
        "PICHINCHA", "COTOPAXI", "TUNGURAHUA", "BOLIVAR", "CHIMBORAZO", 
        "CAÑAR", "AZUAY", "LOJA", "SUCUMBIOS", "ORELLANA", "NAPO", 
        "PASTAZA", "MORONA SANTIAGO", "ZAMORA CHINCHIPE", "GALAPAGOS"
    };

    public SJForm() {
        setTitle("EcuaFauna 2K24A");
        setSize(600, 400);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Crear panel principal
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());

        // Panel superior con cédula y nombre
        JPanel panelSuperior = new JPanel();
        panelSuperior.setLayout(new GridLayout(2, 2));

        panelSuperior.add(new JLabel("Cédula:"));
        txtCedula = new JTextField("095419750-5");
        panelSuperior.add(txtCedula);

        panelSuperior.add(new JLabel("Nombres:"));
        txtNombres = new JTextField("Sacoto Jonathan");
        panelSuperior.add(txtNombres);

        panel.add(panelSuperior, BorderLayout.NORTH);

        // Crear la tabla y su modelo
        String[] columnNames = {"RegNo", "TipoHormiga", "Ubicación", "Sexo", "GenoAlimento", "IngestaNativa", "Estado", "ChipIA"};
        tableModel = new DefaultTableModel(columnNames, 0);
        table = new JTable(tableModel);

        JScrollPane scrollPane = new JScrollPane(table);
        panel.add(scrollPane, BorderLayout.CENTER);

        // Panel inferior con botones
        JPanel panelInferior = new JPanel();
        panelInferior.setLayout(new GridLayout(1, 5));

        JButton btnCrearLarva = new JButton("Crear Hormiga Larva");
        JButton btnGenoAlimento = new JButton("Alimentar con GenoAlimento");
        JButton btnIngestaNativa = new JButton("Alimentar con Ingesta Nativa");
        JButton btnEliminar = new JButton("Eliminar");
        JButton btnGuardar = new JButton("Guardar");

        panelInferior.add(btnCrearLarva);
        panelInferior.add(btnGenoAlimento);
        panelInferior.add(btnIngestaNativa);
        panelInferior.add(btnEliminar);
        panelInferior.add(btnGuardar);

        panel.add(panelInferior, BorderLayout.SOUTH);

        // Añadir panel al frame
        add(panel);

        // Acciones de los botones
        btnCrearLarva.addActionListener(e -> {
            int confirm = JOptionPane.showConfirmDialog(this, "¿Está seguro de crear una Hormiga Larva?");
            if (confirm == JOptionPane.YES_OPTION) {
                // Seleccionar una provincia aleatoria
                String provinciaAleatoria = provincias[new Random().nextInt(provincias.length)];
                tableModel.addRow(new Object[]{"1", "Larva", provinciaAleatoria, "Asexual", "X", "Nectarívoros", "VIVA", "Aprendiendo español"});
                JOptionPane.showMessageDialog(this, "Nueva hormiga larva creada.");
            } else {
                JOptionPane.showMessageDialog(this, "Operación cancelada.");
            }
        });

        btnGenoAlimento.addActionListener(e -> {
            int selectedRow = table.getSelectedRow();
            if (selectedRow != -1) {
                String tipoHormiga = (String) tableModel.getValueAt(selectedRow, 1);
                if ("Larva".equals(tipoHormiga)) {
                    String[] opcionesGenoAlimento = {"XX", "XY"};
                    String genoAlimentoSeleccionado = (String) JOptionPane.showInputDialog(
                            this,
                            "Seleccione el tipo de GenoAlimento:",
                            "GenoAlimento",
                            JOptionPane.QUESTION_MESSAGE,
                            null,
                            opcionesGenoAlimento,
                            opcionesGenoAlimento[0]
                    );

                    if ("XX".equals(genoAlimentoSeleccionado)) {
                        tableModel.setValueAt("Rastreadora", selectedRow, 1);
                        tableModel.setValueAt("Hembra", selectedRow, 3);
                        tableModel.setValueAt("Herbívoros", selectedRow, 5);
                        tableModel.setValueAt("VIVA", selectedRow, 6);
                        JOptionPane.showMessageDialog(this, "Hormiga alimentada con GenoAlimento XX, convertida en Rastreadora y su ingesta es ahora Herbívoros.");
                    } else if ("XY".equals(genoAlimentoSeleccionado)) {
                        tableModel.setValueAt("MUERTA", selectedRow, 6);
                        JOptionPane.showMessageDialog(this, "La hormiga ha muerto debido al GenoAlimento XY.");
                    }
                } else {
                    JOptionPane.showMessageDialog(this, "El tipo de hormiga no puede ser alimentado con GenoAlimento.");
                }
            } else {
                JOptionPane.showMessageDialog(this, "Seleccione una fila para alimentar.");
            }
        });

        btnIngestaNativa.addActionListener(e -> {
            int selectedRow = table.getSelectedRow();
            if (selectedRow != -1) {
                JOptionPane.showMessageDialog(this, "Hormiga alimentada con Ingesta Nativa.");
            } else {
                JOptionPane.showMessageDialog(this, "Seleccione una fila para alimentar.");
            }
        });

        btnEliminar.addActionListener(e -> {
            int selectedRow = table.getSelectedRow();
            if (selectedRow != -1) {
                int confirm = JOptionPane.showConfirmDialog(this, "¿Está seguro de eliminar esta hormiga?");
                if (confirm == JOptionPane.YES_OPTION) {
                    tableModel.removeRow(selectedRow);
                    JOptionPane.showMessageDialog(this, "Hormiga eliminada.");
                } else {
                    JOptionPane.showMessageDialog(this, "Operación cancelada.");
                }
            } else {
                JOptionPane.showMessageDialog(this, "Seleccione una fila para eliminar.");
            }
        });

        btnGuardar.addActionListener(e -> {
            JOptionPane.showMessageDialog(this, "Datos guardados con éxito.");
        });
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new SJForm().setVisible(true);
        });
    }
}
