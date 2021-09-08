/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.Conexao;

/**
 *
 * @author radins
 */
public class DAOUser {
    
    private Conexao conection;
    
    public DAOUser(){
        conection = new Conexao();
    }
    
    public int insert(User user){
        int r=0;
        
        if(user!=null){
            r = conection.inserir("INSERT INTO usuario (username, email, adm, password) VALUES ('"+user.getUsername()+"', '"+user.getEmail()+"', '"+user.isAdm()+"', '"+user.getPassword()+"')");
        }
        return r;
    }
    
    public ArrayList<User> search(String query) throws SQLException{
        
        ArrayList<User> userList = new ArrayList<>();
        ResultSet result = conection.pesquisar(query);
        
        try{
            while(result.next()){
                User user = new User();
                
                user.setCod_user(result.getInt("cod"));
                user.setUsername(result.getString("username"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setAdm(result.getBoolean("adm"));
                
                userList.add(user);                
            }
        }catch(SQLException ex){
            System.out.println("Error fazendo a listagem dos usuarios, " + ex);
            return null;
        }
        return userList;
    }
    
    public boolean excluir(int id){
        int rows=0;
        
        rows = conection.excluir("DELETE FROM usuario WHERE cod = " + id);    
              
        if(rows<=0)
            return false;
        return true;
    }
    
    public User GetById(int id){
        ResultSet result = conection.pesquisar("SELECT * FROM usuario WHERE cod = " + id);
        
        try{
            if(result.next()){
                User user = new User();
                
                user.setCod_user(result.getInt("cod"));
                user.setUsername(result.getString("username"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setAdm(result.getBoolean("adm"));
                
                return user;
            }
            
        }catch(SQLException ex){
            System.out.println("Erro na função 'GetById', " + ex);
        }
        return null;
    }
    
    public boolean alterar(User user){
        int rows;
        String query = "UPDATE public.usuario SET username='"+user.getUsername()+"', email='"+user.getEmail()+"', password='"+user.getPassword()+"', adm='"+user.isAdm()+"' WHERE cod="+user.getCod_user();

        rows = conection.atualizar(query);
        
        if(rows<=0)
            return false;
        return true;

    }
    
    public String ReturnXIfTrue(boolean x){
        if(x)
            return "X";
        return "";
    }
    
    public String IsChecked(boolean x){
        if(x)
            return "checked";
        return "";
    }
    
    public Integer login(String user, String password) throws SQLException{
        String query = "SELECT * FROM public.usuario WHERE username='"+user+"' AND password='"+password+"'";
        
        ResultSet result = conection.pesquisar(query);
        
        if(result.next()){
            return result.getInt("cod");
        }
        
        return null;
    }
}
