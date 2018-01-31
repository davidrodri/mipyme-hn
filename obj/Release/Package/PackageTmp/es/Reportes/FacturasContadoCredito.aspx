<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="FacturasContadoCredito.aspx.cs" Inherits="MiPymes_V2.es.Reportes.FacturasContadoCredito" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Reportes
                <span>>
                  Facturas Contado contra Crédito
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
                        <h2>Información de Facturas por Cobrar</h2>
                    </header>
                    <dx:BootstrapFormLayout runat="server">
                        <Items>
                            <dx:BootstrapLayoutItem Caption="Fecha Inicial" ColSpanSm="4">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:ASPxDateEdit ID="dateFechaInicial" runat="server" Theme="MaterialCompact" Width="100%">
                                            <ValidationSettings ValidationGroup="Validation">
                                                <RequiredField IsRequired="true" ErrorText="Ingrese la Fecha Inicial" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>
                            <dx:BootstrapLayoutItem Caption="Fecha Final" ColSpanSm="4">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:ASPxDateEdit ID="dateFechaFinal" runat="server" Theme="MaterialCompact" Width="100%">
                                            <ValidationSettings ValidationGroup="Validation">
                                                <RequiredField IsRequired="true" ErrorText="Ingrese la Fecha Final" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                            <dx:BootstrapLayoutItem ColSpanSm="4" ShowCaption="False" HorizontalAlign="Left">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapButton runat="server" Text="Generar" AutoPostBack="true" ID="btnguardar" OnClick="btnguardar_Click">
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                            <CssClasses Icon="fa fa-check" />
                                            <SettingsBootstrap RenderOption="Primary" />
                                        </dx:BootstrapButton>

                                    </dx:ContentControl>
                                </ContentCollection>

                            </dx:BootstrapLayoutItem>
                        </Items>
                    </dx:BootstrapFormLayout>


                    <div>
                        <dx:BootstrapPieChart ID="BootstrapPieChart1" runat="server" EncodeHtml="True" TitleText="Tipos de Venta">
                            <SeriesCollection>
                                <dx:BootstrapPieChartSeries ArgumentField="Nombre" ValueField="TotalVentas">
                                    <Label Visible="true">
                                        <Format Type="Currency" Currency="Lps." />
                                    </Label>
                                </dx:BootstrapPieChartSeries>
                            </SeriesCollection>
                            <SettingsToolTip>
                                <ArgumentFormat Currency="Lps." />
                                <Format Currency="Lps." />
                            </SettingsToolTip>
                        </dx:BootstrapPieChart>
                        
                         
                        <asp:SqlDataSource ID="dsFacturasContadoCredito" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT T1.Nombre,SUM(T0.TotalPagar) TotalVentas
FROM Facturas T0
INNER JOIN CondicionesPago T1 ON T0.CondicionPagoId = T1.CondicionPagoId AND T0.EmpresaId = T1.EmpresaId
WHERE T0.EmpresaId = @EmpresaId AND CONVERT(DATE,T0.FechaDocumento) BETWEEN @FechaInicial AND @FechaFinal
GROUP BY T1.Nombre">
                            <SelectParameters>
                                <asp:Parameter Name="EmpresaId" />
                                <asp:Parameter Name="FechaInicial" />
                                <asp:Parameter Name="FechaFinal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                         
                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
