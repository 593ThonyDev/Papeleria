package com.papeleria.controller;

import com.papeleria.dao.ProductoDao;
import com.papeleria.model.producto;
import com.papeleria.model.usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Productos extends HttpServlet {

    String LOGIN = "index.jsp";
    String CREAR = "views/ProductosCrear.jsp";
    String EDITAR = "views/ProductosActualizar.jsp";
    String REGISTROS = "views/Productos.jsp";

    //Objetos
    producto pro = new producto();
    ProductoDao dao = new ProductoDao();
    //
    Integer idProducto = 0;
    String proNombre;
    String proCodigo;
    Integer proStock;
    Double proPrecio;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        usuario usu = (usuario) session.getAttribute("usuario");
        if (usu == null) {
            request.getRequestDispatcher(LOGIN).forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
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
                case "guardar":
                    proNombre = request.getParameter("proNombre");
                    proCodigo = request.getParameter("proCodigo");
                    proStock = Integer.parseInt(request.getParameter("proStock"));
                    proPrecio = Double.parseDouble(request.getParameter("proPrecio"));
                    pro = new producto(proNombre, proCodigo, proStock, proPrecio);
                    dao.add(pro);
                    acceso = REGISTROS;
                    break;
                case "actualizar":
                    idProducto = Integer.parseInt(request.getParameter("idProducto"));
                    proNombre = request.getParameter("proNombre");
                    proCodigo = request.getParameter("proCodigo");
                    proStock = Integer.parseInt(request.getParameter("proStock"));
                    proPrecio = Double.parseDouble(request.getParameter("proPrecio"));
                    pro = new producto(idProducto, proNombre, proCodigo, proStock, proPrecio);
                    dao.updateById(pro);
                    System.out.println(dao.updateById(pro));
                    acceso = REGISTROS;
                    break;
                default:
                    acceso = LOGIN;
            }
            RequestDispatcher view = request.getRequestDispatcher(acceso);
            view.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("accion");
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
                case "nuevo":
                    acceso = CREAR;
                    break;
                case "editar":
                    request.setAttribute("idProducto", request.getParameter("idProducto"));
                    acceso = EDITAR;
                    break;
                case "eliminar":
                    idProducto = Integer.parseInt((String) request.getParameter("idProducto"));
                    /* ========== ENVIO EL OBJETO A LA DB=========*/
                    dao.deleteById(idProducto);
                    acceso = REGISTROS;
                    break;

                default:
                    acceso = LOGIN;
            }
            RequestDispatcher view = request.getRequestDispatcher(acceso);
            view.forward(request, response);
        }
    }

}
