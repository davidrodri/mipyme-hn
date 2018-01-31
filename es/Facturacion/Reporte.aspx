<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="MiPymes_V2.es.Facturacion.Reporte" %>

<%@ Register Assembly="DevExpress.XtraReports.v17.1.Web, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Principal
                <span>>
                  Inicio
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
                        <h2>Información de Total Disponible por Documento</h2>

                    </header>
                    <div>
                        <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" Height="1100px" Theme="MaterialCompact" ToolbarMode="Ribbon" Width="100%">
                        </dx:ASPxDocumentViewer>
                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
