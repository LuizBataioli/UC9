package jogodavelha;

public class JogoDaVelha {
    
    private String[][] matriz = {{"1","2","3"},{"4","5","6"},{"7","8","9"}};
    
    public String Mostrar(){
        for(int li=0; li<3; li++ ){
            for(int col=0; col<3; col++){
                System.out.println("    "+ matriz[li][col]);
            }
            System.out.println("\n");
        }
        return null;
    } 
    
}
