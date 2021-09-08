<%-- 
    Document   : alterarUser
    Created on : Aug 28, 2021, 4:16:11 PM
    Author     : radins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="model.User"%>

<jsp:useBean class="model.DAOUser" id ="d" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
        <%
        String id = request.getParameter("id");
        
        User i = d.GetById(Integer.parseInt(id));
    %>
    <body>
        <form action="/WebApplication2/SvUser" method="POST">
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
        </form>
    </body>
    <style>
body {
    background-image: url("Images/fundo.png");
    width: 100%;
    height: 100%;
    margin: 0;
}
.topo {
    font-size: 20px;
    background-image: url("Images/gradient.png");
    position: fixed;
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
