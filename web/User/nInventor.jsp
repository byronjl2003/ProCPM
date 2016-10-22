<%-- 
    Document   : nInventor
    Created on : 17/10/2016, 05:26:27 PM
    Author     : wxjoy
--%>

<%@page import="com.conexion.Region"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf"%>
        <title>Crear Inventor</title>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main" class="container theme-dropdown">
            <br>
            <div class="jumbotron">
                <h2>Registrar Inventor</h2>
                Para registrar un inventor debe de llenar los capos que
                se solicitan a continuacion.
                <form method="post" action="/ProCPM/RegInventor">
                    <table>
                        <tr>
                            <td>
                                Nombre: 
                            </td>
                            <td>
                                <input class="form-control" name="nombre" type="text" maxlength="50" required>
                            </td>
                        </tr>
                        <tr><!--
                            <td>
                                Correo:
                            </td>
                            <td>
                                <input name="correo" type="email" maxlength="50" required>
                            </td>
                            -->
                        </tr>
                        <tr>
                            <td>
                                Pais:
                            </td>
                            <td>
                                <select name="pais" class="form-control" required>
                                    <%=getPaises()%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="submit" value="Aceptar" class="btn btn-success">
                                <input type="reset" value="Cancelar" class="btn btn-danger">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf" %>
    </body>
</html>

<%!
public String getPaises(){
    StringBuilder sb = new StringBuilder();
    ArrayList<Region> paises;
    Region p;
    paises = new Region().getPaises();
    //sb.append("<select name=\"pais\">\n");
    if(paises.size()>0){
        for(int i = 0; i<paises.size(); i++){
            p = paises.get(i);
            sb.append("\t<option value=\"")
                .append(p.getId())
                .append("\">")
                .append(p.getNombre())
                .append("</option>\n");
        }
    }else{
        sb.append("\t<option>")
            .append("En construccion")
            .append("</option>\n");
    }

    //sb.append("</select>");
    return sb.toString();
}
%>
