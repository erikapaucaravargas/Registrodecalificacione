<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Calificacion"%>
<%
    if (session.getAttribute("listacal") == null) {
        ArrayList<Calificacion> lisaux = new ArrayList<Calificacion>();
        session.setAttribute("listacal", lisaux);
    }
    ArrayList<Calificacion> lista = (ArrayList<Calificacion>) session.getAttribute("listacal");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            /* Estilos para la tabla */
            table {
                width: 80%; /* Ancho de la tabla */
                margin: 0 auto; /* Centrado horizontal */
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2; /* Color de fondo de filas pares */
            }

            tr:hover {
                background-color: #ddd; /* Cambio de color de fondo al pasar el mouse */
            }
            .btnuevo {
            display: block; /* Convertir en bloque para centrar */
            width: 200px; /* Ancho del botón */
            margin: 20px auto; /* Centrado horizontal */
            color: white;
            text-align: center; /* Centrado del texto */
            padding: 10px; /* Espaciado interno */
            background-color: chocolate; /* Color de fondo del botón */
            border-radius: 5px; /* Borde redondeado */
            cursor: pointer; /* Cambiar el cursor al pasar el mouse */
            text-decoration: none; /* Eliminar subrayado */
        }

            .btnuevo:hover {
                background-color: #0056b3; /* Cambiar color de fondo al pasar el mouse */
            }
            h1{
                text-align: center;

            }
            .encabezado{
                font-size:20px; 
                text-align: center;
                padding: 1px;
                border-width: 6px;
                border-color: chocolate;
                border-style: solid;
            }
        </style>
    </head>
    <body>
        <div class="encabezado">
            <p>Primer Parcial TECNOLOGIAS EMERGENTES 742</p>
            <p>Nombre: Erika Paucara Vargas</p>
            <p>CI: 11103824 LP</p>
        </div>

        <h1>Registro de Calificaciones</h1>
        <a href="MainServlet?op=nuevo" class="btnuevo">"Nuevo registro"></a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(20)</th>
                <th>EF(40)</th> 
                <th>Nota</th> 
                <th></th>
                <th></th>
            </tr>
            <%                if (lista != null) {
                    for (Calificacion item : lista) {
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td> 
                <td><%= item.getP1()%></td> 
                <td><%= item.getP2()%></td> 
                <td><%= item.getEf()%></td>  
                <td><%= item.getP1() + item.getP2() + item.getEf()%></td>
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>" onclick="return(confirm('Esta seguro de eliminar??'))"
                       >Eliminar</a>
                </td>
                <%
                        }
                    }
                %>
            </tr>
        </table>
    </body>
</html>
