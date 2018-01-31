<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrdenesCompras.aspx.cs" Inherits="MiPymes_V2.es.Compras.OrdenesCompras" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Compras
                <span>>
                 Revisión de Ordendes de Compra
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
                        <h2>Ver Usuarios</h2>
                    </header>
                    <div>
                        <dx:BootstrapFormLayout runat="server">
                            <Items>
                                <dx:BootstrapLayoutItem Caption="Fecha Inicial" ColSpanSm="4">
                                    <ContentCollection>
                                        <dx:ContentControl>
                                            <dx:ASPxDateEdit ID="dateInicial" runat="server" Theme="MaterialCompact">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>

                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:BootstrapLayoutItem>
                                <dx:BootstrapLayoutItem Caption="Fecha Final" ColSpanSm="4">
                                    <ContentCollection>
                                        <dx:ContentControl>
                                            <dx:ASPxDateEdit ID="dateFinal" runat="server" Theme="MaterialCompact">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>

                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:BootstrapLayoutItem>
                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="3" BeginRow="True">
                                    <ContentCollection>
                                        <dx:ContentControl>
                                            <dx:ASPxButton ID="btnProcesar" runat="server" Text="Buscar" Theme="MaterialCompact">
                                            </dx:ASPxButton>

                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:BootstrapLayoutItem>
                            </Items>
                        </dx:BootstrapFormLayout>
                        <dx:ASPxGridView ID="gvOrdenesCompra" runat="server" Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="dsOrdenCompra" KeyFieldName="OrdenCompraId">
                            <SettingsDetail ShowDetailRow="True" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                            <Templates>
                                <DetailRow>
                                    <dx:ASPxGridView ID="gvOrdenCompraDetalle" runat="server" AutoGenerateColumns="False" DataSourceID="dsOrdenCompraDetalle" EnableTheming="True" KeyFieldName="OrdenCompraId" OnBeforePerformDataSelect="gvOrdenCompraDetalle_BeforePerformDataSelect" Theme="MaterialCompact">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="OrdenCompraId" ReadOnly="True" Visible="False" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Linea" FieldName="LineaId" ReadOnly="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="ProductoId" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NombreProducto" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Precio" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Descuento" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="PrecioDescuento" Visible="False" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TipoImpuestoId" Visible="False" VisibleIndex="9">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CuentaContableId" Visible="False" VisibleIndex="10">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn FieldName="FechaVence" Visible="False" VisibleIndex="11">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn FieldName="TotalLinea" VisibleIndex="12">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsOrdenCompraDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM OrdenCompra_Detalle WHERE OrdenCompraId = @OrdenCompraId AND EmpresaId = @EmpresaId">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="OrdenCompraId" SessionField="OrdenCompraId" />
                                            <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </DetailRow>
                            </Templates>
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" />

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="OrdenCompraId" ReadOnly="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SocioNegocioId" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreEmpressa" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EstadoDocumentoId" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="FechaDocumento" VisibleIndex="5">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="TotalPagar" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NumeracionCai" VisibleIndex="7">
                                </dx:GridViewDataTextColumn>
                            </Columns>

                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsOrdenCompra" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT OrdenCompraId,EmpresaId,SocioNegocioId,SocioNegocioId NombreEmpressa,EstadoDocumentoId,FechaDocumento,
TotalPagar,NumeracionCai
FROM OrdenCompra WHERE EmpresaId = @EmpresaId ">
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
