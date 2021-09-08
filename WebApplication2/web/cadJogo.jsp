<%-- 
    Document   : cadCoontato
    Created on : Aug 2, 2021, 9:27:35 PM
    Author     : ferrasa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Jogos - Cadastro </title>
    </head>
    <body>
        
          <a href="/WebApplication2/user_home.jsp?id=<%=request.getParameter("idUser")%>" target="_self">
            <img width="40 " height="40 " src="Images/voltar.png " alt=" ">
        </a>      
        
        
        <div id="login-container">
            <img src="Images/logo.jfif" width="100px">
            <form action="/WebApplication2/SvJogo" method="POST">
            <label>Nome</label>
            <input type="text" name="nome" value="" /><br>
            <label>Preço</label>
            <input type="text" name="preco" value="" /><br>
            <label>Genero</label>
            <input type="text" name="genero" value="" /><br>
            <label>Descrição</label>
            <input type="text" name="descricao" value="" /><br>
            <label>Desenvolvedor</label>
            <input type="text" name="desenvolvedor" value="" /><br>
            
            
            <input type="hidden" name="ACAO" value="INSERIR"/><br>
            <input type="hidden" name="idUser" value="<%= request.getParameter("idUser") %>"/><br>
            <input type="submit" value="Cadastrar"/>
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
nav ul {
    list-style: none;
    align-items: center;
}
    </style>
</html>
