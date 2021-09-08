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
public class DAOJogo {
    private Conexao conection;
    
    public DAOJogo(){
        conection = new Conexao();

    }
    
    public int inserir(Jogo c){
        int r=0;
        
        if (c != null)
            r = conection.inserir("INSERT INTO jogos(nome, preco, genero, desenvolvedor, descricao) VALUES ('"+c.getNome()+"', '"+c.getPreco()+"', '"+c.getGenero()+"', '"+c.getDesenvolvedor()+"', '"+c.getDescricao()+"')");
        
        return r;
    }
    
    public ArrayList<Jogo> pesquisar(String query){
        
        ArrayList<Jogo> v = new ArrayList<>();
        ResultSet r = conection.pesquisar(query);
        
        try{
            while(r.next()){
                Jogo j = new Jogo();
                
                j.setCod_jogo(r.getInt("cod_jogo"));
                j.setGenero(r.getString("genero"));
                j.setNome(r.getString("nome"));
                j.setPreco(r.getFloat("preco"));
                j.setDesenvolvedor(r.getString("desenvolvedor"));
                j.setDescricao(r.getString("descricao"));
                
                v.add(j);
            }
            
        }catch(SQLException ex){
            System.out.println("Erro fazendo listagem dos jogos, " + ex);
            return null;
        }
        
        return v;
    }
    
    public boolean excluir(int id){
        int r=0;
        
        r = conection.excluir("DELETE FROM jogos WHERE cod_jogo = " + id);    
              
        if(r<=0)
            return false;
        return true;
    }
    
    public Jogo GetById(int id){
        ResultSet r = conection.pesquisar("SELECT * FROM jogos WHERE cod_jogo = " + id);
        
        try{
            if(r.next()){
                Jogo j = new Jogo();
                
                j.setCod_jogo(r.getInt("cod_jogo"));
                j.setGenero(r.getString("genero"));
                j.setNome(r.getString("nome"));
                j.setPreco(r.getFloat("preco"));
                j.setDesenvolvedor(r.getString("desenvolvedor"));
                j.setDescricao(r.getString("descricao"));
                
                return j;
            }
            
        }catch(SQLException ex){
            System.out.println("Erro na função 'GetById', " + ex);
        }
        return null;
    }
    
    public boolean alterar(Jogo j){
        int r;
        
        r = conection.atualizar("UPDATE public.jogos SET nome='"+j.getNome()+"', preco='"+j.getPreco()+"', genero='"+j.getGenero()+"', desenvolvedor='"+j.getDesenvolvedor()+"', descricao='"+j.getDescricao()+"' WHERE cod_jogo="+j.getCod_jogo());
        
        if(r<=0)
            return false;
        return true;

    }
}
