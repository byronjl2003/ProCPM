<%-- 
    Document   : patentar
    Created on : 19/10/2016, 10:08:04 AM
    Author     : wxjoy
--%>
<%@page import="com.conexion.Invento"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf" %>
        <title>Aprobar Patente</title>
        <script>
            <%
                StringBuilder sb = new StringBuilder();
                int idTrab = (int) session.getAttribute("id");
                ArrayList<Invento> inventos = new Invento().getInventosAsig(idTrab);
                Invento inv;
                sb.append("var invt=[");
                for(int i=0; i<inventos.size(); i++){
                    inv = inventos.get(i);
                    if(i!=0){
                        sb.append(",['")
                                .append(inv.getId())
                                .append("','")
                                .append(inv.getDescripcion())
                                .append("']");
                    }else{
                        sb.append("['")
                                .append(inv.getId())
                                .append("','")
                                .append(inv.getDescripcion())
                                .append("']");
                    }
                }
                sb.append("];");
            %>
            <%=sb.toString()%>
            function selectItem(){
                var idv = document.getElementById('selId').value ;
                var out;
                for(var i=0; i<invt.length; i++){
                    if(invt[i][0] === idv){
                        out = invt[i][1];
                    }
                }
                $('#descInv').html(out);
            }
        </script>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main" class="container theme-showcase">
            <br>
            <div class="jumbotron">
                <h1></h1>
                <form class="form-horizontal" method="post" action="/ProCPM/AprobInvento">
                    <legend>Aprobar Patente</legend>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selId">Codigo de Invento</label>
                        <div class="col-md-4">
                            <select  class="form-control" id="selId" name="selId" onchange="selectItem()">
                                <%=getCod(inventos)%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="buttons">
                        </label>
                        <input value="Aceptar" type="submit" class="btn btn-success">
                        <input value="Cancelar" type="reset" class="btn btn-danger">
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="descInv">
                            Descripcion:
                        </label>
                        <div id="descInv" class="col-md-4"><%=inventos.get(0).getDescripcion()%></div>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf" %>
    </body>
</html>

<%!
private String getCod(ArrayList<Invento> inventos){
    StringBuilder sb = new StringBuilder();
    Invento inv;
    if(inventos.size()>0){
        for(int i = 0; i< inventos.size(); i++){
        inv = inventos.get(i);
        sb.append("<option value='")
            .append(inv.getId())
            .append("'>")
            .append(inv.getId())
            .append("</option>");
        }
    }else{
        sb.append("<option>No invento</option>");
}
    return sb.toString();
}
%>
