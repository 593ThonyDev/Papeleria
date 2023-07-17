package com.papeleria.controller;

import com.papeleria.dao.UsuarioDao;
import com.papeleria.model.usuario;
import com.papeleria.security.Encriptador;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Login extends HttpServlet {

    HttpSession session;
    usuario usu = new usuario();
    UsuarioDao usuDao = new UsuarioDao();
    Encriptador enc = new Encriptador();
    /*Variables de sesion*/
    String usuUsuario = "";
    String usuClave = "";
    String usuClaveBd = "";
    Integer usuIntento = 0;
    Integer idUsuario = 0;

    /*Variables de sesion*/
    String INCIO = "Controlador?p=ventas";
    String LOGIN = "index.jsp";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession();
        usuUsuario = request.getParameter("usuUsuario");
        usuClave = request.getParameter("usuClave");
        idUsuario = usuDao.getIdUsuario(usuUsuario);
        System.out.println("idUsuario: " + idUsuario);
        //Si los parametros es igual a null o el id del idUsuario == 0 caso contrario pasa al else
        if (idUsuario == 0) {
            request.setAttribute("errorSesion", "El usuario ingresado no esta registrado!!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            //Utilizamos la bd para dar logica
            usuClaveBd = enc.desencriptar(usuDao.getPassword(idUsuario));
            System.out.println("usuClaveBd " + usuClaveBd);
            // SI LA CLAVE DESENCRIPTADA ES IGUAL A LA INGRESADA EN LA INTERFAZ SE DA EL ACCESO
            usuIntento = usuDao.getAttempts(idUsuario);
            if (usuClaveBd.equals(usuClave)) {
                //GENERAMOS EL CONTROL DE INTENTOS
                if (usuIntento <= 5) {
                    //realizamos la redireccion a la interfaz y agregamos los datos del usuario
                    session.setAttribute("idUsuario", idUsuario);
                    session.setAttribute("usuUsuario", usuUsuario);
                    session.setAttribute("usuario", usu);
                    response.sendRedirect(INCIO);
                    //Actualizamos los intentos a 0
                    usu = new usuario(idUsuario, usuUsuario, usuClave, 0);
                    usuDao.updateById(usu);
                } else {
                    request.setAttribute("errorSesion", "LIMITES DE INTENTOS EXCEDIDOS!!");
                    request.getRequestDispatcher(LOGIN).forward(request, response);
                }
            } else {
                //Actualizamos los intentos y sumamos 1
                usu = new usuario(idUsuario, usuUsuario, usuClaveBd, usuIntento + 1);
                usuDao.updateById(usu);
                request.setAttribute("errorSesion", "CLAVE INCORRECTA!!");
                request.getRequestDispatcher(LOGIN).forward(request, response);
            }
        }
    }
}
