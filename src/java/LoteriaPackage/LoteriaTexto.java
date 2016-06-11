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
public class LoteriaTexto extends HttpServlet {

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
        
        //Cogemos los datos del POST
        String boleto=request.getParameter("boleto");
        
       
        
        
          //Variables
        int numboleto = 0;
//        int nboletos = 0;
        String error_boleto = "";
        String error_apuesta = "";
        String pantalla2="";
//        try {
//             int nboletos=Integer.parseInt(boleto);
//                out.println("Valor de nboletos: "+nboletos);
//        } catch (Exception e) {
//            out.println("Error primer catch");
//        }
        
        out.println("Boton 1ª Pantalla"+request.getParameter("nboletos"));
        out.println("Boton 2ª Pantalla"+request.getParameter("napuesta"));
        
        if(request.getParameter("nboletos")!="Continuar"&& request.getParameter("nboletos")!=null){
              out.println("ENTRA PRIMER IF");
            
                    //Convertimos a entero
            try {
               numboleto=Integer.parseInt(boleto);       
                error_boleto = "";
                pantalla2="ok";
            } catch (Exception e) {               
                error_boleto = "Debes de introducir un número";
                pantalla2="";
            }

           //Pasamos los datos a NumApuestas.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/NumApuestas.jsp");

            request.setAttribute("boleto", boleto);

            request.setAttribute("error_boleto", error_boleto);
            request.setAttribute("pantalla2", pantalla2);

            dispatcher.forward(request, response);//Redirigimos al formulario de la apuseta
            
        } 
        
        if(request.getParameter("napuesta")!="Continuar" && request.getParameter("napuesta")!=null){
                 out.println("ENTRA SEGUNDO IF");
             pantalla2="ok";
             String apuestas=request.getParameter("apuesta1");
             String boletos=request.getParameter("NumBoletos");
             out.println("Numero de apuestas"+apuestas);
             out.println("Numero de boletos: "+boletos);
             if(apuestas==""){
                 
                 error_apuesta = "Debes de introducir un valor";
             }
             
            //Pasamos los datos a NumApuestas.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/NumApuestas.jsp");
            request.setAttribute("error_apuesta", error_apuesta);
            request.setAttribute("pantalla2", pantalla2);
            dispatcher.forward(request, response);//Redirigimos al formulario de la apuseta

        }
            
      
//        String apuestas=request.getParameter("apuestas");
//        out.println("Las apuestas son"+apuestas);
//        int numapuestas=Integer.parseInt(boleto);
//        out.println("Num apuestas en int"+numapuestas);
//        for(int i=0;i<numapuestas;i++){
//            
//           String operacion = request.getParameter("operacion+i");
//           out.println(operacion);
//        }
//        
//        
      
        
 
   
        
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
