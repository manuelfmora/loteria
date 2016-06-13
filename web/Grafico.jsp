.<%-- 
    Document   : Grafico
    Created on : 12-jun-2016, 10:40:20
    Author     : Manuel Mora
--%>

<%--Declaramos las variables --%>
<%!
    String tabla = "";    

%>
<%--Asignamos las variables si no son nulas, ya que la 1ª vez que se accede a la app son nulas --%>
<%
    if (request.getAttribute("tabla") != null) {
        tabla = (String) request.getAttribute("tabla");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modo Gráfico</title>
    </head>
    <body>      

        <% int apuesta=1; %>
        <table border="1">
            <% for(int fila=0; fila<10; fila++) { %>
            <tr>
                <%  for(int col=0; col<5; col++) { %>
                <td> <% 
                    if (fila==0 && col==0) {
                       out.print(apuesta);
                    }
                    else {
                        int num=col*10+fila;
                        /*
                        if (num  esta en ListaApuestas) {
                            muestro seleccionado
                        else
                            muestro normal
                        }
                        */
                        out.print(num);
                    } %>
                </td>
                <%} %>
            <tr>
            <%} %>
        </table>

    </body>
</html>
