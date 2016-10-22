/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*EMPIEZA LO DEL CRUD DE AREAS*/

function jsmodarea(){
    
    alert("ENTRO A jsmodarea");
    var nombre = $('#3txtnombremod').val();
    var descrip = $('#3txtdescripcionmod').val();
    var ranking = $('#3txtrankingmod').val();
    var idt = $('#3selectrabtipo3mod').val();
    var id = $('#3selectareamod').val();;
    var fl ='marea';
    $.post('/ProCPM/CrudArea', {
				flaa : fl,
                                nombre : nombre,
                                descrip : descrip,
                                ranking : ranking,
                                idt : idt,
                                id : id
                                
                                
			}, function(responseText) {
				$('#3divinfosubmit').html(responseText);
			});
    
}
function jselimarea(){
    
    alert("ENTRO A jselimarea");
    
    var id = $('#3selectareamod').val();;
    var fl ='earea';
    $.post('/ProCPM/CrudArea', {
				flaa : fl,
                                id : id
                                
                                
			}, function(responseText) {
				$('#3divinfosubmit').html(responseText);
			});
    
}

 $(document).ready(function() {
     
     $( "#3selectareamod" ).change(function () {
          
          var fl ='infoarea';
          var idarea = $( this ).val()+'';;
              //alert("EL CHECK ESTA SE SELECCIONO");
              
                   $.post('/ProCPM/CrudArea', {
				flaa : fl,
                                idarea : idarea
                                
                                
			}, function(responseText) {
				$('#3divinfoarea').html(responseText);
			});
          
      });
     
     
     
     $('#3btngetareas').click(function(event) {
         
         var fl ='getareas';
         $.post('/ProCPM/CrudArea', {
				flaa : fl
                                
                                
			}, function(responseText) {
				$('#3selectareamod').html(responseText);
			});
              
         
         
     });
     
      $( "#3checkbox1" ).change(function () {
          
          if(this.checked==true)
          {
               var fl ='geTrabajadoresSinJefe';
              //alert("EL CHECK ESTA SE SELECCIONO");
              
                   $.post('/ProCPM/CrudArea', {
				flaa : fl
                                
                                
			}, function(responseText) {
				$('#3divtrabajadores').html(responseText);
			});
              
          }
          else
          {
              $('#3divtrabajadores').html("...");
          }
          
          
          
      });
      
      
      $('#3btnsubareas').click(function(event) {
                   
                   alert("submit area");
                   var fl ='submitarea';
                   var nombre = $('#3txtnombreregis').val();
                   var descrip = $('#3txtdescripcionregis').val();
                   var ranking = $('#3txtrankingregis').val();
                   var idt = 0;
                   
                   var check = document.getElementById('3checkbox1');
                   
                   
                    if(check.checked==true)
                    {
                        idt = $('#3selectrabtipo3').val();
                    }
                    
                   
                   $.post('/ProCPM/CrudArea', {
				flaa : fl,
                                nombre : nombre,
                                descrip : descrip,
                                ranking : ranking,
                                idt : idt
                                
                                
			}, function(responseText) {
				$('#3divrespsubmitarea').html(responseText);
			});
                   
               });
               
     
     
 });



/*EMPIEZA LO DEL CRUD DE PROFESIONALES*/
//CHECKBOX PARA DESPLEGAR AREAS SIN JEFES 
$(document).ready(function() {
     
      $( "#2checkbox1" ).change(function () {
          //alert("chekbox");
          var box = document.getElementById('2checkbox1');
          if(box.checked==true)
          {
              var fl ='getAreasSinJefe';
              //alert("EL CHECK ESTA SE SELECCIONO");
              
                   $.post('/ProCPM/CrudProfesional', {
				flaa : fl
                                
                                
			}, function(responseText) {
				$('#2divareasjefe').html(responseText);
			});
              
          }
          else
          {
              //alert("EL CHECK ESTA SE DESSELECCIONO");
              $('#2divareasjefe').html("..");
          }
          
          
          
      });
      
      $( "#2checkbox2" ).change(function () {
          //alert("chekbox");
          var box = document.getElementById('2checkbox2');
          if(box.checked==true)
          {
              var fl ='getareas2';
              //alert("EL CHECK ESTA SE SELECCIONO");
              
                   $.post('/ProCPM/CrudArea', {
				flaa : fl
                                
                                
			}, function(responseText) {
				$('#2divareasemp').html(responseText);
			});
              
          }
          else
          {
              //alert("EL CHECK ESTA SE DESSELECCIONO");
              $('#2divareasemp').html("..");
          }
          
          
          
      });
        $('#2btnsubmitprofes').click(function(event) {
         
          alert("2btnsubmitprofes");
                    //var seleemp = document.getElementById('2selectareaemp');
                    //var lennemp = seleemp.length;
                    //alert(lennemp);
                    
              
         
         
     });
       $('#2btnsubmitprofes2').click(function(event) {
         
          alert("2btnsubmitprofes2");
                    //var seleemp = document.getElementById('2selectareaemp');
                    //var lennemp = seleemp.length;
                    //alert(lennemp);
                    
              
         
         
     });
      $('#2btnsubmitprofes3').click(function(event) {
         
          alert("2btnsubmitprofes3");
                    //var seleemp = document.getElementById('2selectareaemp');
                    //var lennemp = seleemp.length;
                    //alert(lennemp);
                    
              
         
         
     });
         
           $('#2btngetprofes').click(function(event) {
         
          //alert("2btngetprofes");
                    //var seleemp = document.getElementById('2selectareaemp');
                    //var lennemp = seleemp.length;
                    //alert(lennemp);
                     var fl ='getprofes';
              //alert("EL CHECK ESTA SE SELECCIONO");
              
                   $.post('/ProCPM/CrudProfesional', {
				flaa : fl
                                
                                
			}, function(responseText) {
				$('#2selectprofesmod').html(responseText);
			});
                    
                    
              
         
         
     });
     $( "#2selectprofesmod" ).change(function () {
                   
                   var idusu= $( this ).val()+'';
                   var fl = 'getinfo';
         $.post('/ProCPM/CrudProfesional', {
				flaa : fl,
                                idusu : idusu
                                
                                
			}, function(responseText) {
				$('#2divinfoprofes').html(responseText);
			});
                   
               });
    
    
        
     
     
 });

/*EMPIEZA LO DEL CRUDS DE REGIONES*/

        function jsremovef(){
            
            var opts = [];
            var opt;
            var selec = document.getElementById('1selectregionfrontera');
            var selec2 = document.getElementById('1selectregionnofrontera');
            var lenn = selec.length;
            var lenn2 = selec2.length;
            alert("LEN:"+lenn);
            alert("LEN2:"+lenn2);
            for(var i=0;i<lenn;i++)
            {
               alert("ENTRO"+i);
                opt = selec.options[i];
                if(opt.selected)
                {
                    var val = opt.value;
                    var txt = opt.text;
                    alert(val+","+txt);
                    selec2.add(opt);
                    //var datos = val+","+txt;
                    //opts.push(datos);
                    selec.remove(i);
                }
                
            }
            alert("SALIO DE FOR");
            
            
            
        }
        function jsshowinforegion() {
                   
                   var cod = $('#1selectregionmod').val();
                    alert(cod+"");
                  
                   
                   var fl = 'getInfoRegion';
                   $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                idr : cod
                                
			}, function(responseText) {
				$('#1divinforegion').html(responseText);
			});
                   
                   
               }
        $(document).ready(function() {
		
               
               
               
               $('#btnsubmitregion').click(function(event) {
                   
                    var cod = $('#1selectregionmod').val();
                    alert(cod+"");
                   
               });
               
              
               $( "#1selecttiporegionmod" ).change(function () {
                   
                   var tipor= $( this ).val()+'';
                   //alert("dsds");
                   if(tipor=='R')
                    {
                        //TIPO REGION
                        var fl = 'getRegionesxTipo2';
                        var tip = 'R';
                        $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip
                                
			}, function(responseText) {
				$('#1div_1selectregionmod').html(responseText);
			});
                    
                    }
                    else if(tipor=='C')
                    {
                        //TIPO REGION
                        var fl = 'getRegionesxTipo2';
                        var tip = 'C';
                        $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip
                                
			}, function(responseText) {
				$('#1div_1selectregionmod').html(responseText);
			});
                    
                    }
                    else if(tipor=='N')
                    {
                        //TIPO REGION
                        var fl = 'getRegionesxTipo2';
                        var tip = 'N';
                        $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip
                                
			}, function(responseText) {
				$('#1div_1selectregionmod').html(responseText);
			});
                    
                    }
                    else if(tipor=='A')
                    {
                        //TIPO REGION
                        var fl = 'getRegionesxTipo2';
                        var tip = 'A';
                        $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip
                                
			}, function(responseText) {
				$('#1div_1selectregionmod').html(responseText);
			});
                    
                    }
                
               }).change();
                
                $( "#1selecttiporegion" ).change(function () {
                var tipor= $( this ).val()+'';
                //alert("select tipo: "+tipor);
               
                
                if(tipor=='C')
                {
                    //ES UN CONTINENTE
                   $('#1divarea').html(" ");
                    $('#1divpoblacion').html(" ");
                    $('#1divcontenedorregion').html("");
                    $('#1divarea0').html("");        
                    $('#1divpoblacion0').html("");
                }
                else if(tipor=='R')
                {
                    //TIPO REGION
                    var fl = 'getRegionesxTipo';
                    var tip = 'C';
                    $('#1divarea').html(" ");
                    $('#1divpoblacion').html(" ");
                    $('#1divarea0').html("");        
                    $('#1divpoblacion0').html("");
                    $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip
                                
			}, function(responseText) {
				$('#1divcontenedorregion').html(responseText);
			});
                    
                }
                else if(tipor=='N')
                {
                    //TIPO NACION
                    //alert("ENTRO A N");
                    var fl = 'getRegionesxTipo';
                    var tip = 'R';
                    var mensaje ="<div class=\"form-group\"> <input id=\"1txtarearegis\" name=\"1txtarearegis\" type=\"number\"  class=\"form-control input-md\"> <span class=\"help-block\">Entra el area territorial</span></div>";
                    //var mensaje ="<div class=\"form-group\"> <div class=\"col-md-4\"><input id=\"1txtarearegis\" name=\"1txtarearegis\" type=\"number\"  class=\"form-control input-md\"> <span class=\"help-block\">Entra el area territorial</span></div></div>";
                    var mensaje2 ="<div class=\"form-group\"><input id=\"1txtpoblacionregis\" name=\"1txtarearegis\" type=\"number\"  class=\"form-control input-md\"> <span class=\"help-block\">Entra la poblacion</span></div>";    
                    $('#1divarea0').html("Area:");        
                    $('#1divpoblacion0').html("Poblacion:");
                        $('#1divarea').html(mensaje);
                    
                    $('#1divpoblacion').html(mensaje2);
                    $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip
                                
			}, function(responseText) {
				$('#1divcontenedorregion').html(responseText);
			});
                    var tip2='N';
                    var fl2 = 'getposifrontras';
                    $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip2
                                
			}, function(responseText) {
				$('#selectregionfrontera').html(responseText);
			});
                    
                }
                else if(tipor=='A')
                {
                    var fl = 'getRegionesxTipo';
                    var tip = 'N';
                    $('#1divarea').html(" ");
                    $('#1divpoblacion').html(" ");
                    $('#1divarea0').html("");        
                    $('#1divpoblacion0').html("");
                        $.post('/ProCPM/CrudRegion', {
				flaa : fl,
                                tip : tip
                                
			}, function(responseText) {
				$('#1divcontenedorregion').html(responseText);
			});
                }
      
                
    
                }).change();
                
                
                
	});


