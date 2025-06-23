<%-- 
    Document   : editar
    Created on : 11 jun 2025, 16:14:58
    Author     : EDUARDO
--%>

<%@ page import="modelo.MensajeDAO, modelo.Mensaje" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    MensajeDAO dao = new MensajeDAO();
    Mensaje mensaje = null;
    for (Mensaje m : dao.listarMensajes()) {
        if (m.getId() == id && m.getUsuario().equals(usuario)) {
            mensaje = m;
            break;
        }
    }

    if (mensaje == null) {
        response.sendRedirect("panel.jsp");
        return;
    }
%>

<html>
<head>
    <title>Editar Mensaje</title>
</head>
<body>
    <h2>Editar mensaje</h2>
    <form action="EditarMensaje" method="post">
        <input type="hidden" name="id" value="<%= mensaje.getId() %>">
        <textarea name="contenido" rows="5" cols="50"><%= mensaje.getContenido() %></textarea><br><br>
        <button type="submit">Guardar cambios</button>
        <a href="panel.jsp">Cancelar</a>
    </form>
</body>
</html>