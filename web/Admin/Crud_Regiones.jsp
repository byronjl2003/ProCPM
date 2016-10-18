<%-- 
    Document   : Crud_Regiones
    Created on : 17/10/2016, 06:51:16 PM
    Author     : byron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../WEB-INF/jspf/val_a.jspf" %>
<% valAdmin(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headera.jspf" %>
        <title>Inicio-Admin</title>
    </head>
    <body rol="document">
        <%@include file="../WEB-INF/jspf/menu_a.jspf"%>
        <div role="main" class="container theme-showcase">
            <br>
            <div class="jumbotron">
                <form id="FCrearegion">
                    <table>
                        <tr>
                            <td>Nombre:</td>
                            <td><input  name="c_act" type="password" required></td>
                        </tr>
                        <tr>
                            <td>Tipo:</td>
                            <td>
                                <select id="selecttiporegion">
                                    <option value="C">Continente</option>
                                    <option value="R">Region</option>
                                    <option value="N">Nacion</option>
                                    <option value="A">Capital</option>
                                </select>
                            </td>
                        </tr>
                       
                        <tr>
                            <td></td>
                            <td>
                                <input class="btn btn-primary" type="submit" value="Aceptar">
                                <input class="btn btn-danger" type="reset" value="Cancelar">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf" %>
    </body>
</html>
