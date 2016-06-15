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
%>
<%--Asignamos las variables si no son nulas, ya que la 1ª vez que se accede a la app son nulas --%>
<%if (request.getAttribute("boleto") != null) {   
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
        <%if (pantalla2.equals("")){%>
                    
        <center>
            
            <h1>Número de boletos para apostar.</h1>
            <form method="get" action="loteria">
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
    <%if(!pantalla2.equals("")){%>
            <center>            
            <h1>Se juegan <%=numboleto%> boletos .</h1>
            <form method="get" action="loteria">
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
                
                <%}%>
                    <p>                     
                        <input type="hidden" value="<%=numboleto%>" name="NumBoletos">
                        <input type="submit" value="Continuar" name="napuesta" >
                    </p>
            </form>
        </center>
            <%}%>
          <%-- / Mostramos la pantalla 2--%>
    </body>
</html>
