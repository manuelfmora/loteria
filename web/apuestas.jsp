<%-- 
    Document   : apuestas
    Created on : 06-jun-2016, 17:13:42
    Author     : jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%!
        boolean EstaEnApuestas(int apuestas[], int apuesta) {
            for (int i = 0; i < apuestas.length; i++) {
                if (apuesta == apuestas[i]) {
                    return true;
                }
            }
            return false;
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <a href="menu.jsp?modo=1">Texto</a>
        <a href="menu.jsp?modo=2">Gráfico</a>
    </center>
    <%
        int modo;
        modo = Integer.parseInt("2");
        int n;
        int a;
        String numero[];
        n = Integer.parseInt("3");//apuesta
        //numero = String.valueOf(n);
        //numero= Integer.toString(n);
        int apuesta[];
        apuesta = new int[n];
        numero = new String[n];
        String nombre;
        int b;
        out.print("<h2>Apuestas Generadas</h2>");
        int precio_boleto;
        precio_boleto = 0;
        int precio;
        precio = 0;
        for (a = 0; a < n; a++) {
            b = a + 1;
            numero[a] = String.valueOf(b);
            numero[a] = Integer.toString(b);
            nombre = "numero".concat(numero[a]);
            apuesta[a] = Integer.parseInt("1".concat(numero[a]));//numero
            out.print("<h4>Boleto " + b + "º</h4>");
            double r;
            r = Math.floor(Math.random() * 9 + 1);
            int reintegro;
            reintegro = (int) r;
            int numeros[];
            numeros = new int[6];
            if (modo == 1) {
                for (int c = 0; c < apuesta[a]; c++) {
                    precio_boleto++;
                    precio++;
                    int d;
                    d = c + 1;
                    out.print("<p>Apuesta " + d + ": ");
                    for (int k = 0; k < 6; k++) {
                        r = Math.floor(Math.random() * 49 + 1);
                        int num;
                        num = (int) r;
                        for (int t = 0; t < 6; t++) {
                            if (num == numeros[t]) {
                                r = Math.floor(Math.random() * 49 + 1);
                                num = (int) r;
                                t = 0;
                            }
                        }
                        numeros[k] = num;
                    }

                    for (int i = 0; i < (numeros.length); i++) {
                        for (int j = i + 1; j < numeros.length; j++) {
                            if (numeros[i] > numeros[j]) {
                                //Intercambiamos valores
                                int variableauxiliar = numeros[i];
                                numeros[i] = numeros[j];
                                numeros[j] = variableauxiliar;

                            }
                        }
                    }
                    for (int z = 0; z < 6; z++) {
                        if (z < 5) {
                            out.print(numeros[z] + ",");
                        } else {
                            out.print(numeros[z]);
                        }
                    }
                }

                out.print("<h5>Reintegro: " + reintegro + "</h5>");
                out.print("Importe Boleto: " + precio_boleto + "€");
                precio_boleto = 0;
            }
            if (modo == 2) {//---------------------------------------------------------------------------------------------------------------------------
                out.print("Reintegro: " + reintegro);
                out.print("<br>Importe del Boleto: " + apuesta[a] + "€");
    %>
    <table border="2px" style="border-color: green; border-collapse: initial; " >
        <tr>


            <%
                for (int c = 0; c < apuesta[a]; c++) {
                    precio++;
                    int d;
                    d = c + 1;

                    for (int k = 0; k < 6; k++) {
                        r = Math.floor(Math.random() * 49 + 1);
                        int num;
                        num = (int) r;
                        for (int t = 0; t < 6; t++) {
                            if (num == numeros[t]) {
                                r = Math.floor(Math.random() * 49 + 1);
                                num = (int) r;
                                t = 0;
                            }
                        }
                        numeros[k] = num;
                    }

            %><td>
                <table border="" style="color: green; border-color: green;">
                    <%  
                        for (int fila = 0; fila < 10; fila++) {
                            out.print("<tr>");
                            for (int colum = 0; colum < 5; colum++) {
                                int casilla;
                                casilla = colum * 10 + fila;
                                if (casilla == 0) {
                                    out.print("<td style='background-color:green; color:white;'>" + d + "</td>");
                                } else 
                                    if (!EstaEnApuestas(numeros, casilla)) {
                                    out.print("<td>" + casilla + "</td>");
                                } else {
                                    out.print("style='background-color:magenta;'>");
                                }
                            }
                            out.print("</tr>");
                        }
                    %>
                </table>
            </td>
            <%
                }
            %></tr>
    </table><%
            }
        }
        out.print("<br>El Importe Total que debe abonar son: " + precio + "€");
    %>
</body>
</html>
