<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CambiarContraseña.aspx.cs" Inherits="MiPymes_V2.es.Colaboradores.CambiarContraseña" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Colaboradores
                <span>>
                 Cambiar Contraseña
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
                        <h2>Realizar Cambio de Contraseña</h2>
                    </header>
                    <div>
                        <dx:BootstrapFormLayout runat="server">
                                <Items>
                                     
                                    <dx:BootstrapLayoutItem Caption="Nueva Contraseña" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Nueva Contraseña" ID="txtContraseña" Password="True">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Contraseña es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Confirmar Contraseña" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Confirmar Contraseña" ID="txtConfirmarContra" Password="True">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Confirmar es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                     
                                    
                                   
                                    <dx:BootstrapLayoutItem ColSpanSm="12" ShowCaption="False" HorizontalAlign="Right">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapButton runat="server" Text="Guardar" AutoPostBack="true" ID="btnguardar" OnClick="btnguardar_Click"   >
                                                    <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                                    <CssClasses Icon="fa fa-check" />
                                                    <SettingsBootstrap RenderOption="Primary" />
                                                </dx:BootstrapButton>
                                                <dx:BootstrapButton runat="server" Text="Cancelar" AutoPostBack="false" ID="btnCancelar" >
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
