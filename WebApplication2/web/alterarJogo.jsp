<%-- 
    Document   : AlterarJogo
    Created on : Aug 28, 2021, 12:07:01 PM
    Author     : radins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="model.Jogo"%>

<jsp:useBean class="model.DAOJogo" id ="d" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Jogo</title>
    </head>
    <%
        String id = request.getParameter("idJogo");
        
        Jogo j = d.GetById(Integer.parseInt(id));
    %>
    <body>
        <div id="login-container">
        <!TODO <form action="/agenda/SvContato" method="POST">
        <form action="/WebApplication2/SvJogo" method="POST">
            <label>Nome</label>
            <input type="text" name="nome" value="<%= j.getNome() %>" /><br>
            <label>Preço</label>
            <input type="text" name="preco" value="<%= j.getPreco() %>" /><br>
            <label>Genero</label>
            <input type="text" name="genero" value="<%= j.getGenero() %>" /><br>
            <label>Desenvolvedor</label>
            <input type="text" name="desenvolvedor" value="<%= j.getDesenvolvedor() %>" /><br>
            <label>Descrição</label>
            <input type="text" name="descricao" value="<%= j.getDescricao() %>" /><br>
            
            <input type="hidden" name="ACAO" value="ALTERAR"/><br>
            <input type="hidden" name="cod" value="<%= j.getCod_jogo() %>"/><br>
            <input type="hidden" name="idUser" value="<%= request.getParameter("idUser") %>"/><br>
            <input type="submit" value="Alterar"/>
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
    width: 80%;
    padding: 20px 30px;
    margin-top: 10vh;
    border-radius: 10px;
    text-align: center;
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
