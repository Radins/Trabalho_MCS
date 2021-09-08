<%-- 
    Document   : listarJogos
    Created on : Aug 26, 2021, 6:40:49 PM
    Author     : radins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import= "model.*" %>

<jsp:useBean class="model.DAOJogo" id ="d" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Jogos</title>
    </head>
    <body>
        <h1>Jogos</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Excluir</th>
                    <th>Alterar</th>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th>Gênero</th>
                </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Jogo> arrayJogos = d.pesquisar("SELECT * FROM jogos");
                for(Jogo j : arrayJogos){
                
            %>
                
                <tr>
                    <td><a href="/WebApplication2/SvJogo?ACAO=EXCLUIR&id=<%=j.getCod_jogo()%>"> X </a></td>
                    <td><a href="alterarJogo.jsp?id=<%=j.getCod_jogo() %>"> X </a></td>
                    <td><%=j.getNome()%></td>
                    <td><%=j.getPreco()%></td>
                    <td><%=j.getGenero()%></td>                  
                </tr>
            <%
                }
            %>
                
            </tbody>
        </table>
    </body>
</html>
