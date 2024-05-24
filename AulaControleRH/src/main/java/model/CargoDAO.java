
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnection;

public class CargoDAO {
    
    public void addCargo(Cargo cargo) throws SQLException {
        String sql = "INSERT INTO Cargos (nome, descricao) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cargo.getNome());
            stmt.setString(2, cargo.getDescricao());
            stmt.executeUpdate();
        }
    }
    
}
