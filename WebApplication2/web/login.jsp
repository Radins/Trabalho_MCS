<%-- 
    Document   : login
    Created on : Aug 29, 2021, 9:43:33 AM
    Author     : radins
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div id="login-container">
        <img src="Images/logo.jfif" width="100px">
        <h1>Login</h1>
        <form action="/WebApplication2/SvUser" method="POST">
            <label for="usuario">Usuário</label>
            <input type="usuario" name="user" id="usuario" placeholder="Digite seu usuario" autocomplete="off">
            <label for="password">Senha</label>
            <input type="password" name="password" id="password" placeholder="Digite sua senha">
            
            <input type="hidden" name="ACAO" value="LOGIN"/><br>
            <input type="submit" value="Login"/>
        <nav>
            <ul>
                <li><a href = "/WebApplication2">Voltar</a></li>
            </ul>
        </nav>
           </div>
        </form>

        <% 
            String resp = request.getParameter("response");
            
            if (resp != null){
        %>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script>
                swal({
                  title: "Erro!",
                  text: "Senha ou usuário incorreto!",
                  icon: "error",
                  button: "Close"
                });
            </script>
        <%
            }
        %>
    </body>
    <style>
        
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Helvetica;
    color: #ffffff;
    border: none;
}
 body {
    background-image: url("Images/fundo.png");
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
    margin-left: 150px;
    position: relative;
    top: 100px;
    left: 200px;
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
    font-size: .8rem;
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
    color: #58585891;
}

nav ul {
    list-style: none;
    align-items: center;
}


    </style>
</html>