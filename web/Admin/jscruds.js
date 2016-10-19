/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
		$('#submitseles').click(function(event) {
			
                        var fl = 'submitseles';
                        var codpais = $('#selectpaisesdispo').val();
                        var grup = $('#selectlgrupos').val();
                        var dirsele = $('#dirsele').val();
			// Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
			$.post('/Apuestas/ACrear', {
				flaa : fl,
                                codp : codpais,
                                grup : grup,
                                dir: dirsele
				
			}, function(responseText) {
				$('#divselesubmit').html(responseText);
			});

		});
                $('#btnselecciones').click(function(event) {
			
                       var fl = 'lselecciones';
                        
			$.post('/Apuestas/ACrear', {
				flaa : fl,
                                
			}, function(responseText) {
				$('#3selectlselecciones').html(responseText);
			});

		});
                
                $('#btngetselecciones').click(function(event) {
			alert("btngetselecciones");
                        var fl = 'lselecciones';
                        
			$.post('/Apuestas/ACrear', {
				flaa : fl,
                                
			}, function(responseText) {
				$('#3selectlselecciones').html(responseText);
			});

		});
                
                
                $( "#3selectlselecciones" ).change(function () {
                
               alert("btngetselecciones");
                var coda= $( this ).val()+'';
                var fl='infoseleccion';
                $.post('/Apuestas/ACrear', {
				flaa : fl,
                                codseleccion : coda
				
			}, function(responseText) {
                            	$("#divseleccioninfo").html(responseText);
			});
      
      
                
    
                }).change();
                
                
                
	});


