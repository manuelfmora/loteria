<%-- 
    Document   : NumApuetas
    Created on : 09-jun-2016, 21:26:38
    Author     : Manuel Mora
--%>
<%!
    String numboleto=""; 
    String verror_boleto="";
    String verror_apuesta="";
    String pantalla2="";
    String pantalla3="";    
    //Variables para crear array
    int numbol=0;
    int napuestas=0;
    int[][][] BOLETO_FINAL;  //=new int[1][1][7];
   
    //int[] [][] BOLETO_FINAL=new int [1][1][7]; 
    //Variables para recorrer array
    int boleto=0;
    int apuesta=0;
    int[] Arraynum = new int[7];//Array añadir los numeros del sorteo
    int contador=0;
    
%>
<%--Asignamos las variables si no son nulas, ya que la 1ª vez que se accede a la app son nulas --%>
<%
    if (request.getAttribute("boleto") != null) {   
        numboleto = (String) request.getAttribute("boleto");   
    }
   if (request.getAttribute("error_boleto") != null) {
        verror_boleto = (String) request.getAttribute("error_boleto");
    }
    if (request.getAttribute("error_apuesta") != null) {
        verror_apuesta = (String) request.getAttribute("error_apuesta");
    }
    if (request.getAttribute("pantalla2") != null) {
        pantalla2 = (String) request.getAttribute("pantalla2");
    }
      if (request.getAttribute("pantalla3") != null) {
        pantalla3 = (String) request.getAttribute("pantalla3");
    }
    //Generamos el array
    if (request.getAttribute("numbol") != null) {
        numbol =(int) request.getAttribute("numbol");
    }
    if (request.getAttribute("napuestas") != null) {
        napuestas = (int) request.getAttribute("napuestas");
       
    }   
    if (request.getAttribute("BOLETO_FINAL") != null) {
 
           BOLETO_FINAL=new int[numbol][napuestas][7];
          /*int[][][]*/ BOLETO_FINAL=(int [][][]) request.getAttribute("BOLETO_FINAL");
          
          int a=napuestas;
        
    }
  
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Numero Apuestas</title>
        <link rel="stylesheet" type="text/css" href="assets/style.css" media="screen" />
    </head>
    <body>
        <%--Incluimos menú --%>
        <%@ include file="index.jsp"%>
        <%--Mostramos la pantalla 1--%>
        <%if (pantalla2.equals("")&&pantalla3.equals("")){
             out.println("<p>1 if<p>"); 
            out.println("<p>pantalla 2:"+pantalla2+"<p>"); 
            out.println("<p>pantalla 3:"+pantalla3+"<p>"); 
        %>
        
           
        <center>
            
            <h1>Número de boletos para apostar.</h1>
            <form method="get" action="grafico">
                <p>
                    Nº Boletos: <input type="tex" name="boleto" value="<%=numboleto%>">
                <%--Si se ha producido un error, mostramos mensaje --%>
                <%
                    if (!verror_boleto.equals("") && !verror_boleto.equals(null)) {
                        out.println("<span class='error'>" + verror_boleto + "</span>");
                    }
                %>
                </p>
                <p>
                    <input type="submit" value="Continuar" name="nboletos" >
                </p>
            </form>
        </center>
    <%}%>
    <%-- / Mostramos la pantalla 1--%>
    
    <%-- Mostramos la pantalla 2--%>
    <%if(!pantalla2.equals("")&&pantalla3.equals("")){
         out.println("<p>2 if<p>"); 
          out.println("<p>pantalla distinta 2:"+pantalla2+"<p>"); 
          out.println("<p>pantalla 3:"+pantalla3+"<p>"); 
    
    %>
            <center>            
            <h1>Se juegan <%=numboleto%> boletos .</h1>
            <form method="get" action="grafico">
                <%for(int i=1;i<= Integer.parseInt(numboleto);i++){%>
                    <p>
                        Boleto <%=i%> - Apuestas:
                        <select name="apuesta<%=i%>">
                            <option value="" selected="selected" >Seleccione</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select>
                         <%--Si se ha producido un error, mostramos mensaje --%>
                        <%
                            if (!verror_apuesta.equals("") && !verror_apuesta.equals(null)) {
                                out.println("<span class='error'>" + verror_apuesta + "</span>");
                            }
                        %>
                    </p>               
                <%pantalla3="";
                  pantalla2="";
                %>
                <%}%>
                    <p>                     
                        <input type="hidden" value="<%=numboleto%>" name="NumBoletos">
                        <input type="submit" value="Continuar" name="napuesta" >
                    </p>
            </form>
        </center>
            <%}%>
          <%-- / Mostramos la pantalla 2--%>
          
          <%-- Mostramos la pantalla 3--%>
        
      <%if(!pantalla3.equals("")){
       out.println("<p>3 if<p>");
       out.println("<p>pantalla 3:"+pantalla3+"<p>");
      
      
      %><%-- / Mostramos la pantalla 3--%>
        <%-- Pintamos el boleto--%>
        <%! 
          //  int[][][] BOLETO_FINAL=new int[1][1][7];      
        %>
        
        <%--
                 BOLETO_FINAL[0][0][0]=1;
                 BOLETO_FINAL[0][0][1]=2;
                 BOLETO_FINAL[0][0][2]=3;
                 BOLETO_FINAL[0][0][3]=4;
                 BOLETO_FINAL[0][0][4]=15;
                 BOLETO_FINAL[0][0][5]=6;
                 BOLETO_FINAL[0][0][6]=7;

       --%>
      
        <% for (int boleto = 0; boleto < numbol; boleto++) {
              System.out.println("Valor boleto:"+boleto);
        %>

        <table border="1">
            <tr> 

            <% 
             
               
                
             for (int apuestas = 0; apuestas <boleto; apuestas++) {  
              //   apuesta=BOLETO_FINAL[boleto][apuestas][0];
              //Pasamos los datos a un array de numeros
              
             int n=0;//contador ponemos a cero para el array denumeros
              if(apuestas<boleto){
                  contador++;
                  for(int i=0;i<7;i++){
                     Arraynum[i]=BOLETO_FINAL[(boleto-1)][apuesta][i];
                  }
              }
              
                 System.out.println("Valor apuesta:"+apuestas);
            %> 
                
            <td><%-- TD1--%>
<%---------------------------------------------------------------------------------------------%>
                <table border="1">
              <% for (int fila = 0; fila < 10; fila++) {
                      
                  
                    out.print("<tr>");
                       for (int col = 0; col < 5; col++) { 
                   out.print("<td>");
                            
                            
                            if (fila == 0 && col == 0) {
                                out.print(apuestas+1);
                            }//FIN IF
                            else {
                                
                                   int num = col * 10 + fila;
                                   if (estaEnApuesta(Arraynum, num)){
                                        // Nº de apuesta
                                       out.print("<strong style: color:red>"+num+"</strong>");
                                   }
                                   else{
                                       
                                        out.print(num);
                                   }
                                      
                            }//FIN ELSE
                       
                         
                    
                        out.print("</td>");
                       }//-- Fin  for COLUMNAS --
                    out.print("</tr>");
                        } %><%-- Fin  for FILAS--%>
                </table>
<%---------------------------------------------------------------------------------------------%>

           <%}%><%-- Fin segundo for APUESTAS--%>
          
         <%}%><%-- Fin primer for BOLETOS--%>
         
         
         
 <%}%>  <%-- / Mostramos la pantalla 3--%>
     <%pantalla3= "";%>   
          
    <%!
        boolean estaEnApuesta(int apuestas[], int numerofila) {
            for (int i = 0; i < apuestas.length; i++) {
                if (numerofila == apuestas[i]) {
                    return true;
                }
            }
            return false;
        }
    %>  
        
    </body>
</html>
