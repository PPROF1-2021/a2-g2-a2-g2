package iefi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Conexion {
    private static String db = "iefi";
    private static String user = "root";
    private static String pass ="321232A.a";
    private static String url = "jdbc:mysql://127.0.0.1:3307/iefi";
    private Connection con;
    
    public Connection getCon() {return con;}
    public void setCon(Connection con) {this.con = con;}
    
    public Conexion(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,pass);
        } catch (ClassNotFoundException | SQLException e){
            JOptionPane.showMessageDialog(null, "Error de Conexión: "
                    + e.getMessage());            
        }
    }
    public Connection getConnection(){
        return getCon();
    }
}
