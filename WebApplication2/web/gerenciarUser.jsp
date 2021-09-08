<%-- 
    Document   : listarJogos
    Created on : Aug 26, 2021, 6:40:49 PM
    Author     : radins
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import= "model.*" %>

<jsp:useBean class="model.DAOUser" id ="d" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Usuário</title>
    </head>
    <body>       
        <a href="/WebApplication2/user_home.jsp?id=<%=request.getParameter("id")%>" target="_self">
            <img width="40 " height="40 " src="Images/voltar.png " alt=" ">
        </a>
        
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User</th>
                    <th>Email</th>  
                    <th>Senha</th>
                    <th>ADM</th>
                    <th>Excluir</th>
                    <th>Alterar</th>
                </tr>
            </thead>
            <tbody>
            <%
                ArrayList<User> arrayUser = d.search("SELECT * FROM usuario");
                for(User user : arrayUser){
                
            %>
                <tr>
                    <td> <%=user.getCod_user()%> </td>
                    <td> <%=user.getUsername()%> </td>
                    <td> <%=user.getEmail() %> </td>
                    <td> <%=user.getPassword() %></td>
                    <td> <%=d.ReturnXIfTrue(user.isAdm())%></td>
                    <td><a href="/WebApplication2/SvUser?ACAO=EXCLUIR&alterId=<%=user.getCod_user()%>&currentId=<%=request.getParameter("id")%>"> X </a></td>
                    <td><a href="alterarOutroUser.jsp?alterId=<%=user.getCod_user()%>&currentId=<%=request.getParameter("id")%>"> X </a></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </body>
    <style>
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
