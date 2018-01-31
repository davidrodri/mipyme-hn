<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="PaginaNoEncontrada.aspx.cs" Inherits="MiPymes_V2.es.Controles.PaginaNoEncontrada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- MAIN CONTENT -->
    <div id="content">
        <!-- row -->
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center error-box">
                            <h2 class="font-xl"><strong><i class="fa fa-fw fa-warning fa-lg text-warning"></i>Pagina <u>No</u> Encontrada</strong></h2>
                            <br />
                            <p class="lead">
                                No se pudo encontrar la página solicitada <b>regrese</b> para navegar a la página de la que proviene anteriormente
                            </p>
                            <p class="font-md">
                                <b>... Ponganse en contacto con el equipo de desarrollo.</b>
                            </p>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->
        </div>
    </div>
    <!-- END MAIN CONTENT -->
</asp:Content>
