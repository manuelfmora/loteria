<%-- 
    Document   : NumApuetas
    Created on : 09-jun-2016, 21:26:38
    Author     : Manuel Mora
--%>
<%!
    String boleto=""; 
    String error_boleto="";
%>
<%--Asignamos las variables si no son nulas, ya que la 1ª vez que se accede a la app son nulas --%>
<%if (request.getAttribute("boleto") != null) {
    out.println("Entra en boleto no es null");
        boleto = (String) request.getAttribute("boleto");
    }
   if (request.getAttribute("error_boleto") != null) {
        error_boleto = (String) request.getAttribute("error_boleto");
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
        <%@ include file="index.jsp"%><%--Incluimos menú --%>
        <center>
            
            <h1>Número de boletos para apostar.</h1>
            <form method="pos">
                <p>
                    Nº Boletos: <input type="tex" name="boleto">
                <%--Si se ha producido un error, mostramos mensaje --%>
                <%
                    if (!error_boleto.equals("") && !error_boleto.equals(null)) {
                        out.println("<span class='error'>" + error_boleto + "</span>");
                    }
                %>
                </p>
                <p>
                    <input type="submit" value="Continuar" name="continuar">
                </p>
            </form>
        </center>
    </body>
</html>
