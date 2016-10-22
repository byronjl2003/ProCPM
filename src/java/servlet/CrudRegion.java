/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.conexion.Region;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author byron
 */
@WebServlet(name = "CrudRegion", urlPatterns = {"/CrudRegion"})
public class CrudRegion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrudRegion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrudRegion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("LLEGO AL POST DESDE AJAX");
        String flag = request.getParameter("flaa");
        System.out.println(flag);
        if(flag.equals("getRegionesxTipo"))
        {
            String tip = request.getParameter("tip");
            Region reg = new Region();
            ArrayList<Region> lista = reg.getRegionesPorTipo(tip.charAt(0));
            Iterator<Region> it = lista.iterator();
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("<select id=\"1selectregioncontenedora\" class=\"form-control\">");
            while(it.hasNext())
            {
                Region re = it.next();
                out.println("<option value=\""+re.getId()+"\">"+re.getNombre()+"</option>");
            }
            out.println("</select>");
           
            
        }
        else if(flag.equals("getposifrontras"))
        {
            
            Region reg = new Region();
            ArrayList<Region> lista = reg.getRegionesPorTipo('N');
            Iterator<Region> it = lista.iterator();
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            //out.println("<select id=\"1selectregionfrontera\"  multiple=\"multiple\">");
            while(it.hasNext())
            {
                Region re = it.next();
                out.println("<option value=\""+re.getId()+"\">"+re.getNombre()+"</option>");
            }
            //out.println("</select>");
        }
        else if(flag.equals("submitregion"))
        {
            String nombre = request.getParameter("nombre");
            String tipor =  request.getParameter("tipor");
            if(tipor=="C")
            {
                Region reg = new Region();
                reg.setNombre(nombre);
                reg.setTipor(tipor.charAt(0));
                String erg[]={"a","b"};
                reg.setRegion(erg);
            }
            else if(tipor=="N")
            {
                int regconte = Integer.valueOf(request.getParameter("regconte"));
                String fronteras[] = request.getParameterValues("fronteras");
                float area = Float.valueOf(request.getParameter("area"));
                int poblac = Integer.valueOf(request.getParameter("poblacion"));
                Region reg = new Region();
                reg.setNombre(nombre);
                reg.setTipor(tipor.charAt(0));
                reg.setIddcontenedora(regconte);
                reg.setArea(area);
                reg.setPoblacion(poblac);
                reg.setRegion(fronteras);
            
            }
            else if(tipor=="A"||tipor=="R")
            {
                 int regconte = Integer.valueOf(request.getParameter("regconte"));
                Region reg = new Region();
                reg.setNombre(nombre);
                reg.setTipor(tipor.charAt(0));
                reg.setIddcontenedora(regconte);
                String erg[]={"a","b"};
                reg.setRegion(erg);
            }
           
        }
        
        else if(flag.equals("getRegionesxTipo2"))
        {
            String tip = request.getParameter("tip");
            
            Region reg = new Region();
            ArrayList<Region> lista = reg.getRegionesPorTipo(tip.charAt(0));
            Iterator<Region> it = lista.iterator();
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("<select id=\"1selectregionmod\" class=\"form-control\" onchange=\"javascript:jsshowinforegion();\"> ");
            while(it.hasNext())
            {
                Region re = it.next();
                out.println("<option value=\""+re.getId()+"\">"+re.getNombre()+"</option>");
            }
            out.println("</select>");
            //out.println("<button id=\"btnshowregion\" class=\"btn btn-success\" ><span class=\"fa fa-plus\"></span>Crear</button>");
            
                                   
                                
        }
        else if(flag.equals("getInfoRegion"))
        {
            System.out.println("ENTRO a getInfoRegion");
            Integer idr = Integer.valueOf(request.getParameter("idr"));
            Region reg = new Region();
            reg.getInfo(idr);
            
            PrintWriter out = response.getWriter();
            out.println(" <table cellpadding=\"5\" align=\"center\" >");
            out.println("<tr>");
            out.println("<td>");
            out.println("Nombre:");
            out.println("</td>");
            out.println("<td>");
            out.println("<div class=\"form-group\"> <input id=\"1txtnombremod\" name=\"1txtnombremod\" type=\"text\"  class=\"form-control input-md\" value=\""+reg.getNombre()+"\"></div>");
            out.println("</td>");
            out.println("</tr>");
            System.out.println("TIPO::"+reg.getTipor());
            if(reg.getTipor()!='C')
            {
                ArrayList<Region> lista=null;
                if(reg.getTipor()=='R')
                    lista = reg.getRegionesPorTipo('C');
                else if(reg.getTipor()=='N')
                    lista = reg.getRegionesPorTipo('R');
                if(reg.getTipor()=='A')
                    lista = reg.getRegionesPorTipo('N');
                
                Iterator<Region> it = lista.iterator();
                out.println("<tr>");
                out.println("<td>");
                
                out.println("Region Contenedora");
                out.println("</td>");
                out.println("<td>");
                out.println("<select id=\"1selectregioncontenedora\" class=\"form-control\">");
                while(it.hasNext())
                {
                    Region re = it.next();
                    if(re.getId()==reg.getIddcontenedora())
                    {
                        out.println("<option value=\""+re.getId()+"\" selected>"+re.getNombre()+"</option>");
                    }
                    else
                        out.println("<option value=\""+re.getId()+"\">"+re.getNombre()+"</option>");
                }
                out.println("</select>");
                out.println("</td>");
                out.println("</tr>");
                
            }
            
            if(reg.getTipor()=='N')
            {
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Area:");
                out.println("</td>");
                out.println("<td>");
                out.println("<div class=\"form-group\"> <input value=\""+reg.getArea()+"\" id=\"1txtareamod\" name=\"1txtareamod\" type=\"number\"  class=\"form-control input-md\"></div>");
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Poblacion:");
                out.println("</td>");
                out.println("<td>");
                out.println("<div class=\"form-group\"> <input value=\""+reg.getPoblacion()+"\" id=\"1txtpoblamod\" name=\"1txtpoblamod\" type=\"number\"  class=\"form-control input-md\"></div>");
                out.println("</td>");
                out.println("</tr>");
            }
           
            out.println("</table>");
            
            if(reg.getTipor()=='N')
            {
                ArrayList<Region> lf = reg.get_fronteras("SI");
                ArrayList<Region> lnof = reg.get_fronteras("NO");
                out.println(" <table cellpadding=\"5\" align=\"center\" >");
                out.println("<tr>");
                out.println("<td>");
                out.println("Fronteras");
                out.println("</td>");
                out.println("<td>");
                out.println("No Fronteras");
                out.println("</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>");
                out.println("<select name=\"1selectregionfrontera\" id=\"1selectregionfrontera\" multiple=\"multiple\">");
                Iterator<Region> it2 = lf.iterator();
                while(it2.hasNext())
                {
                    Region rr = it2.next();
                    out.println("<option value=\""+rr.getId()+"\">"+rr.getNombre()+"</option>");
                }
                out.println("</select>");
                
                                        
                out.println("</td>");
                out.println("<td>");
                out.println("<select name=\"1selectnofrontera\" id=\"1selectregionnofrontera\" multiple=\"multiple\">");
                Iterator<Region> it3 = lnof.iterator();
                while(it3.hasNext())
                {
                    Region rr = it3.next();
                    out.println("<option value=\""+rr.getId()+"\">"+rr.getNombre()+"</option>");
                }
                out.println("</select>");
                
                                        
                out.println("</td>");
                
                out.println("</tr>");
                
                
                out.println("<tr>");
                out.println("<td>");
               out.println("<input class=\"btn btn-danger\" id=\"btnremovefrontera\" type=\"button\" value=\"Remover\"  onclick=\"javascript:jsremovef();\"");
                
                out.println("</td>");
                 out.println("<td>");
                 out.println("<input class=\"btn btn-success\" id=\"btnaddfrontera\" type=\"button\" value=\"Agregar\"  onclick=\"javascript:jsaddf();\"");
               
                
                out.println("</td>");
                out.println("</tr>");
                
                
                out.println("<tr>");
                out.println("<td>");
                out.println("<button class=\"btn btn-primary\" id=\"btnsubmitmodreg\"><span class=\"fa fa-save\"></span> Guardar</button>");
                out.println("</td>");
                out.println("</tr>");
                out.println("</table>");
            }
            
            
            
        }
        
                
                
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
