<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="MiPymes_V2.Inicio" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>


<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MiPyme</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="css/iziToast-master/dist/css/iziToast.min.css" rel="stylesheet" />
    <script src="css/iziToast-master/dist/js/iziToast.min.js"></script>
    
</head>

<body>
    <form id="form1" runat="server">

        <!-- Top content -->
        <div class="top-content">

            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>MiPyme</strong></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Acceso a tu sitio</h3>
                                    <p>Ingrese su correo y contraseña:</p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-lock"></i>
                                </div>
                            </div>
                            <div class="form-bottom">
                                <form role="form" class="login-form">
                                    <div class="form-group">
                                        <dx:BootstrapTextBox runat="server" NullText="Ingrese el correo electronico" Text="" ID="txtCorreo">
                                            <ValidationSettings ValidationGroup="Validation">
                                                <RequiredField IsRequired="true" ErrorText="Correo es requerido" />
                                                <RegularExpression ErrorText="Correo Invalido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            </ValidationSettings>
                                        </dx:BootstrapTextBox>
                                    </div>
                                    <div class="form-group">
                                        <dx:BootstrapTextBox ID="txtClave" runat="server" NullText="Ingrese su  Contraseña" class="form-username form-control" Password="True">
                                            <ValidationSettings ValidationGroup="Validation">
                                                <RequiredField IsRequired="true" ErrorText="Clave es requerido" />

                                            </ValidationSettings>
                                        </dx:BootstrapTextBox>
                                    </div>
                                    <dx:BootstrapButton ID="btnIngresar" runat="server" AutoPostBack="True" Text="Iniciar Sesión" OnClick="btnIngresar_Click">
                                        <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                    </dx:BootstrapButton>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">

                            <div class="social-login-buttons">

                                <a class="btn btn-link-2" href="CrearCuenta.aspx">
                                    <i class=""></i>Crear Cuenta
	                        	</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>


    </form>
</body>

</html>
