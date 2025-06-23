<%-- 
    Document   : panel
    Created on : 9 jun 2025, 21:44:19
    Author     : EDUARDO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="modelo.MensajeDAO, modelo.Mensaje" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession(false);
    String usuario = (String) sesion.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Si se envió un nuevo mensaje desde el formulario
    String nuevoMensaje = request.getParameter("mensaje");
    if (nuevoMensaje != null && !nuevoMensaje.trim().isEmpty()) {
        Mensaje m = new Mensaje();
        m.setUsuario(usuario);
        m.setContenido(nuevoMensaje);

        MensajeDAO dao = new MensajeDAO();
        dao.guardarMensaje(m);
    }

    // Obtener todos los mensajes
    MensajeDAO dao = new MensajeDAO();
    List<Mensaje> mensajes = dao.listarMensajes();
%>
<html>
<head>
    <title>Panel del Foro</title>
    <style>
        .contenedor {
        display: flex;
        gap: 20px;
        }
        /* Columnas */
        .columna {
        padding: 20px;
        margin-top: 10px;
        box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        /* Izquierda: menú lateral */
        .izquierda {
            flex: 1;
            max-width: 200px;
            background-color: #e3f2fd; /* azul claro */
            border-radius: 10px;
        }
        /* Centro: publicaciones */
        .centro {
            flex: 2;
        }
        /* Derecha: tendencias o temas */
        .derecha {
            flex: 1;
            max-width: 250px;
            font-size: 14px;
            max-width: 250px;
            background-color: #f0faff; /* celeste muy suave */
            border-radius: 10px;
        }
        .derecha h4 {
            margin-bottom: 10px;
            color: #333;
        }
        .tema {
            font-weight: bold;
            margin-bottom: 8px;
        }
        button {
        background-color: #007bff;
        color: white;
        cursor: pointer;
        padding: 10px 15px;
        border: none;
        border-radius: 6px;
        margin-bottom: 10px;
         }

        button:hover {
            background-color: #0056b3;
        }
        
        textarea {
            width: 100%;
            height: 120px; /* puedes ajustar esto según te guste */
            padding: 10px;
            font-size: 15px;
            resize: vertical; /* permite redimensionar solo verticalmente */
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        
        .formulario label{
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Bienvenido, <%= usuario %></h2>

    <div class="contenedor">
        <!-- Menú lateral izquierdo -->
        <div class="columna izquierda">
            <form action="perfil.jsp" method="get">
                <button type="submit">Ver perfil</button>
            </form>
            <form action="CerrarSesion" method="post">
                <button type="submit">Cerrar sesión</button>
            </form>
        </div>

        <!-- Centro: formulario + mensajes -->
        <div class="columna centro">
            <div class="formulario">
                <form method="post" action="panel.jsp">
                    <label>Publicar un mensaje:</label><br>
                    <textarea name="mensaje" required></textarea><br>
                    <button type="submit">Publicar</button>
                </form>
            </div>

            <h3>Mensajes del foro:</h3>
            <%
                for (Mensaje m : mensajes) {
            %>
                <div class="mensaje">
                    <strong><%= m.getUsuario() %></strong> <em>(<%= m.getFecha() %>)</em>
                    <p><%= m.getContenido() %></p>
                    <% if (m.getUsuario().equals(usuario)) { %>
                        <form action="editar.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= m.getId() %>">
                            <button type="submit">Editar</button>
                        </form>
                        <form action="EliminarMensaje" method="post" style="display:inline;" onsubmit="return confirm('¿Eliminar este mensaje?');">
                            <input type="hidden" name="id" value="<%= m.getId() %>">
                            <button type="submit">Eliminar</button>
                        </form>
                    <% } %>
                </div>
            <%
                }
            %>
        </div>

        <!-- Columna derecha: noticias o temas -->
        <div class="columna derecha">
            <h4>Temas populares</h4>
            <div class="tema">#JavaWeb</div>
            <div class="tema">#NetBeans21</div>
            <div class="tema">#ProyectoFinal</div>
            <div class="tema">#ForoEstudiantil</div>
        </div>
    </div>
</body>
</html>
