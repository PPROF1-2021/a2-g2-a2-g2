package iefi;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;

public class Alumno {
    /*
    * Atributos
    */
    private int id_alumno;
    private String nombre;
    private String apellido;
    private int dni;
    private Connection cn;
    private Statement st;
    private ResultSet rs;
    private DefaultTableModel modelo;
    private Conexion con = new Conexion();
    
    
    /*
    * Constructores
    */
    Alumno(){
        this.nombre = "";
        this.apellido = "";
        this.dni = 0;
    }
    Alumno(int id_alumno,String nombre, String apellido, int dni){
        this.id_alumno = id_alumno;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
    }
    
    /*
    * Encapsulamiento, getters y setters
    */
    public int getId_alumno() {return id_alumno;}
    public void setId_alumno(int id_alumno) {this.id_alumno = id_alumno;}

    public String getNombre() {return nombre;}
    public void setNombre(String nombre) {this.nombre = nombre;}

    public String getApellido() {return apellido;}
    public void setApellido(String apellido) {this.apellido = apellido;}

    public int getDni() {return dni;}
    public void setDni(int dni) {this.dni = dni;}
    
    /*
    * Metodos
    */    
    public String insertar(Alumno alumno){
        String sql = "INSERT INTO alumnos(nombre,apellido,dni) "
                + "VALUES('" + alumno.getNombre() 
                +"','"+alumno.getApellido()
                +"',"+alumno.getDni()+")";
        try{
            cn = con.getConnection();
            st = cn.createStatement();
            st.executeUpdate(sql);
            return "Regstro con éxito";
        } catch(Exception e){
            return "Hubo un error: " + e.getMessage();
        }

    }
    
    public String actualizar(Alumno alumno){
        String sql ="UPDATE alumnos SET"
                + " dni = " +alumno.getDni()
                + " where id_alumno = " + alumno.getId_alumno();
        try{
            cn = con.getConnection();
            st = cn.createStatement();
            st.executeUpdate(sql);
            return "Alumno actualizado con éxito";
        } catch(Exception e){
            return "Hubo un error: " + e.getMessage();
        }
    }
    
    public String borrar(int id){
        String sql = "delete from alumnos where id_alumno = " + id;
        try{
            cn = con.getConnection();
            st = cn.createStatement();
            st.executeUpdate(sql);
            return "Alumno eliminado";
        } catch(Exception e){
            return "Hubo un error: " + e.getMessage();
        }
    }
    public Alumno[] listar(){
        Alumno[] arrayAlumno = null;
        int cantFilas = 0;
        int contador = 0;
        String sql = "select * from alumnos";
        try{
            cn = con.getConnection();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                cantFilas++;
            }
            rs = st.executeQuery(sql);
            if(cantFilas > 0){
                arrayAlumno = new Alumno[cantFilas];
                while(rs.next()){
                    Alumno alumno = new Alumno(
                            rs.getInt("id_alumno"),
                            rs.getString("nombre"),
                            rs.getString("apellido"),
                            rs.getInt("dni")
                    );
                    arrayAlumno[contador] = alumno;
                    contador++;
                }
            }
            return arrayAlumno;            
        }catch(Exception e){
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    public Alumno getAlumno(int id){
        Alumno alumno = null;
        String sql = "SELECT * FROM alumnos WHERE id_alumno = "+id;
        try{
            cn = con.getConnection();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                alumno = new Alumno(
                    rs.getInt("id_alumno"),
                    rs.getString("nombre"),
                    rs.getString("apellido"),
                    rs.getInt("dni")
                );
            }
        } catch(Exception e){
            System.out.println("Error: " + e.getMessage());
        }
        return alumno;
    }
}
