<%-- 
    Document   : nInvento
    Created on : 17/10/2016, 11:04:05 PM
    Author     : wxjoy
--%>
<%@page import="com.conexion.Area"%>
<%@page import="com.conexion.Region"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf"%>
        <title>Invento</title>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main" class="container theme-dropdown">
            <br>
            <div class="jumbotron">
                <form class="form-horizontal" method="post" action="/ProCPM/Invento">
                    <fieldset>
                        <legend>Nuevo Invento</legend>
                        
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textarea">Descripcion</label>
                            <div class="col-md-4">
                                <textarea required class="form-control" id="textarea" name="descrip" placeholder="alguna descripcion"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectp">Pais: </label>
                            <div class="col-md-4">
                                <select id="selectpa" name="selectp" class="form-control" required>
                                    <%=getPaises()%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectA">Area: </label>
                            <div class="col-md-4">
                                <select id="selectpa" name="selectA" class="form-control" required>
                                    <%=getAreas()%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="button1id"></label>
                            <div class="col-md-8">
                                <input value="Aceptar" type="submit" class="btn btn-success">
                                <input value="Cancelar" type="reset" class="btn btn-danger">
                            </div>
                        </div>
                    </fieldset>
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

    return sb.toString();
}

public String getAreas(){
    StringBuilder sb = new StringBuilder();
    ArrayList<Area> areas;
    Area a;
    areas = new Area().getAreas();
    
    if(areas.size()>0){
        for(int i = 0; i<areas.size(); i++){
            a = areas.get(i);
            sb.append("\t<option value=\"")
                .append(a.getId())
                .append("\">")
                .append(a.getNombre())
                .append("</option>\n");
        }
    }else{
        sb.append("\t<option>")
            .append("En construccion")
            .append("</option>\n");
    }

    return sb.toString();
}
%>
