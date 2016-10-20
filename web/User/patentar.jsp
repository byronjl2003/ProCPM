<%-- 
    Document   : patentar
    Created on : 19/10/2016, 10:08:04 AM
    Author     : wxjoy
--%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf" %>
        <title>JSP Page</title>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main" class="container theme-showcase">
            <br>
            <div class="jumbotron">
                <h1>Hello World!</h1>
                <form>
                    <select>
                        <option>Uno</option>
                        <option>dos</option>
                    </select>
                </form>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf" %>
    </body>
</html>
