<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.papeleria.model.*"%>
<%@page import="com.papeleria.dao.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Dashboard</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <header id="header" class="header fixed-top d-flex align-items-center">
            <div class="d-flex align-items-center justify-content-between">
                <span class="logo d-flex align-items-center text-uppercase">
                    <span class="d-none d-lg-block">Papeleria</span>
                </span>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div>           
            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">
                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link nav-icon search-bar-toggle " href="#">
                            <i class="bi bi-search"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown pe-3">
                        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">                          
                            <span class="d-none d-md-block dropdown-toggle ps-2 text-uppercase">${usuUsuario}</span>
                        </a><!-- End Profile Iamge Icon -->
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">                            
                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="CerrarSesion">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Cerrar sesion</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </header>
        <aside id="sidebar" class="sidebar">
            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link " href="Controlador?p=ventas">
                        <i class="bi bi-grid"></i>
                        <span>Ventas</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="Controlador?p=clientes">
                        <i class="bi bi-grid"></i>
                        <span>Clientes</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="Controlador?p=productos">
                        <i class="bi bi-grid"></i>
                        <span>Productos</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="Controlador?p=usuarios">
                        <i class="bi bi-grid"></i>
                        <span>Usuarios</span>
                    </a>
                </li>                
            </ul>

        </aside>

        <main id="main" class="main">
            <div class="card p-3">
                <form method="post" action="Usuarios">
                    <%
                        UsuarioDao dao = new UsuarioDao();
                        int id = Integer.parseInt((String) request.getParameter("idUsuario"));
                        usuario cli = (usuario)dao.getById(id);
                    %>
                    <div class="card-header mb-3">
                        <h5 class="modal-title">ACTUALIZAR USUARIO</h5>                                   
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-xl-6 mb-3">
                                <div class="example">
                                    <p class="mb-1 text-primary">Usuario:</p>
                                    <input class="form-control" type="hidden" required="true" name="idUsuario" value="<%= cli.getIdUsuario()%>">
                                    <input class="form-control" type="text" required="true" name="usuUsuario" value="<%= cli.getUsuUsuario()%>">
                                </div>
                            </div>
                            <div class="col-xl-6 mb-3">
                                <div class="example">
                                    <p class="mb-1 text-primary">Clave</p>
                                    <input type="password" class="form-control" required="true" name="usuClave" value="<%= cli.getUsuClave()%>">
                                </div> 
                            </div>                                            
                        </div>                                                                                                                                                                                                                                           
                    </div>
                    <div class="modal-footer p-3 gap-4">
                        <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">Cancelar</button>
                        <input class="btn btn-primary ml-2" type="submit" name="accion" value="actualizar">
                    </div>
                </form>
            </div>

        </main><!-- End #main -->


        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>