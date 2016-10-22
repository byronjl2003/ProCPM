/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.conexion.Area;
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
@WebServlet(name = "CrudProfesional", urlPatterns = {"/CrudProfesional"})
public class CrudProfesional extends HttpServlet {

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
            out.println("<title>Servlet CrudProfesional</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrudProfesional at " + request.getContextPath() + "</h1>");
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
        
        System.out.println("LLEGO AL POST DESDE AJAX CrudProfesional");
        String flag = request.getParameter("flaa");
        System.out.println(flag);
        if(flag.equals("submitProfes"))
        {
            //set_trabajador(String nombre,String usuario,String pass,String date,char tip,char tipj,float salario,float comision)
            String nombre = request.getParameter("nombre");
            String usuario = request.getParameter("usuario");
            String pass = request.getParameter("pass");
            String date = request.getParameter("date");
            char tip = request.getParameter("tip").charAt(0);
            char tipj = request.getParameter("tipj").charAt(0);
            float salario = Float.valueOf(request.getParameter("salario"));
            float comision = Float.valueOf(request.getParameter("comision"));
            Usuario usu = new Usuario();
            usu.set_trabajador(nombre, usuario, pass, date, tip, tipj, salario, comision);
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("Se a creado el trabajador satisfactoriamente");
            
            
        }
        else if(flag.equals("getprofes"))
        {
            Usuario usu = new Usuario();
            ArrayList<Usuario> lista = usu.get_trabajadores();
            Iterator<Usuario> it = lista.iterator();
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            while(it.hasNext())
            {
                Usuario aa = it.next();
                out.println("<option value=\""+aa.getId()+"\">"+aa.getNombre()+"</option>");
                
            }
            
        }
        else if(flag.equals("getinfo"))
        {
            int idusu = Integer.valueOf(request.getParameter("idusu"));
            Usuario usu = new Usuario();
            usu.getInfo(idusu);
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("<table id=\"2tabformtrabajadoresmod\"> ");
            out.println("<tr>\n" +
"                        <td>Nombre:</td>\n" +
"                        <td><input class=\"form-control\" type=\"text\" id=\"2txtnombremod\" value=\""+usu.getNombre()+"\"></input></td>\n" +
"                        \n" +
"                    </tr>");
            
            out.println("<tr>\n" +
"                        <td>Usuario:</td>\n" +
"                        <td><input class=\"form-control\" type=\"text\" id=\"2txtusuariomod\" value=\""+usu.getCorreo()+"\"></input></td>\n" +
"                        \n" +
"                    </tr>");
            
            out.println("<tr>\n" +
"                        <td>Password:</td>\n" +
"\n" +
"                        <td><input class=\"form-control\" type=\"password\" id=\"2txtpassmod\" value=\""+usu.getPassword()+"\"></input></td>\n" +
"                        \n" +
"                    </tr>");
            
            out.println("<tr>\n" +
"                        <td>Confirmacion:</td>\n" +
"\n" +
"                        <td><input class=\"form-control\" type=\"password\" id=\"2txtpass2mod\" placeholder=\"Confirmacion\"></input></td>\n" +
"                        \n" +
"                    </tr>");
            System.out.println("FECHA DEL TRABAJADOR:"+usu.getFechaInicio().toString());
            String fecc[] = usu.getFechaInicio().toString().split("-");
            String fechita = ""+fecc[0]+"/"+fecc[1]+"/"+fecc[2];
            System.out.println("FECHA DEL TRABAJADOR:"+fechita);
            out.println("<tr>\n" +
"                        <td> Fecha Ini:</td>\n" +
"\n" +
"                        <td><input class=\"form-control\" type=\"date\" id=\"2txtdatemod\"  value=\""+usu.getFechaInicio().toString()+"\"></input></td>\n" +
"                        \n" +
"                    </tr>");
            
            
            
            
            out.println("<tr>\n" +
"                        <td>Tipo:</td>\n" +
"                        <td>");
            
            out.println("<select class=\"form-control\" id=\"2selecttipomodi\">");
            
            if(usu.getTipo()=='A')
            {
                out.println("<option value=\"A\" selected>Administrador</option>");
                out.println("<option value=\"T\">Trabajador</option>  ");
                
            }
            else
            {
                out.println("<option value=\"A\" >Administrador</option>");
                out.println("<option value=\"T\" selected>Trabajador</option>  ");
            }
            out.println("</select>");
            
            out.println("</td>");
            out.println("</tr>");
            
            out.println(" <tr>\n" +
"                        <td>Salario:</td>\n" +
"                        <td><input class=\"form-control\" type=\"number\" id=\"2txtsalariomodi\" value=\""+usu.getSalario()+"\"></input></td>\n" +
"                        \n" +
"                    </tr>");
            
            out.println("<tr>\n" +
"                        <td>Comision:</td>\n" +
"                        <td><input class=\"form-control\" type=\"number\" id=\"2txtcomisionmodi\" value=\""+usu.getComision()+"\"></input></th>\n" +
"                        \n" +
"                    </tr>");
            
            out.println("<tr>");
            out.println("<td>");
            out.println("<button class=\"btn btn-primary\" id=\"2btnsubmitmodreg\" onclick=\"javascript:jsmodprofes();\"><span class=\"fa fa-save\"></span> Modificar</button>");
            out.println("</td>");
            
            out.println("<td>");
             out.println("<button class=\"btn btn-danger\" id=\"2btnsubmitmodreg\" onclick=\"javascript:jselimprofes();\"><span ></span> Eliminar</button>");
            out.println("</td>");
            
            out.println("</tr>");
            
            out.println("</table>");
            
            
        }
        else if(flag.equals("mprofes"))
        {
            
        }
        else if(flag.equals("eprofes"))
        {
            
        }
        else if(flag.equals("getAreasSinJefe"))
        {
            Area area = new Area();
            ArrayList<Area> lista = area.getAreasSinJefe();
            Iterator<Area> it = lista.iterator();
            response.setContentType( "text/html; charset=iso-8859-1" );
            PrintWriter out = response.getWriter();
            out.println("<select id=\"2selectareajefe\" class=\"form-control\">");
            while(it.hasNext())
            {
                Area us = it.next();
                out.println("<option value=\""+us.getId()+"\">"+us.getNombre()+"</option>");
            }
            out.println("</select>");
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
