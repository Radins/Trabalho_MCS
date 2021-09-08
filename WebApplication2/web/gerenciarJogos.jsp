<%-- 
    Document   : listarJogos
    Created on : Aug 26, 2021, 6:40:49 PM
    Author     : radins
--%>

<%@page import="model.Jogo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import= "model.*" %>

<jsp:useBean class="model.DAOJogo" id ="d" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
            <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Jogos</title>
    </head>
    <body>
        <a href="/WebApplication2/user_home.jsp?id=<%=request.getParameter("id")%>" target="_self">
            <img width="40 " height="40 " src="Images/voltar.png " alt=" ">
        </a>
        <table border="1">
            <thead>
                <tr>
                    <th>Excluir</th>
                    <th>Alterar</th>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Preço</th>
                    <th>Gênero</th>
                    <th>Desenvolvedor</th>
                    <th>Descrição</th>
                </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Jogo> arrayJogos = d.pesquisar("SELECT * FROM jogos");
                for(Jogo j : arrayJogos){
                
            %>
                
                <tr>
                    <td><a href="/WebApplication2/SvJogo?ACAO=EXCLUIR&id=<%=j.getCod_jogo()%>&idUser=<%=request.getParameter("id")%>"> X </a></td>
                    <td><a href="alterarJogo.jsp?idJogo=<%=j.getCod_jogo() %>&idUser=<%=request.getParameter("id")%>"> X </a></td>
                    <td><%=j.getCod_jogo()%></td>
                    <td><%=j.getNome()%></td>
                    <td><%=j.getPreco()%></td>
                    <td><%=j.getGenero()%></td>
                    <td><%=j.getDesenvolvedor()%></td>
                    <td><%=j.getDescricao()%></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
            <div class="teste">
            <td><a href="/WebApplication2/cadJogo.jsp?idUser=<%=request.getParameter("id")%>">Adicionar novo jogo </a></td>
            </div>
            </body>
    
    <style>
.teste{
    font-family: 'Orbitron', sans-serif;
    background-color: #0a0a0a;
    width: 25%;
    text-align: center;
    border-radius: 20px;
    border-bottom: 2px solid #ffffff;
    padding: 10px;
    font-size: 1rem;
    margin-bottom: 20px;
}   

.teste:hover{
    color: purple;
}


body {
    background-image: url("Images/fundo.png");
} 
table{
    margin: 5% auto;
    width: 100%;
    color: #C6C6C6;
    box-shadow: 3px 3px 3px rgb(92, 114, 173), -3px -3px 3px rgb(21, 29, 53);
    text-align: center;
}

th {
  font-family: Arial;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  font-size: 20px;
  color: white;
  background: #0B0029;
  
}

td {
   
  font-size: 20px;
  
}

tr:nth-child(odd) {
    
  background: rgb(48, 57, 82);
}

tr:nth-child(even) {
  background: rgb(53, 66, 100);
}

a{
    color: white;
    text-decoration: none;
    font-size: 20px;
    
}

tr:active {
  background-color: rgb(15, 107, 43);
}
    </style>
</html>
