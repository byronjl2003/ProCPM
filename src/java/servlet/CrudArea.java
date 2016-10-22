/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.conexion.Area;
import com.conexion.Region;
import com.conexion.Usuario;
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
@WebServlet(name = "CrudArea", urlPatterns = {"/CrudArea"})
public class CrudArea extends HttpServlet {

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
            out.println("<title>Servlet CrudArea</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrudArea at " + request.getContextPath() + "</h1>");
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        System.out.println("LLEGO AL POST DESDE AJAX CrudAreas");
        String flag = request.getParameter("flaa");
        System.out.println(flag);
        if(flag.equals("getareas"))
        {
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            Area area = new Area();
            ArrayList<Area> lista = area.getAreas();
            Iterator<Area> it = lista.iterator();
            while(it.hasNext())
            {
                Area aa = it.next();
                out.println("<option value=\""+aa.getId()+"\">"+aa.getNombre()+"</option>");
                
            }
            
        }
        else if(flag.equals("getareas2"))
        {
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            Area area = new Area();
            ArrayList<Area> lista = area.getAreas();
            Iterator<Area> it = lista.iterator();
            out.println("<select id=\"2selectareaemp\" class=\"form-control\" multiple=\"multiple\">>");
            while(it.hasNext())
            {
                Area aa = it.next();
                out.println("<option value=\""+aa.getId()+"\">"+aa.getNombre()+"</option>");
                
            }
            out.println("</select>");
            
        }
        else if(flag.equals("geTrabajadoresSinJefe"))
        {
            
            Usuario usu = new Usuario();
            ArrayList<Usuario> lista = usu.get_trabajadorestipo3();
            
            Iterator<Usuario> it = lista.iterator();
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("<select id=\"3selectrabtipo3\" class=\"form-control\">");
            while(it.hasNext())
            {
                Usuario us = it.next();
                out.println("<option value=\""+us.getId()+"\">"+us.getNombre()+"</option>");
            }
            out.println("</select>");
           
            
            
        }
        else if(flag.equals("submitarea"))
        {
            
            String nombre = request.getParameter("nombre");
            String descrip = request.getParameter("descrip");
            int ranking = Integer.valueOf(request.getParameter("ranking"));
            int idt = Integer.valueOf(request.getParameter("idt"));
            Area area = new Area();
            area.setNombre(nombre);
            area.setDescripcion(descrip);
            area.setRanking(ranking);
            area.setIdtrab(idt);
            area.setArea(area);
            response.setContentType( "text/html; charset=iso-8859-1" );
             PrintWriter out = response.getWriter();
            out.println("Area creada satisfactoriamente");
            
            
        }
        else if(flag.equals("infoarea"))
        {
            int idarea = Integer.valueOf(request.getParameter("idarea"));
            
            Area area = new Area();
            area.getInfo(idarea);
            
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("<table cellpadding=\"5\">");
            out.println("<tr>\n" +
"                            <td>Nombre:</td>\n" +
"                            <td><input id=\"3txtnombremod\" name=\"nombre\" type=\"text\" required class=\"form-control\" value=\""+area.getNombre()+"\"></td>\n" +
"                        </tr>");
            
            out.println("<tr>\n" +
"                            <td>Descripcion:</td>\n" +
"                            <td>\n" +
"                                 <textarea class=\"form-control\" id=\"3txtdescripcionmod\" name=\"textarea\">"+area.getDescripcion()+"</textarea>\n" +
"\n" +
"                            </td>\n" +
"                        </tr>");
            
            out.println("<tr>\n" +
"                            <td>ranking</td>\n" +
"                                             \n" +
"                                <td><input id=\"3txtrankingmod\"type=\"number\" class=\"form-control\" value=\""+area.getRanking()+"\"></td>\n" +
"                           \n" +
"                            \n" +
"                        </tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("Jefe:");
            
            out.println("</td>");
            
            out.println("<td>");
            
            if(area.getIdtrab()==0)
            {
                Usuario usu = new Usuario();
                ArrayList<Usuario> lista = usu.get_trabajadorestipo3();
            
                Iterator<Usuario> it = lista.iterator();
                
                
                out.println("<select id=\"3selectrabtipo3mod\" class=\"form-control\">");
                out.println("<option value=\"0\">No tine jefe</option>");
                while(it.hasNext())
                {
                    Usuario us = it.next();
                    out.println("<option value=\""+us.getId()+"\">"+us.getNombre()+"</option>");
                }
                out.println("</select>");
            }
            else
            {
                Usuario usu = new Usuario();
                usu.getInfo(area.getIdtrab());
                ArrayList<Usuario> lista = usu.get_trabajadorestipo3();
            
                Iterator<Usuario> it = lista.iterator();
                
                
                out.println("<select id=\"3selectrabtipo3mod\" class=\"form-control\">");
                //out.println("<option value=\"0\">No tine jefe</option>");
                while(it.hasNext())
                {
                    Usuario us = it.next();
                    if(us.getId()==area.getIdtrab())
                         out.println("<option value=\""+us.getId()+"\" selected>"+us.getNombre()+"</option>");
                    else
                        out.println("<option value=\""+us.getId()+"\">"+us.getNombre()+"</option>");
                }
                out.println("</select>");
                
            }
            out.println("</td>");
            
            
            out.println("</tr>");
            
            
                out.println("<tr>");
                out.println("<td>");
                out.println("<button class=\"btn btn-primary\" id=\"btnsubmitmodreg\" onclick=\"javascript:jsmodarea();\"><span class=\"fa fa-save\"></span> Modificar</button>");
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("<button class=\"btn btn-danger\" id=\"btnsubmitmodreg\" onclick=\"javascript:jselimarea();\"><span ></span> Eliminar</button>");
                out.println("</td>");
                out.println("</tr>");
                
            
            
            out.println("</table>");
            
            
            
            
            
            
            
        }
        else if(flag.equals("marea"))
        {
            String nombre = request.getParameter("nombre");
            String descrip = request.getParameter("descrip");
            int ranking = Integer.valueOf(request.getParameter("ranking"));
            int idt = Integer.valueOf(request.getParameter("idt"));
            int id = Integer.valueOf(request.getParameter("id"));
            Area area = new Area();
            area.setNombre(nombre);
            area.setDescripcion(descrip);
            area.setRanking(ranking);
            area.setIdtrab(idt);
            area.setId(id);
            area.Marea(area);
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("Area modificada");
        }
        else if(flag.equals("earea"))
        {
            int id = Integer.valueOf(request.getParameter("id"));
            Area area = new Area();
            area.Earea(id);
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("Area eliminada");
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
