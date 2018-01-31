<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearUsuarios.aspx.cs" Inherits="MiPymes_V2.es.Configuraciones.CrearUsuarios" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Colaboradores
                <span>>
                 Usuarios
                </span>
            </h1>
        </div>
    </div>

    
    
     <section id="widget-grid" class="">
        <div class="row">
            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0" data-widget-editbutton="false">
                    <header>
                        <span class="widget-icon"><i class="fa fa-table"></i></span>
                        <h2>Información de Condiciones de Pago</h2>
                    </header>
                    <div>
                        <dx:BootstrapFormLayout runat="server">
                                <Items>
                                     <dx:BootstrapLayoutItem Caption="Codigo" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Codígo del Usuario" ID="txtCodigo" ReadOnly="True">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <%--<RequiredField IsRequired="true" ErrorText="Codigo es requerido" />--%>
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Nombre" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Nombre del Usuario" ID="txtNombre">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Nombre es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Apellido" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Apellido del Usuario" ID="txtApellido">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Apellido es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                      <dx:BootstrapLayoutItem Caption="Correo" ColSpanSm="6">
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
                                    
                                    <dx:BootstrapLayoutItem Caption="Contraseña" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Contraseña del usuario" ID="txtContraseña" Password="True">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Contraseña es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                    <dx:BootstrapLayoutItem Caption="Perfil" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox ID="cboPerfil" runat="server" DataSourceID="dsPerfil" TextField="Nombre" ValueField="PerfilId">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Perfil es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                               
                                                <asp:SqlDataSource ID="dsPerfil" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Perfiles WHERE Activo=1"></asp:SqlDataSource>
                                               
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                    <dx:BootstrapLayoutItem Caption="Bloqueado" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapCheckBox ID="chkbloqueado" runat="server" Text="">
                                                    
                                                </dx:BootstrapCheckBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                   
                                    <dx:BootstrapLayoutItem ColSpanSm="12" ShowCaption="False" HorizontalAlign="Right">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapButton runat="server" Text="Guardar" AutoPostBack="true" ID="BootstrapButton1" OnClick="btnguardar_Click"  >
                                                    <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                                    <CssClasses Icon="fa fa-check" />
                                                    <SettingsBootstrap RenderOption="Primary" />
                                                </dx:BootstrapButton>
                                                <dx:BootstrapButton runat="server" Text="Cancelar" AutoPostBack="false" ID="BootstrapButton2" >
                                                    <SettingsBootstrap RenderOption="Danger" />
                                                </dx:BootstrapButton>
                                            </dx:ContentControl>
                                        </ContentCollection>

                                    </dx:BootstrapLayoutItem>
                                </Items>


                            </dx:BootstrapFormLayout>
                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
