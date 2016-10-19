<%-- 
    Document   : AsigInventor
    Created on : 18/10/2016, 03:25:24 PM
    Author     : wxjoy
--%>
<%@page import="com.conexion.Inventor"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../WEB-INF/jspf/val_u.jspf" %>
<%valUsuario(session,response);%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/headert.jspf"%>
        <title>Inventores</title>
        <script>
            var inv =[];
            function addInventor(){
                var select = document.getElementById('selectI');
                var val = select.value;
                var text = select.options[select.selectedIndex].text;
                var datos = [val,text];
                inv.push(datos);
                $('#selectI').find("option[value='"+val+"']").remove();
                //alert(inv);
                showInventor();
            }
            
            function showInventor(){
                var salida="";
                var datos;
                //alert('inventor');
                if(inv.length >0){
                    salida += "<table class='table table-striped'>\n";
                    salida += "<thead>\n";
                    salida += "<tr>\n";
                    salida += "<th>Inventor</th>\n";
                    salida += "<th>Opcion</th></tr>";
                    salida += "</thead>\n<tbody>";
                    for(var i=0; i < inv.length; i++){
                        datos = inv[i];
                        salida += "<tr>";
                        salida += "<td>";
                        salida += datos[1];
                        salida += "</td>";
                        salida += "<td>";
                        salida += "<button onclick='delInventor("+i+")' class='btn btn-danger'><span class='fa fa-minus'></span> Quitar </button>";
                        salida += "</td";
                        salida += "<tr>\n";
                    }
                    salida += "</tbody>\n</table>";
                    $('#asig').html(salida);
                }else{
                    $('#asig').html('Inventor no Asignado');
                }
            }
            
            function saveInventor(){
                var invs ;
                var datos;
                
                if(inv.length>0){
                    /*aca deberia de mandar a guardar los datos**/
                    for(var i=0; i<inv.length; i++){
                        datos = inv[i];
                        if(i!==0){
                            invs += "," + datos[0];
                        }else{
                            invs = datos[0];
                        }
                    }
                    $.post('/ProCPM/AsigInv',{
                        inventores: invs
                    },function(responseText){
                            window.location.href = "/ProCPM/User/nInvento.jsp";
                    });
                }else{
                    alert("Debe agregar almenos un inventor.");
                }
            }
            
            function delInventor(id){
                //alert('delInventor');
                var nOpcion;
                var dato =  inv[id];
                nOpcion = "<option value='";
                nOpcion += dato[0];
                nOpcion += "'>";
                nOpcion += dato[1];
                nOpcion += "</option>";
                inv.splice(id,1);
                $('#selectI').append(nOpcion);
                showInventor();
            }
        </script>
    </head>
    <body role="document">
        <%@include file="../WEB-INF/jspf/menu_t.jspf" %>
        <div role="main" class=" container theme-dropdown">
            <br>
            <div class="jumbotron">
                <h3>Debe de agregar el inventor o inventores</h3>
                <div class="form-horizontal">
                <!--<form class="form-horizontal" >-->
                    <legend>Inventores</legend>
                    <div class="form-group">
                            <label class="col-md-4 control-label" for="selectI">Inventor: </label>
                            <div class="col-md-4">
                                <select id="selectI" name="selectI" class="form-control" required>
                                    <%=getInventores()%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="button1id"></label>
                            <div class="col-md-8">
                                <button class="btn btn-success" onclick="addInventor()"><span class="fa fa-plus"></span> Agregar</button>
                                <button class="btn btn-primary" onclick="saveInventor()"><span class="fa fa-save"></span> Guardar</button>
                            </div>
                        </div>
                <!--</form>-->
                </div>
                <div id="asig">
                </div>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/scriptsu.jspf"%>
    </body>
</html>

<%!
private String getInventores(){
    StringBuilder sb = new StringBuilder();
    ArrayList <Inventor> inventores;
    inventores = new Inventor().getInventores();
    Inventor inv;
    if(inventores.size()>0){
        for(int i = 0; i<inventores.size();i++){
            inv = inventores.get(i);
            sb.append("\t\t<option value=\"")
                .append(inv.getId())
                .append("\" >")
                .append(inv.getNombre())
                .append("</option>");
        }
    }else{
        sb.append("<option>vacio</option>");
    }
    return sb.toString();
}
%>