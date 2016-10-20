<%-- 
    Document   : TInicio
    Created on : 14/10/2016, 03:14:27 AM
    Author     : wxjoy
--%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf" %>
        <title>Inicio</title>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main" class="container theme-dropdown">
            <br>
            <div class="jumbotron">
                <h1>Hola!</h1>
                <h2><%=session.getAttribute("nombre")%></h2>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf"%>
    </body>
</html>
