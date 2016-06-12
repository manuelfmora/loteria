/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoteriaPackage;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuel Mora
 */
public class Grafico extends HttpServlet {

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
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Grafico.jsp");
     
        String tabla = Tablas();
        request.setAttribute("tabla", tabla);
        dispatcher.forward(request, response);//Redirigimos al formulario de la tabla de multiplicar
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Grafico</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Grafico at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    /**
     * Devuelve las tablas del 1 al 10
     *
     * @return HTML generado de la tabla
     */
    protected String Tablas() {

        String html = "";
        int decena=1;

        html += "<table border= '1'>";
        
        for (int i = 1; i <= 50; i++) {

            //Para que muestre dos líneas
            if (i == 1) {
                html += "<tr><!--Inicio 1 tr-->";//primer TR

            }

            html += "<td><!--Inicio 1 TD-->";
            if (i == 1) {
                html += "1";
            }//Dibuja los números del boleto
            if (i > 1 && i < 6) {
                html += decena + "0";
                decena++;
            }
            //Dibuja el primer uno de la izquierda
            if (i == 6) {
                html += "1";
            }
            if (i > 6 && i < 11) {

                html += (decena - 4) + "1";
                decena++;
            }
            if (i == 11) {
                html += "2";
            }
            if (i > 11 && i < 16) {

                html += (decena - 8) + "2";
                decena++;
            }
 if (i == 16) {
                html += "3";
            }
            if (i > 16 && i < 21) {

                html += (decena - 12) + "3";
                decena++;
            }
             if (i == 21) {
                html += "4";
            }

            if (i > 21 && i < 26) {

                html += (decena - 16) + "4";
                decena++;
            }
              if (i == 26) {
                html += "5";
            }
            if (i > 26 && i < 31) {

                html += (decena - 20) + "5";
                decena++;
            }
              if (i == 31) {
                html += "6";
            }
            if (i > 31 && i < 36) {

                html += (decena - 24) + "6";
                decena++;
            }
              if (i == 36) {
                html += "7";
            }
            if (i > 36 && i < 41) {

                html += (decena - 28) + "7";
                decena++;
            }
              if (i == 41) {
                html += "8";
            }
            if (i > 41 && i < 46) {

                html += (decena - 32) + "8";
                decena++;
            }  
            if (i == 46) {
                html += "9";
            }
            if (i > 46 && i < 51) {

                html += (decena - 36) + "9";
                decena++;
            }

            html += "</td><!-- / Inicio 1 TD-->";

            if (i % 5 == 0) {
                html += "</tr><!--/ Inicio 1 tr-->";//fin primer TR
            }

        }
    
        html += "</table>";
        return html;
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
        processRequest(request, response);
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
