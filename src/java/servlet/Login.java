/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.conexion.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author wxjoy
 */
public class Login extends HttpServlet {

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
        Object  orol;
        char rol;
        
        orol = request.getSession().getAttribute("rol");
        
        rol = (char)orol;
        
        switch(rol){
            case 'A':
                /**si es administrador se va 
                 * a la pagina correspondientes
                 */
                response.sendRedirect("/ProCPM/Admin/AInicio.jsp");
                break;
            case 'T':
                /**
                 * Si es trabajador se va a la 
                 * de trabajadores
                 */
                response.sendRedirect("/ProCPM/User/TInicio.jsp");
                break;
            default:
                /**
                 * No se reconoce el rol que se ha asignado al
                 * usuario, no se le permite entrar y se borran
                 * sus datos de la sesion
                 */
                request.getSession().removeAttribute("id");
                request.getSession().removeAttribute("nombre");
                request.getSession().removeAttribute("rol");
                request.getSession().setAttribute("error", "No se reconoce el rol del usuario");
                response.sendRedirect("/ProCPM");
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
        response.sendRedirect("/ProcCPM/");
        
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
        
        boolean val;
        int id;
        String correo;
        String clave;
        
        correo = request.getParameter("correo");
        clave = request.getParameter("clave");
        val = correo != null && clave != null;
        
        if(val){
            Usuario u = new Usuario();
            u.loginUsuario(correo, clave);
            if(u.getId() > 0){
               request.getSession().setAttribute("id", u.getId());
               request.getSession().setAttribute("nombre", u.getNombre());
               request.getSession().setAttribute("rol", u.getRol());
               this.processRequest(request, response);
            }else{
                request.getSession().setAttribute("error", "Credenciales invalidas");
                response.sendRedirect("/ProCPM/login.jsp");
            }
        }else{
            request.getSession().setAttribute("error", "Datos invalidos");
            response.sendRedirect("/ProCPM/login.jsp");
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
