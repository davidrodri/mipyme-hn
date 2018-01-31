<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="TipoImpuestos.aspx.cs" Inherits="MiPymes_V2.es.Configuraciones.TipoImpuestos" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-ticket "></i>
                Configuraciones
                <span>>
                    Tipos de Impuestos
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
                        <h2>Información de Impuestos </h2>
                    </header>
                    <div>
                        <dx:ASPxGridView ID="gvTiposImpuestos" runat="server" AutoGenerateColumns="False" DataSourceID="dsTipoImpuestos" KeyFieldName="TipoImpuestoId;EmpresaId" Theme="MaterialCompact" Width="100%" EnableTheming="True" OnRowInserting="gvTiposImpuestos_RowInserting">
                            
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
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" />
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" Visible="False">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="TipoImpuestoId" ReadOnly="True" VisibleIndex="1" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="5">
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataTextColumn FieldName="Tarifa" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="p">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                           
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsTipoImpuestos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [TipoImpuestos] WHERE [TipoImpuestoId] = @original_TipoImpuestoId AND [EmpresaId] = @original_EmpresaId AND (([Nombre] = @original_Nombre) OR ([Nombre] IS NULL AND @original_Nombre IS NULL)) AND (([Tarifa] = @original_Tarifa) OR ([Tarifa] IS NULL AND @original_Tarifa IS NULL)) AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))" InsertCommand="INSERT INTO [TipoImpuestos] ([TipoImpuestoId], [EmpresaId], [Nombre], [Tarifa], [Activo]) VALUES (@TipoImpuestoId, @EmpresaId, @Nombre, @Tarifa, @Activo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TipoImpuestos] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [TipoImpuestos] SET [Nombre] = @Nombre, [Tarifa] = @Tarifa, [Activo] = @Activo WHERE [TipoImpuestoId] = @original_TipoImpuestoId AND [EmpresaId] = @original_EmpresaId AND (([Nombre] = @original_Nombre) OR ([Nombre] IS NULL AND @original_Nombre IS NULL)) AND (([Tarifa] = @original_Tarifa) OR ([Tarifa] IS NULL AND @original_Tarifa IS NULL)) AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_TipoImpuestoId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_Tarifa" Type="Double" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="TipoImpuestoId" Type="Int32" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="Tarifa" Type="Double" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="Tarifa" Type="Double" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                                <asp:Parameter Name="original_TipoImpuestoId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_Tarifa" Type="Double" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>

                </div>
            </article>
        </div>
        <div></div>
    </section>

</asp:Content>
