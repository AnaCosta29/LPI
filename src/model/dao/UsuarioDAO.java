/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.bean.Usuario;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {
// criar cadastro
    public void create(Usuario u) {
        Connection con = ConnectionFactory.getConnection();

        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO cadastro(cpf,nome,dataNascimento,telefone,email,idTipoUsuario,senha )VALUES(?,?,?,?,?,?,?,?)");
            stmt.setInt(1, u.getCpf());
            stmt.setString(2, u.getNome());
            // stmt.setDate(3, u.getDataNascimento())
            stmt.setInt(4, u.getTelefone());
            stmt.setString(5, u.getEmail());
            stmt.setInt(6, u.getIdTipoUsuarios());
          
            stmt.setString(7, u.getSenha());

            stmt.execute();

            JOptionPane.showMessageDialog(null, "Salvo com sucesso!");
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    //listar 
    public List<Usuario> read() {

        Connection con = ConnectionFactory.getConnection();
        
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Usuario> cadas = new ArrayList<>();

        try {
            stmt = con.prepareStatement("SELECT * FROM cadastro");
            rs = stmt.executeQuery();

            while (rs.next()) {

                Usuario u = new Usuario();
                
                
               
               u.setEmail(rs.getInt("email"));
                u.setNome(rs.getString("nome"));
                u.setDate(rs.getString("dataNascimento"));
                u.setTelefone(rs.getInt("telefone"));
                
                u.setCpf(rs.getString("cpf"));
                u.setSexo(rs.getString("sexo"));
                 
                cadas.add(u);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }

        return cadas;

    }
}
