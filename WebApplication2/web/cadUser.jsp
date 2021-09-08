<%-- 
    Document   : cadUser
    Created on : Aug 28, 2021, 2:45:09 PM
    Author     : radins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Usuário - Cadastro </title>
    </head>
    <body>
        <div id="login-container">
            <img src="Images/logo.jfif" width="100px">
        <form action="/WebApplication2/SvUser" method="POST">
            <label for="user">Usuário</label>
            <input type="usuario" name="user" id="usuario" placeholder="Usuario" autocomplete="off" value=""required>
            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="email" autocomplete="off" value="" required>
            <label for="password">Senha</label>
            <input type="text" name="password" id="password" placeholder="Senha" value="" required>
            
            <input type="hidden" name="adm" id="adm" value="false" >
            <input type="hidden" name="ACAO" value="INSERIR"/><br>
            <input type="submit" value="Cadastrar"/>
        <nav>
            <ul>
                <li><a href = "/WebApplication2">Voltar</a></li>
            </ul>
        </nav>
        </form>
        <% 
            String resp = request.getParameter("response");
            
            if (resp != null){
        %>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script>
                swal({
                  title: "Erro!",
                  text: "Usuário ou email já cadastrados!",
                  icon: "error",
                  button: "Close"
                });
            </script>
        <%
            }
        %>
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
nav ul {
    list-style: none;
    align-items: center;
}
    </style>
    
</html>
