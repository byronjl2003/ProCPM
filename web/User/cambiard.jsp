<%-- 
    Document   : cambiard
    Created on : 7/10/2016, 10:04:10 PM
    Author     : wxjoy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.conexion.Usuario"%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session, response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf" %>
        <title>Cambiar Datos</title>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main"  class="container theme-showcase">
            <br>
            <div class="jumbotron">
                <h1>Cambiar Datos</h1>
                <%
                    int codU =(int) session.getAttribute("id");
                    Usuario u = new Usuario();
                    u.cargarDatos(codU);
                    session.setAttribute("mail", u.getCorreo());
                %>
                <form method="post" action="/ProCPM/ActDatosU" >
                    <table>
                        <tr>
                            <td>Nombre</td>
                            <td>
                                <input name="uNombre" type="text" value="<%=u.getNombre()%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Correo</td>
                            <td>
                                <input name="uCorreo" type="text" value="<%=u.getCorreo()%>" required>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="Aceptar" class="btn btn-success">
                                <input type="reset" value="Cancelar" class="btn btn-danger">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <br>
            <br>
            <%
                Object a = session.getAttribute("error");
                String cad;
                if(a!=null){
                    session.removeAttribute("error");
                    cad = (String) a;
            %>
            <div class="alert alert-danger" role="alert">
                <strong>Error:</strong> No se actualizaron sus datos
                <br>
                <%=cad%>
            </div>
            <%
                }
                a=session.getAttribute("hecho");
                if(a!=null){
                    session.removeAttribute("hecho");
                    cad = (String)a;
            %>
            <div class="alert alert-success" role="alert">
                <strong>Hecho:</strong> Se Actualizaron los datos
                <br>
            </div>     
            <%
                }
            %>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf" %>
    </body>
</html>