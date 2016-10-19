<%-- 
    Document   : Crud_Regiones
    Created on : 17/10/2016, 06:51:16 PM
    Author     : byron
--%>

<!DOCTYPE html>
<!doctype html>
<html lang="us">
<head>
	<meta charset="utf-8">
	<title>jQuery UI Example Page</title>
        <link href="../ui/jquery-ui.css" rel="stylesheet">
	
	<style>
	body{
		font-family: "Trebuchet MS", sans-serif;
		margin: 50px;
	}
	.demoHeaders {
		margin-top: 2em;
	}
	#dialog-link {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	#icons {
		margin: 0;
		padding: 0;
	}
	#icons li {
		margin: 2px;
		position: relative;
		padding: 4px 0;
		cursor: pointer;
		float: left;
		list-style: none;
	}
	#icons span.ui-icon {
		float: left;
		margin: 0 4px;
	}
	.fakewindowcontain .ui-widget-overlay {
		position: absolute;
	}
	select {
		width: 200px;
	}
	</style>
</head>
<body>

<h1>CRUDS!</h1>







<!-- Tabs -->

<div id="tabs">
	<ul>
		<li><a href="#tabs-1">Regiones</a></li>
		<li><a href="#tabs-2">Trabajadores</a></li>
		<li><a href="#tabs-3">Areas-Investigacion</a></li>
	</ul>
	<div id="tabs-1">
            <form id="1FormCreaRegion">
                    <table cellpadding="5" >
                        <tr>
                            <td>Nombre:</td>
                            <td><input id="1txtnombre" name="nombre" type="text" required></td>
                        </tr>
                        <tr>
                            <td>Tipo:</td>
                            <td>
                                <select id="1selecttiporegion">
                                    <option value="C">Continente</option>
                                    <option value="R">Region</option>
                                    <option value="N">Nacion</option>
                                    <option value="A">Capital</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                        <div id="1divareapoblacion">
                            
                        </div>
                        </tr>
                        <tr>
                            <div id="1divcontenedorregion">
                            
                            </div>
                           
                        </tr>
                        
                        <tr>
                            <td></td>
                            <td>
                                <input class="btn btn-success" type="submit" value="Crear">
                                
                            </td>
                        </tr>
                    </table>
                </form>
        </div>
	<div id="tabs-2">
            <h3>Crea algun trabajador</h3>
            <form>
                <table id="2tabformtrabajadores"> 
                    <tr>
                        
                        <th>Nombre:<input type="text" id="2txtnombre1" placeholder="Nombre"></input></th>
                        
                    </tr>
                    <tr>
                        
                        <th>Usuario <input type="text" id="2txtusuario1" placeholder="Usuario"></input></th>
                        
                    </tr>
                    <tr>
                        <th>Password <input type="password" id="2txtpass1" placeholder="Password"></input></th>
                        
                    </tr>
                    <tr>
                        
                        <th> <input type="password" id="2txtpass21" placeholder="Confirmacion"></input></th>
                        
                    </tr>
                    <tr>
                        
                        <th> Fecha de Inicio:<input type="date" id="2txtdate1" ></input></th>
                        
                    </tr>
                    <tr>
                        Tipo
                        <th>
                            <select id="2selecttipo1">
                                <option value="A">Administrador</option>
                                <option value="T">Trabajador</option>    
                            </select>
                        </th>
                        
                    </tr>
                    <tr>
                        Salario
                        <th> <input type="number" id="2txtsalario1" placeholder="Salario"></input></th>
                        
                    </tr>
                    <tr>
                        
                        <th> Comision <input type="number" id="2txtcomision1" placeholder="Comision"></input></th>
                        
                    </tr>
                </table>
            </form>
            
            
            
            
            
            
            
            
        </div>
	<div id="tabs-3">
        </div>
</div>


<br>


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
