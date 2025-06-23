<%-- 
    Document   : login
    Created on : 9 jun 2025, 21:37:56
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Inicio de Sesión</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
        }
        .login-container {
            width: 400px;
            margin: 60px auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            margin-top: 20px;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        <form action="LoginUsuario" method="post">
            <label>Nombre de Usuario:</label>
            <input type="text" name="username" required>

            <label>Contraseña:</label>
            <input type="password" name="password" required>

            <button type="submit">Ingresar</button>
        </form>
        <% if (request.getParameter("error") != null) { %>
        <script>alert("Usuario o contraseña incorrectos");</script>
        <% } else if (request.getParameter("ok") != null) { %>
        <script>alert("Sesión correcta");</script>
        <% } %>
        
        <form action="index.jsp" method="get">
            <button type="submit" style="margin-top:10px; padding:8px 20px; background:#007bff; color:white; border:none; border-radius:4px;">
                Volver al inicio
            </button>
        </form>
    </div>
</body>
</html>
