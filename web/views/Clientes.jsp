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
        <!-- Tablas -->
        <link href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/2.3.4/css/buttons.dataTables.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
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
            <div class="col-lg-12">
                <a href="Clientes?accion=nuevo" class="btn btn-primary rounded-pill mb-3">Nuevo registro</a>
                <div class="card">
                    <div class="card-body p-4">
                        <div class="table-responsive">
                            <table id="example" class="display table header-border verticle-middle" style="min-width: 845px">
                                <thead>
                                    <tr>
                                        <th/>                                                 
                                        <th class="text-center">Nombres</th>
                                        <th class="text-center">Apellidos</th>
                                        <th class="text-center">Cedula</th>   
                                        <th class="text-center">Email</th>                                                    
                                        <th class="text-center">Telefono</th>                                                  
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ClienteDao daoCh = new ClienteDao();
                                        List<cliente> listCh = daoCh.getAll();
                                        Iterator<cliente> iterCh = listCh.iterator();
                                        cliente ch = null;
                                        while (iterCh.hasNext()) {
                                            ch = iterCh.next();
                                    %>
                                    <tr>                                                    
                                        <td class="d-flex justify-items-center p-4"> 
                                            <div class="dropdown custom-dropdown" data-bs-toggle="dropdown">
                                                <div class="btn sharp btn-primary tp-btn">                                                            
                                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <circle cx="12.4999" cy="3.5" r="2.5" fill="#A5A5A5"></circle>
                                                    <circle cx="12.4999" cy="11.5" r="2.5" fill="#A5A5A5"></circle>
                                                    <circle cx="12.4999" cy="19.5" r="2.5" fill="#A5A5A5"></circle>
                                                    </svg>
                                                </div>
                                            </div> 
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <div class="dropdown-divider"></div>
                                                <div>
                                                    <a href="Clientes?accion=editar&idCliente=<%= ch.getIdCliente()%>" class="dropdown-item"><i class="fas fa-pencil-alt text-primary"></i>&nbsp; Actualizar</a>
                                                </div>
                                                <div class="dropdown-divider"></div>
                                                <div>
                                                    <a href="Clientes?accion=eliminar&idCliente=<%= ch.getIdCliente()%>" class="dropdown-item"><i class="fas fa-arrow-circle-down text-secondary"></i>&nbsp; Eliminar</a>
                                                </div>
                                                <div class="dropdown-divider"></div>
                                            </div>
                                        </td>	                                               
                                        <td class="text-center text-muted"><%= ch.getCliNombre()%></td>                                          
                                        <td class="text-center text-muted"><%= ch.getCliApellido()%></td>                                          
                                        <td class="text-center text-muted"><%= ch.getCliCedula()%></td>                                          
                                        <td class="text-center text-muted"><%= ch.getCliEmail()%></td>                                          
                                        <td class="text-center text-muted"><%= ch.getCliTelefono()%></td>                                          
                                    </tr>   
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div
        </main>

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <div class="copyright">
                &copy; Copyright <strong><span>Papeleria</span></strong>. Todos los derechos reservados
            </div> 
        </footer>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <!-- PDFS -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/2.3.4/js/dataTables.buttons.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js" ></script>
        <script src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.html5.min.js" ></script>
        <script src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.print.min.js" ></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ]
                });
            });
        </script>
    </body>

</html>