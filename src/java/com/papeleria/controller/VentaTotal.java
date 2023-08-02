package com.papeleria.controller;

import com.papeleria.dao.*;
import com.papeleria.model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class VentaTotal extends HttpServlet {

    String LOGIN = "index.jsp";
    String REGISTROS = "views/Ventas.jsp";

    //Objetos
    detalle detalle = new detalle();
    venta venta = new venta();
    producto pro = new producto();
    VentaDao ventaDao = new VentaDao();
    ProductoDao prodDao = new ProductoDao();
    int fkCliente, fkVenta, fkProducto, detCantidad;
    double venTotal, detTotal;
    String venCodigo, venFecha;

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
            // Obtener la fecha actual
            LocalDate currentDate = LocalDate.now();

            // Crear un formateador de fecha
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

            // Formatear la fecha y convertirla a una cadena
            String diaActual = currentDate.format(formatter);

            switch (action) {
                case "guardar":
                    //Se guarda el encabezado
                    fkCliente = Integer.parseInt(request.getParameter("fkCliente"));
                    venCodigo = request.getParameter("venCodigo");
                    venFecha = diaActual;
                    venTotal = Double.parseDouble(request.getParameter("venTotal"));

                    venta = new venta(fkCliente, venCodigo, venFecha, venTotal);

                    fkVenta = Integer.parseInt(request.getParameter("fkVenta"));
                    fkProducto = Integer.parseInt(request.getParameter("fkProducto"));
                    detCantidad = Integer.parseInt(request.getParameter("detCantidad"));
                    detTotal = Double.parseDouble(request.getParameter("detTotal"));

                    detalle = new detalle(fkVenta, fkProducto, detCantidad, detTotal);

                    // aqui el stock del producto a la bd.
                    pro = prodDao.getById(fkProducto);
                    int stock = pro.getProStock();
                    int cantidadVendida = detCantidad;
                    int nuevoStock = stock - cantidadVendida;
                    pro.setProStock(nuevoStock);
                    prodDao.updateById(pro);

                    // aqui enviamos a la bd los datos
                    ventaDao.saveSale(venta, detalle);
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
