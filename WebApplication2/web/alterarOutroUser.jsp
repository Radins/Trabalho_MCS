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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Alterar usuário</title>
    </head>
        <%
        String id = request.getParameter("currentId");
        String alterId = request.getParameter("alterId");
        
        User i = d.GetById(Integer.parseInt(alterId));
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
        <div id="login-container">
            <img src="Images/logo.jfif" width="100px">
            <h1>Alterar usuário</h1>
            <form action="/WebApplication2/SvUser" method="POST">
                <label for="user">Usuário</label>
                <input type="usuario" name="user" id="usuario" placeholder="Usuario" autocomplete="off" value="<%= i.getUsername() %>">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="email" autocomplete="off" value="<%= i.getEmail() %>" />
                
                <label for="password">Senha</label>
                <input type="password" name="password" id="password" placeholder="Senha" value="<%= i.getPassword() %>">
               
                ADM:<input type="checkbox" name="adm" id="adm" placeholder="adm" autocomplete="off" value="true" <%= d.IsChecked(i.isAdm()) %>>
                <input type="hidden" name="ACAO" value="ALTERAR" />
                <input type="hidden" name="cod" value="<%= i.getCod_user()%>" />
                <input type="hidden" name="currentId" value="<%=id%>" />
                <input type="submit" value="Alterar" />
            </form>
        </div>
         

                
    </body>
    
    <style>
     
        

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Helvetica;
    color: white;
    border: none;
}

body {
    background-image: url('Images/fundo.png');
}

h1 {
    font-family: 'Orbitron', sans-serif;
}

textarea:focus,
input:focus {
    outline: none;
}

#login-container {
    box-shadow: 6px 6px 6px 6px rgba(255, 255, 255, 0.137);
    background-color: #0a0a0a;
    margin-left: auto;
    margin-right: auto;
    width: 400px;
    padding: 20px 30px;
    margin-top: 10vh;
    border-radius: 10px;
    text-align: center;
    position: relative;
    top: 100px;
}

form {
    margin-top: 30px;
    margin-bottom: 40px;
}

label,
input {
    display: block;
    width: 100%;
    text-align: left;
}

label {
    font-family: 'Orbitron', sans-serif;
    font-weight: bold;
    font-size: 20px;
}

input {
    font-family: 'Orbitron', sans-serif;
    background-color: #0a0a0a;
    border-bottom: 2px solid #ffffff;
    padding: 10px;
    font-size: 1rem;
    margin-bottom: 20px;
}

input:focus {
    transition: .7s;
    border-bottom: 2px solid #ffc01277;
}

input[type="submit"] {
    text-align: center;
    text-transform: uppercase;
    border: none;
    height: 40px;
    border-radius: 20px;
    margin-top: 30px;
    cursor: pointer;
    color: #FFF;
    background-color: #140933;
    font-weight: bold;
}

input[type="submit"]:hover {
    box-shadow: 2px 2px 2px .5px rgba(255, 255, 255, 0.137);
    color: orange;
    transition: 1s;
}

input::placeholder {
    color: purple;
}

.topo {
    font-size: 20px;
    background-image: url("Images/gradient.png");
    position: fixed;
    top: 0px;
    width: 100%;
    height: 45px;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
}

nav {
    display: inline-block;
}

nav ul {
    
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
