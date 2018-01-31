<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CondicionPago.aspx.cs" Inherits="MiPymes_V2.es.ClientesProveedores.CondicionPago" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Clientes - Proveedores
                <span>>
                  Condición de Pago
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
                        <h2>Información de Condiciones de Pago</h2>
                    </header>
                    <div>
                        <dx:ASPxGridView ID="gvCondicionesPago" runat="server" Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="dsCondicionPago" KeyFieldName="CondicionPagoId;EmpresaId" OnRowInserting="gvCondicionesPago_RowInserting">
                            <Toolbars>
                                <dx:GridViewToolbar ItemAlign="Left" EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="New" Name="Nuevo" Text="Nuevo" />
                                        <dx:GridViewToolbarItem Command="Edit" Name="Editar" Text="Editar" />
                                        <dx:GridViewToolbarItem Command="Delete" Visible="False" />
                                        <dx:GridViewToolbarItem Command="Refresh" BeginGroup="true" Text="Actualizar" />

                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                            <SettingsDetail ShowDetailRow="True" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="50" PageSize="50">
                                <AllButton Visible="True">
                                </AllButton>
                            </SettingsPager>

                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" GroupPanel="Coloque sus columnas aquí" />
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="CondicionPagoId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataSpinEditColumn Caption="Días" FieldName="DiasCredito" VisibleIndex="4">
                                    <PropertiesSpinEdit DisplayFormatString="g" NumberFormat="Custom">
                                        <SpinButtons ClientVisible="False">
                                        </SpinButtons>
                                    </PropertiesSpinEdit>
                                </dx:GridViewDataSpinEditColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsCondicionPago" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [CondicionesPago] WHERE [CondicionPagoId] = @original_CondicionPagoId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND [DiasCredito] = @original_DiasCredito" InsertCommand="INSERT INTO [CondicionesPago] ([CondicionPagoId], [EmpresaId], [Nombre], [DiasCredito]) VALUES (@CondicionPagoId, @EmpresaId, @Nombre, @DiasCredito)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CondicionesPago] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [CondicionesPago] SET [Nombre] = @Nombre, [DiasCredito] = @DiasCredito WHERE [CondicionPagoId] = @original_CondicionPagoId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND [DiasCredito] = @original_DiasCredito">
                            <DeleteParameters>
                                <asp:Parameter Name="original_CondicionPagoId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_DiasCredito" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CondicionPagoId" Type="Int32" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="DiasCredito" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="DiasCredito" Type="Int32" />
                                <asp:Parameter Name="original_CondicionPagoId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_DiasCredito" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
