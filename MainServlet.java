package com.emergentes.controlador;

import com.emergentes.modelo.Calificacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        Calificacion cal = new Calificacion();
        int id, pos;

        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");

        switch (op) {
            case "nuevo":
                //enviar un objeto vacio a editar
                request.setAttribute("miobjcal", cal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                //enviar un objeto a editar
                id = Integer.parseInt(request.getParameter("id"));
                //averiguar elemnto
                pos = buscarPorIndice(request, id);
                cal = lista.get(pos);
                request.setAttribute("miobjcal", cal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);

                break;
            case "eliminar":
                //eliminae el registro segun id
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request, id);
                if (pos >= 0) {
                    lista.remove(pos);
                }
                request.setAttribute("listacal", lista);
                response.sendRedirect("index.jsp");
                break;
            default:
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        Calificacion cal = new Calificacion();
        cal.setId(id);
        cal.setNombre(request.getParameter("nombre"));

        // Verificar si los parámetros son null antes de convertirlos a enteros
        String p1Str = request.getParameter("p1");
        String p2Str = request.getParameter("p2");
        String efStr = request.getParameter("ef");

        if (p1Str != null && p2Str != null && efStr != null) {
            cal.setP1(Integer.parseInt(p1Str));
            cal.setP2(Integer.parseInt(p2Str));
            cal.setEf(Integer.parseInt(efStr));
        }

        if (id == 0) {
            //nuevo registro
            int idNuevo = obtenerId(request);
            cal.setId(idNuevo);
            lista.add(cal);
        } else {
            int pos = buscarPorIndice(request, id);
            lista.set(pos, cal);
        }
        request.setAttribute("listacal", lista);
        response.sendRedirect("index.jsp");
    }

    public int buscarPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");

        int pos = -1;
        if (lista != null) {
            for (Calificacion ele : lista) {
                ++pos;
                if (ele.getId() == id) {
                    break;
                }
            }
        }
        return pos;

    }

    public int obtenerId(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");

        int idn = 0;
        for (Calificacion ele : lista) {
            idn = ele.getId();
        }
        return idn + 1;
    }

}
