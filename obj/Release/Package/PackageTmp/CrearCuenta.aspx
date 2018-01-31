<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearCuenta.aspx.cs" Inherits="MiPymes_V2.CrearCuenta" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MiPyme-ERP</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/form-elements.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="css/iziToast-master/dist/css/iziToast.min.css" rel="stylesheet" />
    <script src="css/iziToast-master/dist/js/iziToast.min.js"></script>
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="icon" href="assets/ico/favicon.ico">
</head>

<body>
    <form id="form1" runat="server">

        <!-- Top content -->
        <div class="top-content">

            <%--<div class="inner-bg">--%>
            <%--<div class="container">--%>
            <%-- <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 text">
                        <h1><strong>MiPyme-ERP</strong></h1>
                    </div>
                </div>--%>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>Crea tu cuenta</h3>
                            <p>Ingrese los datos solicitados:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" class="login-form">
                            <dx:BootstrapFormLayout runat="server">
                                <Items>
                                    <dx:BootstrapLayoutItem Caption="Empresa" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" Text="" NullText="Ingrese el nombre de la empresa" ID="txtNombreEmpresa">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Empresa es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Nombre" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" Text="" NullText="Ingrese su nombre" ID="txtNombrePropietario">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Empresa es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>

                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Apellido" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" Text="" ID="txtApellido" NullText="Ingrese su apellido" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Pais" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox ID="cboPaises" runat="server" DataSourceID="dsPaises" DropDownStyle="DropDown" TextField="Nombre" ValueField="PaisId" AutoPostBack="True">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="El país es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsPaises" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Paises WHERE Activo = 1"></asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Departamento" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox ID="cboDepartamento" runat="server" DataSourceID="dsDepartamentos" TextField="Nombre" ValueField="PaisId" ValueType="System.Int32">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="El departamento es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsDepartamentos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Departamentos WHERE PaisId = @PaisId AND Activo=1">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="cboPaises" Name="PaisId" PropertyName="Value" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Moneda" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox ID="cboMoneda" NullText="Moneda por defecto" runat="server" DataSourceID="dsMonedas" TextField="Nombre" ValueField="MonedaId" ValueType="System.Int32">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="La moneda es requerida" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsMonedas" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Monedas WHERE Activo = 1"></asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Correo" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Ingrese el correo electronico" Text="" ID="txtCorreo">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Correo es requerido" />
                                                        <RegularExpression ErrorText="Correo Invalido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>

                                    <dx:BootstrapLayoutItem Caption="Contraseña" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox ID="txtClave" runat="server" NullText="Ingrese su  Contraseña" class="form-username form-control" Password="True">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Clave es requerido" />

                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem ColSpanSm="12" ShowCaption="False" HorizontalAlign="Right">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapButton runat="server" Text="Guardar" AutoPostBack="true" ID="btnGuardar" OnClick="btnGuardar_Click">
                                                    <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                                    <CssClasses Icon="fa fa-check" />
                                                    <SettingsBootstrap RenderOption="Primary" />
                                                </dx:BootstrapButton>
                                                <dx:BootstrapButton runat="server" Text="Cancelar" AutoPostBack="false" ID="btnCancelar">
                                                    <SettingsBootstrap RenderOption="Danger" />
                                                </dx:BootstrapButton>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>

                                </Items>
                            </dx:BootstrapFormLayout>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 social-login">

                    <div class="social-login-buttons">

                        <a class="btn btn-link-2" href="Inicio.aspx">
                            <i class="icon-group"></i>Iniciar Sesión
	                        	</a>

                    </div>
                </div>
                <%--</div>--%>
            </div>
        </div>

        <%--</div>--%>


        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>


    </form>
</body>

</html>
