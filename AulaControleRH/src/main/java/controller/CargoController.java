
package controller;

import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.Cargo;
import model.CargoDAO;

public class CargoController {
    
    private CargoDAO cargoDAO;

    public CargoController(){
        this.cargoDAO = new CargoDAO();
    }

    public boolean addCargo(String nome, String descricao) throws SQLException{
        
        if(nome.isEmpty()|| descricao.isEmpty()){
            JOptionPane.showMessageDialog(null, "Por favor, preencha todos os campos.");
            return false;
        } else{
        Cargo cargo = new Cargo();
        cargo.setNome(nome);
        cargo.setDescricao(descricao);

        cargoDAO.addCargo(cargo);
        JOptionPane.showMessageDialog(null, "Cargo cadastrado com sucesso!");
        return true;
        }
    }
    
}
