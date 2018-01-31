<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="VerFacturas.aspx.cs" Inherits="MiPymes_V2.es.Facturacion.VerFacturas" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-cart-plus "></i>
                Facturación
                <span>>
                  Ver Facturas Creadas
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
                        <h2>Información de Documentos</h2>
                    </header>
                    <div>
                        <dx:ASPxGridView ID="gvVerDocumentos" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsProcedure" KeyFieldName="FacturaId;EmpresaId">
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" />
                            
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="FacturaId" ReadOnly="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SocioNegocioId" ReadOnly="True" VisibleIndex="3" Caption="Código">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreSocioNegocio" ReadOnly="True" VisibleIndex="4" Caption="Socio Negocio">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FechaDocumento" ReadOnly="True" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Comentarios" ReadOnly="True" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="TotalDocumento" ReadOnly="True" VisibleIndex="7" Caption="Total Documento">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="#" VisibleIndex="0">
                                    <DataItemTemplate>
                                        <dx:ASPxButton ID="btnVerFactura" runat="server" OnClick="btnVerFactura_Click" OnCommand="btnVerFactura_Command" Text="Ver" Theme="MaterialCompact">
                                        </dx:ASPxButton>
                                    </DataItemTemplate>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsProcedure" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="spVerDocumentos" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsInforDocumento" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT 0 FacturaId,0 EmpresaId,'' SocioNegocioId,'' NombreSocioNegocio,'' FechaDocumento,'' Comentarios,0.00 TotalDocumen"></asp:SqlDataSource>
                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
