<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="MiPymes_V2.es.Controles.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="content">
        <!-- row -->
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center error-box">
                            <h1 class="error-text tada animated"><i class="fa fa-times-circle text-danger error-icon-shadow"></i>Error 500</h1>
                            <h2 class="font-xl"><strong>¡Ha ocurrido un error!</strong></h2>
                            <br />
                            <p class="lead semi-bold">
                                <strong>Ha experimentado un error técnico. Pedimos disculpas.</strong><br>
                                <br>
                                <small>Estamos trabajando duro para corregir este problema. Espere unos instantes y vuelva a intentar su búsqueda.
                                    <br>
                                </small>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->
    </div>
</asp:Content>
