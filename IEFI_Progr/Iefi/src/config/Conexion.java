
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Conexion {
 public static String db = "iefi";
        public static String user = "root";
        public static String pass = "sol123456789";
        public static String url = "jdbc:mysql://127.0.0.1:3306/iefi";
    Connection con;
    public Conexion(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, pass);
            } catch (ClassNotFoundException | SQLException e) {
                JOptionPane.showMessageDialog(null, "Error de Conexión"
                        + ": " + e.getMessage());
            }
        }
        
    /*metodo para retornar el valor de la conexion*/
    
       public Connection getConnection () {
           return con;
    }
            
            
}