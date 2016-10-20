<%-- 
    Document   : Ranking
    Created on : 19/10/2016, 12:21:06 PM
    Author     : wxjoy
--%>
<%@page import="com.conexion.Area"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf" %>
        <title>Cambiar Ranking</title>
        <script>
            <%
                StringBuilder sb = new StringBuilder();
                int id = (int)session.getAttribute("id");
                ArrayList<Area> areas = new Area().getAreas(id);
                Area a;
                sb.append("var area= [");
                for(int i = 0; i<areas.size();i++){
                    a = areas.get(i);
                    if(i!=0){
                        sb.append(",['")
                                .append(a.getId())
                                .append("','")
                                .append(a.getNombre())
                                .append("',")
                                .append(a.getRanking())
                                .append("]");
                    }else{
                        sb.append("['")
                                .append(a.getId())
                                .append("','")
                                .append(a.getNombre())
                                .append("',")
                                .append(a.getRanking())
                                .append("]");
                    }
                }
                sb.append("];");
            %>
            <%=sb.toString()%>
            function selectItem(){
                var vran = 0;
                var ida = document.getElementById('selectA').value ;
                for(var i = 0; i < area.length; i++){
                    if(area[i][0] === ida){
                        vran = area[i][2];
                    }
                }
                document.getElementById('vRank').value = vran;
            }
        </script>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main" class="container theme-showcase">
            <br>
            <div class="jumbotron">
                <form class="form-horizontal" method="post" action="/ProCPM/CRanking">
                    <legend>Modificar Ranking</legend>
                    <div class="form-group">
                            <label class="col-md-4 control-label" for="selectA">Area: </label>
                            <div class="col-md-4">
                                <select id="selectA" onchange="selectItem()" name="selectA" class="form-control" required>
                                    <%=getAreas(areas)%>
                                </select>
                            </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="vRank">
                            Ranking
                        </label>
                        <div class="col-md-4">
                            <input value="<%=areas.get(0).getRanking()%>"  type="number" id="vRank" name="vRank" min="0" max="10" class="form-control" required >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="buttons">
                        </label>
                        <input value="Aceptar" type="submit" class="btn btn-success">
                        <input value="Cancelar" type="reset" class="btn btn-danger">
                    </div>
                </form>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf" %>
    </body>
</html>

<%!
public String getAreas(ArrayList<Area> areas){
    StringBuilder sb = new StringBuilder();
    Area a;
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
            .append("Sin Areas")
            .append("</option>\n");
    }

    return sb.toString();
}
%>
