
package control;

import java.io.IOException;
import static java.lang.Float.parseFloat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

public class SvJogo extends HttpServlet {
    private DAOJogo dc;
    
    @Override
    public void init(){
        dc = new DAOJogo();
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String ACAO, sNome, sPreco, sGenero, sDesenvolvedor, sDescricao, sIdUser;
        
        ACAO = request.getParameter("ACAO");
        
        sNome = request.getParameter("nome");
        sPreco = request.getParameter("preco");
        sGenero = request.getParameter("genero");
        sDesenvolvedor = request.getParameter("desenvolvedor");
        sDescricao = request.getParameter("descricao");
        sIdUser = request.getParameter("idUser");
        
        if(ACAO.equalsIgnoreCase("INSERIR")){
            Jogo j = new Jogo();
        
            j.setNome(sNome);
            j.setPreco(parseFloat(sPreco));
            j.setGenero(sGenero);
            j.setDesenvolvedor(sDesenvolvedor);
            j.setDescricao(sDescricao);
            
            int id = dc.inserir(j);
            response.sendRedirect("gerenciarJogos.jsp?id="+sIdUser);
            
        }else if(ACAO.equalsIgnoreCase("EXCLUIR")){
            String id = request.getParameter("id");
            
            boolean result = dc.excluir(Integer.parseInt(id));
            if(result)
                response.sendRedirect("gerenciarJogos.jsp?id="+sIdUser);
            
        }else if(ACAO.equalsIgnoreCase("ALTERAR")){
            Jogo j = new Jogo();
            
            String scod = request.getParameter("cod");
            
            j.setCod_jogo(Integer.parseInt(scod));
            j.setNome(sNome);
            j.setPreco(parseFloat(sPreco));
            j.setGenero(sGenero);
            j.setDesenvolvedor(sDesenvolvedor);
            j.setDescricao(sDescricao);
            
            boolean result = dc.alterar(j);
            if(result)
                response.sendRedirect("gerenciarJogos.jsp?id="+sIdUser);            
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
