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
<body>
<%@include file="../WEB-INF/jspf/menu_a.jspf"%>
<h1>CRUDS!</h1>







<!-- Tabs -->

<div id="tabs">
	<ul>
                <li><a href="#tabs-0">Patentes</a></li>
		<li><a href="#tabs-1">Regiones</a></li>
		<li><a href="#tabs-2">Profesionales</a></li>
		<li><a href="#tabs-3">Areas-Cientificas</a></li>
	</ul>
        <div id="tabs-0">
            
            
            
            
            
        </div>
	<div id="tabs-1">
            <h3>CREA UNA REGION!</h3>
            
                    <table cellpadding="5" align="center" >
                        <tr>
                            <td>Nombre:</td>
                            <td><input id="1txtnombreregis" name="nombre" type="text" required class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Tipo:</td>
                            <td>
                                
                                    <select id="selecttiporegion" class="form-control" >
                                        <option value="C">Continente</option>
                                        <option value="R">Region</option>
                                        <option value="N">Nacion</option>
                                        <option value="A">Capital</option>
                                    </select>
                                </div>
                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>                 
                                <div id="1divarea0">
                                    
                                </div>
                            </td>
                            <td>                 
                                <div id="1divarea">
                                    
                                </div>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>                     
                                <div id="1divpoblacion0">
                                    
                                </div>
                                </td>
                                <td>                     
                                <div id="1divpoblacion">
                                    
                                </div>
                                </td>
                            
                        </tr>
                        <tr>
                            <td>Region Contenedora:</td>
                            <td>
                                    <div id="1divcontenedorregion">
                                        
                                     </div>
                                    
                                
                           </td>
                        </tr>
                        <tr>
                            <td>Fronteras:</td>
                            <td>
                             
                                        <select name="selectregionfrontera" id="selectregionfrontera" multiple="multiple">
                                        </select>
                                
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                        <button id="btnsubmitregion" class="btn btn-success" ><span class="fa fa-plus"></span>Crear</button>
                        </td>
                        </tr>
                    </table>
                    <div id="divrespsubmitregion">
                    </div>
                
            <h4>Modificaion y Eliminacion</h4>
            
                    <table cellpadding="5" align="center" >
                        
                        <tr>
                            <td>
                                <select id="1selecttiporegionmod" class="form-control" >
                                    <option value="C">Continente</option>
                                        <option value="R">Region</option>
                                        <option value="N">Nacion</option>
                                        <option value="A">Capital</option>
                                </select>
                            </td>
                            <td>
                                <div id="1div_1selectregionmod">
                                        
                                </div>
                               
                            </td>
                        </tr>
                       
                       
                    </table>
                    <br>
                    <div id="1divinforegion">
                        
                    </div>
            
        </div>
	<div id="tabs-2">
            <h3>Crea algun trabajador</h3>
            <form>
                <table id="2tabformtrabajadores"> 
                    <tr>
                        <td>Nombre:</td>
                        <td><input class="form-control" type="text" id="2txtnombre1" placeholder="Nombre"></input></td>
                        
                    </tr>
                    <tr>
                        <td>Usuario:</td>
                        <td><input class="form-control" type="text" id="2txtusuario1" placeholder="Usuario"></input></td>
                        
                    </tr>
                    <tr>
                        <td>Password:</td>

                        <td><input class="form-control" type="password" id="2txtpass1" placeholder="Password"></input></td>
                        
                    </tr>
                    <tr>
                        <td>Confirmacion:</td>

                        <td><input class="form-control" type="password" id="2txtpass21" placeholder="Confirmacion"></input></td>
                        
                    </tr>
                    <tr>
                        <td> Fecha Ini:</td>

                        <td><input class="form-control" type="date" id="2txtdate1" ></input></td>
                        
                    </tr>
                    <tr>
                        <td>Tipo:</td>
                        <td>
                            <select class="form-control" id="2selecttipo1">
                                <option value="A">Administrador</option>
                                <option value="T">Trabajador</option>    
                            </select>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>Salario:</td>
                        <td><input class="form-control" type="number" id="2txtsalario1" placeholder="Salario"></input></td>
                        
                    </tr>
                    <tr>
                        <td>Comision:</td>
                        <td><input class="form-control" type="number" id="2txtcomision1" placeholder="Comision"></input></th>
                        
                    </tr>
                    <tr>
                        <td>Puesto</td>
                        <td>
                             <div class="checkbox">
                                <label for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="2checkbox1" value="1">
                                Jefe
                                </label>
                            </div>
                            
                        </td>
                        <td>
                            <div id="2divareasjefe">
                                
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                             <div class="checkbox">
                                <label for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="2checkbox2" value="1">
                                Empleado
                                </label>
                            </div>
                            
                        </td>
                        <td>
                            <div id="2divareasemp">
                                
                            </div>
                        </td>
                        
                    </tr>
                    
                    
                </table>
            </form>
            <button id="2btnsubmitprofes3" class="btn btn-success" ><span class="fa fa-plus"></span>Crear</button>
            <h4>Modificacion y Eliminacion</h4>
            <br>
            <button id="2btngetprofes" class="btn btn-success" ><span class="fa fa-plus"></span>Get</button>
            <select id="2selectprofesmod">
                
            </select>
            <div id="2divinfoprofes">
                
            </div>
            <div id="2divinfosubmit">
            </div>
            
           
            
            
            
            
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
	<div id="tabs-3">
            
            
            <h3>CREA UN AREA-CIENTIFICA</h3>
            
                    <table cellpadding="5" align="center" >
                        <tr>
                            <td>Nombre:</td>
                            <td><input id="3txtnombreregis" name="nombre" type="text" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Descripcion:</td>
                            <td>
                                 <textarea class="form-control" id="3txtdescripcionregis">Pon una descripcion</textarea>

                            </td>
                        </tr>
                        <tr>
                            <td>ranking</td>
                                             
                                <td><input id="3txtrankingregis"type="number" class="form-control"></td>
                            
                            
                        </tr>
                        <tr>
                            <td>
                                <div class="checkbox">
                                <label for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="3checkbox1" value="1">
                                Asignar Jefe?
                                </label>
                            </div>
                                
                            </td>
                            <td>                     
                                <div id="3divtrabajadores">
                                    
                                </div>
                            </td>
                            
                        </tr>
                        
                        
                        <tr>
                            <td>
                         <button id="3btnsubareas" class="btn btn-success" ><span class="fa fa-plus"></span>Crear</button>
                        </td>
                        </tr>
                    </table>
                    <div id="3divrespsubmitarea">
                    </div>
                
            <h4>Modificaion y Eliminacion</h4>
            <br>
            <button id="3btngetareas" class="btn btn-success" ><span class="fa fa-plus"></span>Get</button>
            <select id="3selectareamod">
                
            </select>
            <div id="3divinfoarea">
                
            </div>
            <div id="3divinfosubmit">
            </div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        </div>
</div>


<br>

<%@include file="../WEB-INF/jspf/scriptsa.jspf" %>
<script src="../ui/external/jquery/jquery.js"></script>
<script src="../ui/jquery-ui.js"></script>
<script>

$( "#accordion" ).accordion();



var availableTags = [
	"ActionScript",
	"AppleScript",
	"Asp",
	"BASIC",
	"C",
	"C++",
	"Clojure",
	"COBOL",
	"ColdFusion",
	"Erlang",
	"Fortran",
	"Groovy",
	"Haskell",
	"Java",
	"JavaScript",
	"Lisp",
	"Perl",
	"PHP",
	"Python",
	"Ruby",
	"Scala",
	"Scheme"
];
$( "#autocomplete" ).autocomplete({
	source: availableTags
});



$( "#button" ).button();
$( "#button-icon" ).button({
	icon: "ui-icon-gear",
	showLabel: false
});



$( "#radioset" ).buttonset();



$( "#controlgroup" ).controlgroup();



$( "#tabs" ).tabs();



$( "#dialog" ).dialog({
	autoOpen: false,
	width: 400,
	buttons: [
		{
			text: "Ok",
			click: function() {
				$( this ).dialog( "close" );
			}
		},
		{
			text: "Cancel",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});
$( "#dialog2" ).dialog({
	autoOpen: false,
	width: 400,
	buttons: [
		{
			text: "Ok",
			click: function() {
				$( this ).dialog( "close" );
			}
		},
		{
			text: "Cancel",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});

// Link to open the dialog
$( "#dialog-link" ).click(function( event ) {
	$( "#dialog" ).dialog( "open" );
	event.preventDefault();
});
// Link to open the dialog
$( "#dialog2-link" ).click(function( event ) {
	$( "#dialog2" ).dialog( "open" );
	event.preventDefault();
});



$( "#datepicker" ).datepicker({
	inline: true
});



$( "#slider" ).slider({
	range: true,
	values: [ 17, 67 ]
});



$( "#progressbar" ).progressbar({
	value: 20
});



$( "#spinner" ).spinner();



$( "#menu" ).menu();



$( "#tooltip" ).tooltip();



$( "#selectmenu" ).selectmenu();


// Hover states on the static widgets
$( "#dialog-link, #icons li" ).hover(
	function() {
		$( this ).addClass( "ui-state-hover" );
	},
	function() {
		$( this ).removeClass( "ui-state-hover" );
	}
);
</script>
</body>
</html>
