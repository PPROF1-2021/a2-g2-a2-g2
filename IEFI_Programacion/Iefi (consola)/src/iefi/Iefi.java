
package iefi;

import java.util.Scanner;

public class Iefi {

    public static void main(String[] args) {
        //Variables
        int opcion = 99;
        String nombre = "";
        String apellido = "";
        int dni = 0;
        int id = 0;
        Alumno alumno;

        Scanner teclado = new Scanner(System.in);
        Scanner tecla = new Scanner(System.in);

        do{
            Alumno[] arrayAlumno = null;
            int cantidad  = 0;
            System.out.println("Ingrese una opción: ");
            System.out.println("1 - Listar alumnos.");
            System.out.println("2 - Ingresar alumno nuevo.");
            System.out.println("3 - Editar alumno existente.");
            System.out.println("4 - Eliminar un alumno.");
            System.out.println("0 - Salir");
            System.out.print("--> ");
            opcion = teclado.nextInt();
            switch(opcion){
                case 1:
                    alumno = new Alumno();
                    arrayAlumno = alumno.listar();
                    if(arrayAlumno != null){
                        cantidad = arrayAlumno.length;
                        System.out.print("\033[H\033[2J");
                        if(cantidad != 0){
                            System.out.print("ID:\t");
                            System.out.print("Nombre:\t\t");
                            System.out.print("Apellido:\t\t");
                            System.out.println("DNI:");
                            for(int i=0;i<cantidad;i++){
                                alumno = arrayAlumno[i];
                                System.out.print(alumno.getId_alumno()+ "\t");
                                System.out.print(alumno.getNombre());
                                if(alumno.getNombre().length()<8){
                                    System.out.print("\t\t");
                                }else{
                                    System.out.print("\t");
                                }
                                System.out.print(alumno.getApellido() + "\t");
                                if(alumno.getApellido().length()<8){
                                    System.out.print("\t\t");
                                }else{
                                    System.out.print("\t");
                                }
                                System.out.println(alumno.getDni());                                
                            }
                            tecla.nextLine();
                        }
                    }                    
                    break;
                case 2:
                    do{
                        System.out.print("Ingrese un nombre: ");
                        nombre = teclado.next();
                        System.out.print("Ingrese un apellido: ");
                        apellido = teclado.next();
                        System.out.print("Ingrese un dni: ");
                        dni = teclado.nextInt();
                        if(nombre.equals("") || apellido.equals("") || dni == 0){
                            System.out.println("POR FAVOR! llenen todos los campos");
                        }else{
                            alumno = new Alumno();
                            alumno.setNombre(nombre);
                            alumno.setApellido(apellido);
                            alumno.setDni(dni);
                            String mensaje= alumno.insertar(alumno);
                            System.out.println(mensaje);
                            tecla.nextLine();

                            break;
                        }
                    }while(true);
                    break;
                case 3:
                    alumno = new Alumno();
                    do{
                        System.out.print("Ingrese un id: ");
                        id = teclado.nextInt();
                        alumno = alumno.getAlumno(id);
                        if(alumno != null){
                            System.out.print("Ingrese un dni nuevo: ");
                            dni = teclado.nextInt();
                            if(dni != alumno.getDni()){
                                alumno.setDni(dni);
                            }
                            String mensaje= alumno.actualizar(alumno);
                            System.out.println(mensaje);
                            tecla.nextLine();
                            break;
                        }else{
                            System.out.println("Por favor, ingrese un id valido.");
                        }

                    }while(true);
                    break;
                case 4:
                    alumno = new Alumno();
                    do{
                        System.out.print("Ingrese un id: ");
                        id = teclado.nextInt();
                        alumno = alumno.getAlumno(id);
                        if(alumno != null){
                            String mensaje= alumno.borrar(id);
                            System.out.println(mensaje);
                            tecla.nextLine();
                            break;
                        }else{
                            System.out.println("Por favor, ingrese un id valido.");
                        }

                    }while(true);
                    break;
                case 0:
                    break;
                default:
                    System.out.println("Por favor, seleccione una opción valida");
            }
        }while(opcion != 0);
        
        
    }
    
}
