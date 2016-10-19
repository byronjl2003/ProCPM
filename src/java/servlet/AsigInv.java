/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.conexion.Invento;
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
public class AsigInv extends HttpServlet {

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
        Object idinv = request.getSession().getAttribute("idInv");
        Invento invento;
        String idsInv = request.getParameter("inventores");
        String ids[] = idsInv.split(",");
        int codInventor;
        int codIn;
        if(idinv!=null){
            codIn = (int)idinv;
            invento = new Invento();
            invento.setId(codIn);
            request.getSession().removeAttribute("idInv");
            
            for (String idsInv1 : ids) {
                codInventor = Integer.parseInt(idsInv1);
                invento.setInventor(codInventor);
            }
            response.setContentType("text/html; charset=utf8");
            PrintWriter out = response.getWriter();
            out.println("hecho");
        }else{
            request.setAttribute("error", "No se puede guardar no se ha creado un invento previamente");
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
        if(id!=null){
            this.processRequest(request, response);
        }else{
            response.sendRedirect("/ProCPM");
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
