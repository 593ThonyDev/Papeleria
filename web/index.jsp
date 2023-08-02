<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Login</title>
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
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <main>
            <div class="container">
                <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                                <div class="card mb-3 rounded-3">
                                    <div class="card-body">
                                        <div class=" pb-2">
                                            <h5 class="card-title text-center pb-0 fs-4">INICIO DE SESION</h5>
                                        </div>
                                        <form class="row g-3" method="post" action="Login">
                                            <div class="col-12">
                                                <div class="col-12">
                                                    <label class="form-label">Usuario</label>
                                                    <input type="TEXT" name="usuUsuario" class="form-control" required>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <label for="yourPassword" class="form-label">Clave</label>
                                                <input type="password" name="usuClave" class="form-control"required>
                                            </div>
                                            <div class="col-12">
                                                <input class="btn btn-primary w-100" style="border: none; height: 50px" type="submit" value="INGRESAR" name="btn-login">
                                            </div>
                                            <center>
                                                <h5 style="color: #007bb6;">${errorSesion}</h5>
                                            </center>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        
    </body>

</html>
