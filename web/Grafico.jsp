<%-- 
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
        <form action="grafico" method="post">
            <input type="submit" name="" value="Aceptar"/>
        </form>

           <%--Mostramos la tabla generada --%>
        <%  if (!tabla.equals("")) {
                out.println(tabla);
            }
        %>
        
        <%--     <table border="1">
            
            <tr><!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
                <%for(int i=0;i<3;i++){%>
                <td>1</td>
                 <%}%>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
            </tr>
             
            <tr>
                <td>1</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>2</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>3</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>4</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>5</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>6</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>7</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>8</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
                <td>cuerpo</td>
            </tr>
            <tr>
                <td>9</td>
                <td>pie</td>
                <td>pie</td>
                <td>pie</td>
                <td>pie</td>
            </tr>
            
        </table>-->
     --%> 

    </body>
</html>
