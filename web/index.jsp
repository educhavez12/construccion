<%-- 
    Document   : index
    Created on : 15 jun 2025, 22:39:50
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://i.pinimg.com/736x/34/09/bb/3409bb12ed05f0a8bf17832180d976c1.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .contenido {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            width: 300px;
        }

        h1 {
            margin-bottom: 20px;
        }

        input, button {
            padding: 10px;
            margin: 10px 0;
            width: 100%;
            border-radius: 5px;
            border: none;
            font-size: 16px;
        }

        input {
            background-color: #f0f0f0;
            color: #000;
        }

        button {
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .registro {
            margin-top: 15px;
        }

        .registro a {
            color: #ffc107;
            text-decoration: none;
        }

        .registro a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    <div class="contenido">
        
        <%
        String error = request.getParameter("error");
        if ("true".equals(error)) {
        %>
            <div style="color: red; background: #ffdada; padding: 10px; border-radius: 5px; margin-bottom: 15px;">
                ⚠️ Usuario o contraseña incorrectos.
            </div>
        <%
            }
        %>
        <h1>Iniciar Sesión</h1>

        <form method="post" action="LoginUsuario">
        <input type="text" name="username" placeholder="Nombre de usuario" required>
        <input type="password" name="password" placeholder="Contraseña" required>
        <button type="submit">Acceder</button>
        </form>


        <div class="registro">
            ¿No tienes cuenta? <a href="registro.jsp">Registrarse</a>
        </div>
    </div>

</body>
</html>
