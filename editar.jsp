
<%@page import="com.emergentes.modelo.Calificacion"%>
<%
    Calificacion cal =(Calificacion) request.getAttribute("miobjcal");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
        /* Estilos para el formulario */
        form {
            max-width: 400px; /* Ancho máximo del formulario */
            margin: 20px auto; /* Centrado horizontal */
            padding: 20px; /* Espaciado interno */
            background-color: #f9f9f9; /* Color de fondo del formulario */
            border: 1px solid #ccc; /* Borde del formulario */
            border-radius: 5px; /* Borde redondeado */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra */
        }

        label {
            display: block; /* Convertir en bloque para alinear verticalmente */
            margin-bottom: 10px; /* Espaciado inferior */
            font-weight: bold; /* Texto en negrita */
        }

        input[type="text"], input[type="number"] {
            width: 100%; /* Ancho completo */
            padding: 8px; /* Espaciado interno */
            margin-bottom: 20px; /* Espaciado inferior */
            border: 1px solid #ccc; /* Borde */
            border-radius: 5px; /* Borde redondeado */
        }

        input[type="submit"] {
            width: 100%; /* Ancho completo */
            padding: 10px; /* Espaciado interno */
            background-color: #007bff; /* Color de fondo */
            color: #fff; /* Color del texto */
            border: none; /* Sin borde */
            border-radius: 5px; /* Borde redondeado */
            cursor: pointer; /* Cambiar cursor al pasar el mouse */
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* Cambiar color de fondo al pasar el mouse */
        }
        h1{
                text-align: center;

            }
    </style>
    </head>
    <body>
        <h1>Registro de Estudiante</h1>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="<%= cal.getId() %>" size="2" readonly></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<%= cal.getNombre() %>"></td>
                    
                </tr>
                <tr>
                    <td>P1(30)</td>
                    <td><input type="text" name="p1" value="<%= cal.getP1() %>"></td>
                    
                </tr>
                <tr>
                    <td>P2(30)</td>
                    <td><input type="text" name="p2" value="<%= cal.getP2() %>"></td>
                    
                </tr>
                <tr>
                    <td>EF(40)</td>
                    <td><input type="text" name="ef" value="<%= cal.getEf() %>"></td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"  value="enviar"></td>
                    
                </tr>
            </table>
            
        </form>
    </body>
</html>
