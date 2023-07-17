package com.papeleria.controller;

import com.papeleria.model.usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Controlador extends HttpServlet {

    String LOGIN = "index.jsp";
    String VENTA = "views/Ventas.jsp";
    String CLIENTES = "views/Clientes.jsp";
    String PRODUCTOS = "views/Productos.jsp";
    String USUARIOS = "views/Usuarios.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        usuario usu = (usuario) session.getAttribute("usuario");
        if (usu == null) {
            request.getRequestDispatcher(LOGIN).forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String action = request.getParameter("p");
        String acceso = "";
        //========================================================================================== GLOBALES
        HttpSession session = request.getSession();
        usuario usu = (usuario) session.getAttribute("usuario");
        if (usu == null) {
            // si no existe un usuario activo en el servidor se redirige al login
            request.setAttribute("errorSesion", "Debes iniciar sesion, para acceder al contenido!!");
            request.getRequestDispatcher(LOGIN).forward(request, response);
        } else {
            switch (action) {
                case "ventas":
                    acceso = VENTA;
                    break;
                case "clientes":
                    acceso = CLIENTES;
                    break;
                case "productos":
                    acceso = PRODUCTOS;
                    break;
                case "usuarios":
                    acceso = USUARIOS;
                    break;
                default:
                    acceso = LOGIN;
            }
            RequestDispatcher view = request.getRequestDispatcher(acceso);
            view.forward(request, response);
        }
    }

}
