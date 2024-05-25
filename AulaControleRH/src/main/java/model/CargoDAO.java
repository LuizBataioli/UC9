package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;

public class CargoDAO {

    public void addCargo(Cargo cargo) throws SQLException {
        String sql = "INSERT INTO Cargos (nome, descricao) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cargo.getNome());
            stmt.setString(2, cargo.getDescricao());
            stmt.executeUpdate();
        }
    }

    public List<Cargo> searchCargosByName(String name) throws SQLException {
        String sql = "SELECT * FROM cargos WHERE nome LIKE ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();

            List<Cargo> cargos = new ArrayList<>();
            while (rs.next()) {
                Cargo cargo = new Cargo();
                cargo.setId(rs.getInt("id"));
                cargo.setNome(rs.getString("nome"));
                cargo.setDescricao(rs.getString("descricao"));
                cargos.add(cargo);
            }
            return cargos;

        }

    }

    public void updateCargo(Cargo cargo) throws SQLException {
        String sql = "UPDATE Cargos SET nome = ?, descricao = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cargo.getNome());
            stmt.setString(2, cargo.getDescricao());
            stmt.setInt(3, cargo.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteCargo(int id) throws SQLException {
        String sql = "DELETE FROM Cargos Where id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

}
