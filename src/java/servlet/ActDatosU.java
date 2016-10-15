/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.conexion.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author wxjoy
 */
public class ActDatosU extends HttpServlet {

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
        String mailA =(String) request.getSession().getAttribute("mail");
        String cambio;
        String msj="/ProCPM/User/cambiard.jsp";
        int id = (int) request.getSession().getAttribute("id");
        String nombre = request.getParameter("uNombre");
        String mail = request.getParameter("uCorreo");
        Usuario u;
        
        if(mailA.equals(mail))
            cambio = "no";
        else
            cambio ="si";
        
        if("si".equals(cambio)){
            u = new Usuario();
            if(!u.isDisponible(mail)){
                request.getSession().setAttribute("error", "El correo ya esta registrado");
                response.sendRedirect(msj);
                return;
            }
        }
        
        u = new Usuario(id,nombre,mail);
        
        response.sendRedirect(msj);
        if(u.cambiarDatos(cambio)){
            request.getSession().setAttribute("hecho", "Se actualizaron los datos");
        }else{
            request.getSession().setAttribute("error", "sucedio un problema al guardar los datos");
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
        response.sendRedirect("/ProCPM");
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
        Object id = request.getSession().getAttribute("id");
        if(id!=null)
            this.processRequest(request, response);
        else
            response.sendRedirect("/Apuestas");
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
