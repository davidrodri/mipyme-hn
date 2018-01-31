<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="DocumentoFactura.aspx.cs" Inherits="MiPymes_V2.es.Facturacion.DocumentoFactura" %>

<%@ Register Assembly="DevExpress.XtraReports.v17.1.Web, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxDocumentViewer ID="ASPxDocumentViewer1" runat="server" Height="1100px" Theme="MaterialCompact" Width="100%">
    </dx:ASPxDocumentViewer>
</asp:Content>
