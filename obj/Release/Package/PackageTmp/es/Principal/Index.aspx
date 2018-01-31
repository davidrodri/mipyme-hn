<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MiPymes_V2.es.Principal.Index" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
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
                        <dx:ASPxGridView ID="gvDocumentosPendientes" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsDocumentosPendientes" KeyFieldName="EmpresaId;CaiNumeracionId;AutorizacionCaiId">

                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="50" PageSize="50">
                                <AllButton Visible="True">
                                </AllButton>
                            </SettingsPager>
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" GroupPanel="Coloque sus columnas aquí" />

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="AutorizacionCaiId" Visible="False" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="TipoDoctoId" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="DocumentosPendientes" ReadOnly="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Documento" FieldName="TipoDoctoId1" VisibleIndex="2">
                                    <PropertiesComboBox DataSourceID="dsTipoDocumentos" TextField="NombreTipoDocto" ValueField="TipoDoctoID">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>

                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsDocumentosPendientes" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT CaiNumeracionId,AutorizacionCaiId,EmpresaId,TipoDoctoId,TipoDoctoId,NumeroFinal-NumeroActual DocumentosPendientes FROM CaiNumeraciones  WHERE EmpresaId = @EmpresaId">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="EmpresaId" SessionField="EmpresaId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsTipoDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT TipoDoctoID,NombreTipoDocto FROM TipoDocumento"></asp:SqlDataSource>
                    </div>
                </div>
            </article>
        </div>
        
         <article class="col-sm-12 col-md-12 col-lg-6">
                <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-1" data-widget-editbutton="false">
                    <header>
                        <span class="widget-icon"><i class="fa fa-table"></i></span>
                        <h2>Información de Ventas</h2>
                    </header>
                    <div>
                        <dx:BootstrapPieChart ID="BootstrapPieChart1" runat="server" DataSourceID="dsChartVentas" EncodeHtml="True" TitleText="Ventas por Socio de Negocio" >
                            <SeriesCollection>
                                <dx:BootstrapPieChartSeries ArgumentField="Nombre" ValueField="TotalVentas" >
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
                        <asp:SqlDataSource ID="dsChartVentas" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT T2.Nombre, SUM(T0.TotalPagar) TotalVentas
FROM Facturas T0
INNER JOIN SociosNegocio T1 ON T0.SocioNegocioId = T1.SocioNegocioId
INNER JOIN GrupoSociosNegocio T2 ON T1.GrupoSocioNegocioId = T2.GrupoSocioNegocioId AND T2.EmpresaId = T1.EmpresaId
WHERE CONVERT(DATE,FechaDocumento) BETWEEN CONVERT(DATE,GETDATE()-30) AND CONVERT(DATE,GETDATE()) AND T0.EmpresaId=@EmpresaId
GROUP BY T2.Nombre">
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </article>

        
          <article class="col-sm-12 col-md-12 col-lg-6">
                <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-2" data-widget-editbutton="false">
                    <header>
                        <span class="widget-icon"><i class="fa fa-table"></i></span>
                        <h2>TOP Productos Vendidos</h2>
                    </header>
                    <div>
                        <dx:BootstrapPieChart ID="BootstrapPieChart2" runat="server" DataSourceID="dsProductosMasVendidos" EncodeHtml="True" TitleText="Productos mas Vendidos" Type="Doughnut">
                            <SeriesCollection>
                                <dx:BootstrapPieChartSeries ArgumentField="Producto" ValueField="Cantidad" >
                                    <Label Visible="true">
                                        <Format Type="Decimal" Currency="" />
                                    </Label>
                                </dx:BootstrapPieChartSeries>
                            </SeriesCollection>
                        </dx:BootstrapPieChart>
                        <asp:SqlDataSource ID="dsProductosMasVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT T1.NombreProducto Producto,SUM(T1.Cantidad) Cantidad
FROM Facturas T0
INNER JOIN Facturas_Detalle T1 ON T0.FacturaId = T1.FacturaId AND T0.EmpresaId = T1.EmpresaId
WHERE CONVERT(DATE,T0.FechaDocumento) BETWEEN CONVERT(DATE,GETDATE()-30) AND CONVERT(DATE,GETDATE())
AND T0.EmpresaId =@EmpresaId
GROUP BY T1.NombreProducto">
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </article>

    </section>
    <br />

           


          
        
</asp:Content>
