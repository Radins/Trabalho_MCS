/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import model.User;
import model.DAOUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvUser extends HttpServlet {
    private DAOUser dc;
    
    @Override
    public void init(){
        dc = new DAOUser();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action, sUser, sEmail, sAdm, sPassword, sCurrentId;
        
        action = request.getParameter("ACAO");
        
        sUser = request.getParameter("user");
        sEmail = request.getParameter("email");
        sAdm = request.getParameter("adm");
        sPassword = request.getParameter("password");
        sCurrentId = request.getParameter("currentId");
        
        
        if(action.equalsIgnoreCase("INSERIR")){
            User user = new User();
            
            user.setUsername(sUser);
            user.setEmail(sEmail);
            user.setAdm(Boolean.parseBoolean(sAdm));
            user.setPassword(sPassword);
            
            int cod = dc.insert(user);
            if (cod == 0){
                response.sendRedirect("cadUser.jsp?response=failure" );
            }else{
                response.sendRedirect("user_home.jsp?id="+cod);
            }
            
        }else if(action.equalsIgnoreCase("EXCLUIR")){
            String id = request.getParameter("alterId");
            
            boolean result = dc.excluir(Integer.parseInt(id));
            if(result){
                response.sendRedirect("gerenciarUser.jsp?id="+sCurrentId);
            }
            
        }else if(action.equalsIgnoreCase("ALTERAR")){
            User user = new User();
            
            String sCod = request.getParameter("cod");
            
            user.setCod_user(Integer.parseInt(sCod));
            user.setUsername(sUser);
            user.setEmail(sEmail);
            user.setAdm(Boolean.parseBoolean(sAdm));
            user.setPassword(sPassword);
            boolean result = dc.alterar(user);
            if(result){
                if(sCurrentId != null){
                    response.sendRedirect("gerenciarUser.jsp?id="+sCurrentId);
                }else{
                    response.sendRedirect("user_home.jsp?id=" + request.getParameter("cod"));
                }
            }
            
            
                  
            
        }else if(action.equalsIgnoreCase("LOGIN")){
            
            Integer result = dc.login(sUser, sPassword);
            if(result!=null)
                response.sendRedirect("user_home.jsp?id=" + result);
            else{
                response.addHeader("response", "failure");
                response.sendRedirect("login.jsp?response=failure" );
            }
        }        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SvUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SvUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
