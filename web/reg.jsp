<%-- 
    Document   : reg
    Created on : 5/09/2016, 01:09:58 AM
    Author     : wxjoy
--%>
<%@page import="java.sql.*" %>
<%@page import="com.conexion.Pais"  %>
<%@page import="java.util.ArrayList" %>
<%@include file="WEB-INF/jspf/val_l.jspf" %>
<%val_user(session,response);%>
<%@page contentType="text/html; charset=ISO-8859-1"%>

<html>
    <head>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <title>Registrarse</title>
    </head>
    <body rol="document">
        <%@include file="WEB-INF/jspf/menup.jspf" %>
        <div class="container theme-showcase" role="main">
            <br>
            <div class="jumbotron">
                <h2>Registrar Usuario</h2>
                <form method="post" action="/Apuestas/RegUser">
                    <table cellpadding="5" >
                        <tr>
                            <td>Nombre</td>
                            <td><input name="nombre" type="text" maxlength="50" required></td>
                        </tr>
                        <tr>
                            <td>Fecha de Nacimiento</td>
                            <td>
                                <input name="fdn" type="date" required 
                                       placeholder="dd/mm/aaaa" pattern="\d{2}/\d{2}/\d{4}">
                            </td>
                        </tr>
                        <tr>
                            <td>Correo</td>
                            <td><input name="correo" type="email" required></td>
                        </tr>
                        <tr>
                            <td>Pais</td>
                            <td><%=getPaises()%></td>
                        </tr>
                        <tr>
                            <td>Pagar</td>
                            <td>
                                <label>
                                    <input required checked type="radio" value="Si" name="pago"> Si
                                </label><br>
                                <label>
                                    <input type="radio" name="pago" value="No"> No
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>Clave</td>
                            <td><input name="clave" type="Password" placeholder="123456" required> </td>
                        </tr>
                        <tr>
                            <td>Reingresar<br>clave</td>
                            <td><input name="reclave" type="Password" required placeholder="123456"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input class="btn btn-success" type="submit" value="Aceptar">
                                <input class="btn btn-danger" type="reset" value="Cancelar">
                            </td>
                        </tr>
                    </table>
                </form>
                <%
                    Object o = session.getAttribute("error");
                    if(o!=null){
                        session.removeAttribute("error");
                %>
                <br>
                <br>
                <div class="alert alert-danger" role="alert">
                    <strong>Error: </strong>No se ha podido registrar su usuario<br>
                    <%=o.toString()%>
                </div>
                <% } %>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/scripts.jspf" %>
    </body>
</html>

<%!
private String getPaises(){
    StringBuffer sb = new StringBuffer();
    Pais p = new Pais();
    ArrayList<String> paises = p.getPaises();
    sb.append("<select name=\"pais\">");
    if(p!=null){
        for(int i = 0; i< paises.size();i++){
            sb.append("\t<option>")
                .append(paises.get(i))
                .append("</option>\n");
        }
    }else{
        sb.append("\t<option>")
            .append("En construccion")
            .append("</option>\n");
    }

    sb.append("</select>");
    return sb.toString();
}
%>