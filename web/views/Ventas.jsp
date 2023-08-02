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
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

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
            <div class="card p-3">
                <form action="VentaTotal" method="post">
                    <input type="hidden" name="fkCliente" class="form-control" id="fkCliente">
                    <input type="hidden" name="fkProducto" class="form-control" id="fkProducto">
                    <input type="hidden" name="fkVenta" class="form-control" id="fkVenta" value="${idVenta}">
                    <input type="hidden" name="venCodigo" value="${codVenta}">
                    <input type="hidden" name="detTotal" id="detTotal">
                    <input type="hidden" name="venTotal" id="venTotal">
                    <div class="row">
                        <div class="col-xl-6 m-b30">
                            <label class="form-label">Cliente</label>
                            <div class="input-group mb-3">
                                <input type="text" name="fkProducto" class="form-control" id="lblNombreCli">

                                <button class="btn btn-primary" type="button" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalCenterCliente">Buscar</button>
                            </div>
                        </div>
                        <div class="col-sm-6 m-b30">
                            <label class="form-label">Codigo venta</label>
                            <input type="text" id="txtCodVenta" class="form-control" name="venCodigo" value="${codVenta}">
                            <input type="hidden" id="txtIdVenta" class="form-control" name="txtIdVenta" value="${idVenta}">
                        </div>
                        <div class="col-sm-6 m-b30">
                            <label class="form-label">Producto</label>
                            <div class="input-group mb-3">
                                <input type="text" name="fkProducto" class="form-control" id="lblNombreProd">
                                <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Buscar</button>
                            </div>
                        </div>

                        <div class="col-sm-6 m-b30">
                            <label class="form-label">Cantidad</label>
                            <input type="number" id="lbl-cantidad" class="form-control" name="detCantidad">
                        </div>
                        <div class="col-sm-2 m-b30 mt-2 d-flex gap-5">
                            <input type="button" class="form-control btn btn-primary" name="accion" value="Agregar detalle"
                                   onclick="agregarDetalle()">
                            <input class="btn btn-primary" type="submit" name="accion" onclick="generarPDF()" value="guardar">
                        </div>
                    </div>
            </div>
        </form>
    </div>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body p-2">
                <div class="table-responsive">
                    <table class="table text-center h-100 py-5" id="detalle-table">
                        <!-- ... -->
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Agregamos el elemento para mostrar el total -->
    <div class="col-lg-12 mt-3">
        <h4 class="text-center">Total a pagar: <span id="totalPagar">0.00</span></h4>
    </div>

</main>
<div class="modal fade" id="exampleModalCenter">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content modal-sm">
            <div class="modal-body">
                <center>
                    <h3 class="modal-title text-primary"><b>PRODUCTOS</b></h3>
                </center>
                <div class="table-responsive">
                    <table id="example3" class="display table header-border table-hover verticle-middle">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">Producto</th>
                                <th class="text-center">P.V.P</th>
                                <th class="text-center">Stock</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- ============ INICIO DE LA CARD PRODUCTO ============ -->
                            <%
                              ProductoDao daoProd = new ProductoDao();
                              List<producto> listProd = daoProd.getAll();
                              Iterator<producto> iterProd = listProd.iterator();
                              producto prod = null;
                              while (iterProd.hasNext()) {
                                prod = iterProd.next();
                            %>
                            <tr onclick="selectProduct(this)">
                                <td class="text-center text-muted"><%= prod.getIdProducto()%></td>
                                <td class="text-center text-muted"><%= prod.getProNombre()%></td>
                                <td class="text-center text-muted"><%= prod.getProPrecio()%></td>
                                <td class="text-center text-muted"><%= prod.getProStock()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModalCenterCliente">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content modal-sm">
            <div class="modal-body">
                <center>
                    <h3 class="modal-title text-primary"><b>CLIENTES</b></h3>
                </center>
                <div class="table-responsive">
                    <table id="example" class="display table header-border verticle-middle" style="min-width: 845px">
                        <thead>
                            <tr>
                                <th class="text-center">Id</th>
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
                            <tr onclick="selectClient(this)">
                                <td class="text-center text-muted"><%= ch.getIdCliente()%></td>
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
    </div>
</div>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.3.4/js/buttons.print.min.js"></script>

<script>
                                $(document).ready(function () {
                                    $('#example').DataTable({
                                        dom: 'Bfrtip',
                                        buttons: [
                                            'copy', 'csv', 'excel', 'pdf', 'print'
                                        ]
                                    });
                                });

                                let selectedClient = null;
                                let selectedProduct = null;

                                function selectClient(row) {
                                    const cells = row.cells;
                                    selectedClient = {
                                        id: cells[0].innerText,
                                        name: cells[1].innerText + " " + cells[2].innerText,
                                    };
                                    document.getElementById('lblNombreCli').value = selectedClient.name;
                                    document.getElementById('fkCliente').value = selectedClient.id;
                                }

                                function selectProduct(row) {
                                    const cells = row.cells;
                                    selectedProduct = {
                                        id: cells[0].innerText,
                                        name: cells[1].innerText,
                                        price: parseFloat(cells[2].innerText),
                                        stock: parseInt(cells[3].innerText),
                                    };
                                    document.getElementById('lblNombreProd').value = selectedProduct.name;
                                    document.getElementById('fkProducto').value = selectedProduct.id;
                                }

                                function agregarDetalle() {
                                    const cantidadSolicitada = parseInt(document.getElementById('lbl-cantidad').value);
                                    if (!selectedClient) {
                                        alert('Debes seleccionar un cliente.');
                                        return;
                                    }
                                    if (!selectedProduct) {
                                        alert('Debes seleccionar un producto.');
                                        return;
                                    }
                                    if (isNaN(cantidadSolicitada) || cantidadSolicitada <= 0) {
                                        alert('La cantidad solicitada debe ser un número mayor a cero.');
                                        return;
                                    }
                                    if (cantidadSolicitada > selectedProduct.stock) {
                                        alert('La cantidad solicitada supera el stock disponible.');
                                        return;
                                    }

                                    const table = document.getElementById('detalle-table');
                                    const row = table.insertRow(-1);
                                    const cellId = row.insertCell(0);
                                    const cellProduct = row.insertCell(1);
                                    const cellCode = row.insertCell(2);
                                    const cellPVP = row.insertCell(3);
                                    const cellTotal = row.insertCell(4);

                                    cellId.innerText = selectedProduct.id;
                                    cellProduct.innerText = selectedProduct.name;
                                    cellCode.innerText = selectedProduct.id;
                                    cellPVP.innerText = selectedProduct.price.toFixed(2);
                                    cellTotal.innerText = (selectedProduct.price * cantidadSolicitada).toFixed(2);
                                    document.getElementById("detTotal").value = (selectedProduct.price * cantidadSolicitada).toFixed(2);

                                    // Actualizamos el total a pagar
                                    calcularTotalPagar();
                                }

                                function calcularTotalPagar() {
                                    let totalPagar = 0;
                                    const rows = document.querySelectorAll("#detalle-table tbody tr");
                                    rows.forEach(row => {
                                        const cellTotal = row.cells[4];
                                        const total = parseFloat(cellTotal.innerText);
                                        totalPagar += total;
                                    });

                                    // Mostramos el total a pagar en el elemento con el id "totalPagar"
                                    document.getElementById("totalPagar").innerText = totalPagar.toFixed(2);
                                    document.getElementById("venTotal").value = totalPagar.toFixed(2);
                                }
</script>

<script>

    function generarPDF() {
        const totalPagar = document.getElementById('totalPagar').innerText;
        const docDefinition = {
            content: [
                {text: 'FACTURA', style: 'header'},
                {text: 'Cliente:', style: 'subheader'},
                {text: selectedClient ? selectedClient.name : 'Consumidor final', style: 'content'},
                {text: 'Detalles de la compra:', style: 'subheader'},
                generarTablaDetalles(),
                {text: "Total a Pagar: " + document.getElementById('totalPagar').innerText, style: 'content'}
            ],
            styles: {
                header: {
                    fontSize: 18,
                    bold: true,
                    alignment: 'center',
                    margin: [0, 0, 0, 10]
                },
                subheader: {
                    fontSize: 14,
                    bold: true,
                    margin: [0, 10, 0, 5]
                },
                content: {
                    fontSize: 12,
                    margin: [0, 0, 0, 10]
                }
            }
        };

        // Generar el PDF
        pdfMake.createPdf(docDefinition).download('factura.pdf');
    }


    function generarTablaDetalles() {
        const rows = document.querySelectorAll("#detalle-table tbody tr");
        const detalleData = [['Producto', 'Código', 'P.V.P', 'Total']];
        rows.forEach(row => {
            const cells = row.cells;
            const rowData = [
                cells[1].innerText,
                cells[2].innerText,
                cells[3].innerText, // Aquí se muestra el P.V.P sin el signo "$"
                cells[4].innerText // Aquí se muestra el Total sin el signo "$"
            ];
            detalleData.push(rowData);
        });

        return {
            table: {
                headerRows: 1,
                widths: ['*', '*', '*', '*'],
                body: detalleData
            }
        };
    }
</script>

</body>

</html>
