<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inventarios.aspx.cs" Inherits="MiPymes_V2.es.Inventarios.Inventarios" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Inventarios
                <span>>
                 Inventarios
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
                        <h2>Información de Categorías de Productos</h2>
                    </header>
                    <div>
                        <dx:ASPxGridView ID="gvInventarios" runat="server" Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="dsInventario" KeyFieldName="ProductoId">
                            <SettingsBehavior AllowFocusedRow="true" />

                            <SettingsDetail ShowDetailRow="True" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="50" PageSize="50">
                                <AllButton Visible="True">
                                </AllButton>
                            </SettingsPager>

                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" EmptyDataRow="No existen registros" GroupPanel="Coloque sus columnas aquí" />


                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="ProductoId" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Almacen" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Inventario" ReadOnly="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                            </Columns>


                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsInventario" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT T0.ProductoId,T2.Nombre Producto,T1.Nombre Almacen,SUM(T0.InventarioActual) Inventario
FROM InventarioLotes T0 
INNER JOIN Almacenes T1 ON T0.EmpresaId = T1.EmpresaId AND T0.AlmacenId = T1.AlmacenId
INNER JOIN Productos T2 ON T0.ProductoId = T2.ProductoId AND T0.EmpresaId = T2.EmpresaId
WHERE T0.EmpresaId = @EmpresaId
GROUP BY T0.ProductoId,T2.Nombre ,T1.Nombre">
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
