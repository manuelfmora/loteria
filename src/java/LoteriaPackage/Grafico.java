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
         //Cogemos los datos del POST
        String boleto=request.getParameter("boleto");
        
       
        
        
          //Variables
        int numboleto = 0;
        String error_boleto = "";
        String error_apuesta = "";
        String pantalla2="";
        String pantalla3="";
        int numbol=0;//numeros boletos
        int napuestas=0;//numero apuestas
        boolean hayerror=false;

        
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
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Grafico.jsp");

            request.setAttribute("boleto", boleto);

            request.setAttribute("error_boleto", error_boleto);
            request.setAttribute("pantalla2", pantalla2);

            dispatcher.forward(request, response);//Redirigimos al formulario de la apuseta
            
        } 
        
        if(request.getParameter("napuesta")!="Continuar" && request.getParameter("napuesta")!=null){
                 out.println("ENTRA SEGUNDO IF");
             //Valor para que solo se muetre la pantalla 2.
             pantalla2="ok";
             //Número de boletos
             String boletos=request.getParameter("NumBoletos");
             
             //Número de boletos pasados a entero
             
             numbol=Integer.parseInt(boletos);
             
//------------------------ GENERAMOS ARRAY CON LOS NUMEROS DE APUESTAS ---------------------------------------             
             //Generamos array para las apuesta de cada boleto
             String [] boletoApuesta=new String[numbol];
             
             for(int i=0;i<numbol;i++){
                 //Añadimos a la palabra apuesta en numero correspondiente
                 String apuesta="apuesta"+(i+1);
                 //Cogemos el valor del número de apuesta de cada boleto
                 String apuestas=request.getParameter(apuesta);
                 //CREAMOS ARRAY BOLETO APUESTA EN EL QUE VAN LOS NÚMEROS DE BOLETOS
                 //Número de apuetas de cada boleto
                 boletoApuesta[i]=apuestas;
                 if (apuestas == "") {
                     error_apuesta = "Debes de introducir un valor";
                     
                     hayerror=true;
                     
                 }
                 
//                 out.println("EL BOLETO "+i+"TIENE: "+apuestas);

             }
             //Si hay error en la opción del select lo mostramos por pantalla.
             if(hayerror==true){
                //Pasamos los datos a NumApuestas.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Grafico.jsp");
                request.setAttribute("error_apuesta", error_apuesta);
                request.setAttribute("pantalla2", pantalla2);
                //Redirigimos al formulario de la apuseta
                dispatcher.forward(request, response);
                
        //------------------------ / GENERAMOS ARRAY CON LOS NUMEROS DE APUESTAS ---------------------------------------
             }else{
                 int totalApuestas=0;
                for(int i=0;i<boletoApuesta.length;i++){
                  int a=   Integer.parseInt(boletoApuesta[i]);
                  totalApuestas+=a;
                }
                 //Importe Total
                 int total=0;                
                 //Array donde irán los números de la apuesta.
                 String [] numApuesta=new String[7];               


                  //Número de apuestas
                  napuestas=boletoApuesta.length;
                 
                     //RECORREMOS EL NUMERO DE BOLETOS
                for( int x=0;x<boletoApuesta.length;x++){
                    
                    //Imprimimos el número del boleto
                    out.println("<h1>Boleto "+(x+1)+"º </h1>");
                    int[] [][] BOLETO_FINAL =new int[numbol][totalApuestas][7];
                      BOLETO_FINAL[x][0][0]=x;
                  
                    //Obtenemos el número de apuestas de cada boleto
                    int numeroApuesta= Integer.parseInt(boletoApuesta[x]);
//                    out.println("LOS NUMERO PARA EL BOLETO "+boletoApuesta[x]+ "QUE TIENE "+numeroApuesta+" APUESTAS");
                      
                     //RECORREMOS EL NUMERO DE APUESTA DE CADA BOLETO
                    for(int y=0;y<numeroApuesta;y++){
                        BOLETO_FINAL[x][y][0]=y;
                        //Sacamos la apuseta con su número
                         out.println("<br>Apuesta "+(y+1)+": ");
                         //Sumamos cada apuseta en una variable TOTAL
                         total++;
                         //A CADA APUESTA LE INSERTAMOS 5 NÚMEROS Y EL REINTEGRO
                        for(int i=0;i<7;i++){
                           int numeroAleatorio=(int)Math.round(Math.random()*49);
                           BOLETO_FINAL[x][y][i]=numeroAleatorio;
                            if (i < 6) {
                                if (i < 5) {
                                    out.println(numeroAleatorio + ",");
                                } else {
                                    
                                    out.println(numeroAleatorio);
                                }
                                   
                            //Son los siete nuemros que generaremos para cada apuesta
                            numApuesta[i]=numeroAleatorio+"";
                           }else{
//                               out.println("<br>Num Apuestas: "+numeroApuesta);
//                               out.println("<br>Valor Y: "+(y+1));
                               if(numeroApuesta==(y+1)){
                                   out.println("<br>Reintegro: "+numeroAleatorio);
                                   out.println("<br>Importe Boleto: "+(y+1)+" €");
                                   
                               }
                             
                                
                           }
//                           out.println("Numeros de la apueta "+(i+1)+"es:"+numApuesta[i]);
                        }
                        
//                          boletoApuesta[x]=numApuesta;
                        


                    }
                }//---------------->primer for
                pantalla3="ok";
                                //Pasamos los datos a NumApuestas.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Grafico.jsp");
                request.setAttribute("pantalla3",pantalla3);//Activamos la pantalla 3
                request.setAttribute("numbol",numbol);//Número boletos
                request.setAttribute("napuestas",napuestas);//Número apuestas              
                request.setAttribute("total",total);//Importe total
                request.setAttribute("BOLETO_FINAL", BOLETO_FINAL);//Array multidimencional
//                request.setAttribute("total",total);
                //Redirigimos al formulario de la apuseta
                dispatcher.forward(request, response);

                 
             }
             

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
