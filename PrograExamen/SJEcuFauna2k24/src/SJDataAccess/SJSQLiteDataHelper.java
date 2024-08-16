package SJDataAccess;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SJSQLiteDataHelper {

    private static final String DATABASE_URL = "jdbc:sqlite:C:/Users/Usuario/Downloads/PrograExamen/SJEcuFauna2k24/DataBase/SJDataBase.sqlite";

    static {
        try {
            Class.forName("org.sqlite.JDBC");
            System.out.println("Driver SQLite cargado correctamente.");
        } catch (ClassNotFoundException e) {
            System.err.println("Error al cargar el driver SQLite: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static Connection openConnection() throws SQLException {
        try {
            Connection conn = DriverManager.getConnection(DATABASE_URL);
            if (conn != null) {
                System.out.println("Conexión a base de datos exitosa.");
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
            return conn;
        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }
}