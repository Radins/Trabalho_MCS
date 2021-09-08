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
<jsp:useBean class="model.DAOUser" id ="a" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Jogos</title>
    </head>
    <%
        String id = request.getParameter("id");
        
        User i = a.GetById(Integer.parseInt(id));
    %>
    <body>
        <div class="topo">
            <nav id="aba">
                <ul>
                    <li><a href="/WebApplication2/user_home.jsp?id=<%=id%>">Home</a></li>
                    <li><a href="/WebApplication2/loja.jsp?id=<%=id%>">Loja</a></li>
                    <li><a href="/WebApplication2/alterarUser.jsp?id=<%=id%>">Editar Perfil</a></li>
                    <li><a href="/WebApplication2/gerenciarJogos.jsp?id=<%=id%>">Gerenciar Jogos</a></li>
                    <li><a href="/WebApplication2/gerenciarUser.jsp?id=<%=id%>"">Gerenciar Pefirs</a></li>
                </ul>
            </nav>
        </div>
        <table border = "1px">
            <thead>
                <tr>
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
    </body>
    <style>
body {
    background-image: url('Images/fundo.png');
    background-size: cover;
    background-position-y: -200px;
}
table{
    margin: 5% auto;
    width: 100%;
    color: #C6C6C6;
    box-shadow: 3px 3px 3px rgb(92, 114, 173), -3px -3px 3px rgb(21, 29, 53);
    position: relative;
    top: 100px;
    text-align: center;
}

th {
  font-family: Arial;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  padding: 1%;
  font-size: 22px;
  font-weight: 700px;
  color: white;
  background: #0B0029;
}

td {
    
  padding: 2% 1%;
  font-size: 20px;
  width: 20%;
}

td:nth-child(1) {
  font-family: 'Orbitron', sans-serif;
  font-weight: bold;
  text-align: left;
  text-transform: uppercase;
  text-shadow: 1px 1px 5px black;
  color: #C6C6C6;
}


tr:nth-child(odd) {
    
  background: rgb(48, 57, 82);
}

tr:nth-child(even) {
  background: rgb(53, 66, 100);
}

tr:active {
  background-color: rgb(15, 107, 43);
}

.topo {
    font-size: 20px;
    background-image: url("Images/gradient.png");
    position: fixed;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 45px;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
}

nav {
    margin-top: -10px;
    display: inline-block;
}

nav ul {
    
    text-align: center;
    font-family: Arial;
    font-weight: bold;
    text-transform: uppercase;
}


nav ul li {
    border-color: rgb(255, 255, 255);
    text-align: center;
    display: inline-block;
}

nav ul li a {
    border-color: rgb(255, 255, 255);
    color: white;
    padding-top: 5px;
    padding-bottom: 8px;
    padding-left: 25px;
    padding-right: 25px;
    text-decoration: none;
}
a:hover {
    transition: 1s;
    color: rgb(240, 90, 30);
}
    </style>
</html>
