<%-- 
    Document   : perfil
    Created on : 13 jun 2025, 09:21:08
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelo.UsuarioDAO, modelo.Usuario" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>

<%
    HttpSession sesion = request.getSession(false);
    String username = (String) sesion.getAttribute("usuario");

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = dao.buscarPorUsername(username);

    if (u == null) {
        out.println("<p>Usuario no encontrado.</p>");
        return;
    }
%>
<html>
    <head>
    <title>Perfil del Usuario</title>
    <style>
        body { 
             font-family: Arial; 
            padding: 35px; 
            background-image: url('https://i.pinimg.com/736x/34/09/bb/3409bb12ed05f0a8bf17832180d976c1.jpg');
            background-size: cover;           /* <-- cubre todo el fondo */
            background-repeat: no-repeat;     /* <-- no se repite */
            background-position: center;      /* <-- centrado */
            min-height: 100vh;
        }
        .perfil { 
            background: white; 
            padding: 20px; 
            border-radius: 10px; 
            max-width: 500px; 
            margin: auto; 
        }
        h2 { 
            color: #333; 
        }
        p { 
            font-size: 16px; 
        }
        button {
            background-color: #007bff;
            color: white;
            margin-top: 15px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <body>
        <div class="perfil">
            <h2>👤 Mi Perfil</h2>
            <p><strong>Nombres:</strong> <%= u.getNombres() %></p>
            <p><strong>Apellidos:</strong> <%= u.getApellidos() %></p>
            <p><strong>Correo:</strong> <%= u.getCorreo() %></p>
            <p><strong>Edad:</strong> <%= u.getEdad() %></p>
            <p><strong>Género:</strong> <%= u.getGenero() %></p>
            <p><strong>Usuario:</strong> <%= u.getUsername() %></p>

            <form action="panel.jsp" method="get">
                <button type="submit">Volver al panel</button>
            </form>
        </div>
    </body>
</html>
