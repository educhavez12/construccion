<%-- 
    Document   : registro
    Created on : 9 jun 2025, 16:18:40
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
        <link rel="stylesheet" href="css/estilos.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://i.pinimg.com/736x/34/09/bb/3409bb12ed05f0a8bf17832180d976c1.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            height: auto;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: black;
            padding: 40px 0; /* añade espacio arriba/abajo si quieres */
        }
        
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #003366; /* azul oscuro */
        }
        label {
            display: block;
            margin-top: 10px;
            text-align: left;
            font-weight: bold;
            color: #000;
        }
        input, select, button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: none;
            font-size: 15px;
        }
        input, select {
            background-color: #f0f0f0;
            color: #000;
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
        
        .mensaje-exito {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #d4edda;
            color: #155724;
            border: 2px solid #c3e6cb;
            padding: 20px 30px;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            z-index: 9999;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            animation: fadeOut 3s forwards 2s;
        }

        @keyframes fadeOut {
            to {
                opacity: 0;
                visibility: hidden;
            }
        }

      
    </style>
    </head>
    <body>
        <div class="contenedor">
        <h2>Registro de Usuario</h2>
        <form action="RegistrarUsuario" method="post">
            <label>Nombres:</label>
            <input type="text" name="nombres" required>

            <label>Apellidos:</label>
            <input type="text" name="apellidos" required>

            <label>Correo:</label>
            <input type="email" name="correo" required>

            <label>Edad:</label>
            <input type="number" name="edad" min="1" required>

            <label>Género:</label>
            <select name="genero" required>
                <option value="">--Seleccione--</option>
                <option value="Masculino">Masculino</option>
                <option value="Femenino">Femenino</option>
                <option value="Otro">Otro</option>
            </select>

            <label>Nombre de Usuario:</label>
            <input type="text" name="username" required>

            <label>Contraseña:</label>
            <input type="password" name="password" required>
            
            
            <button type="submit">Crear Cuenta</button>
            <!-- Mostrar alerta si fue exitoso -->
            <% if (request.getParameter("exito") != null) { %>
            <div class="mensaje-exito">
            <p>✅ Usuario creado correctamente</p>
            </div>
            <% } %>
        </form> 
        <form action="index.jsp" method="get">
            <button type="submit">Volver al inicio</button>
        </form>
    </div>
    </body>
</html>
