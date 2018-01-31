<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Almacenes.aspx.cs" Inherits="MiPymes_V2.es.Inventarios.Almacenes" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
               Inventarios
                <span>>
                  Almacenes
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
                        <h2>Información de Almacén</h2>
                    </header>
                   
                    <div>
                        <dx:ASPxGridView ID="gvAlmacenes" runat="server" Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="dsAlmacenes" KeyFieldName="AlmacenId" OnRowInserting="gvAlmacenes_RowInserting">
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
                            <SettingsBehavior AllowFocusedRow="true" />
                             <SettingsDetail ShowDetailRow="True" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                             <SettingsPager AlwaysShowPager="True" NumericButtonCount="50" PageSize="50">
                                            <AllButton Visible="True">
                                            </AllButton>
                                        </SettingsPager>

                                        <SettingsSearchPanel Visible="True" />
                                        <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" GroupPanel="Coloque sus columnas aquí" />
                            
                             <Columns>
                                 <dx:GridViewCommandColumn VisibleIndex="0">
                                 </dx:GridViewCommandColumn>
                                 <dx:GridViewDataTextColumn FieldName="AlmacenId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" Visible="False" VisibleIndex="2">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="3">
                                 </dx:GridViewDataTextColumn>
                             </Columns>
                            
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsAlmacenes" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [Almacenes] WHERE [AlmacenId] = @original_AlmacenId AND [EmpresaId] = @original_EmpresaId AND (([Nombre] = @original_Nombre) OR ([Nombre] IS NULL AND @original_Nombre IS NULL))" InsertCommand="INSERT INTO [Almacenes] ([AlmacenId], [EmpresaId], [Nombre]) VALUES (@AlmacenId, @EmpresaId, @Nombre)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Almacenes] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [Almacenes] SET [Nombre] = @Nombre WHERE [AlmacenId] = @original_AlmacenId AND [EmpresaId] = @original_EmpresaId AND (([Nombre] = @original_Nombre) OR ([Nombre] IS NULL AND @original_Nombre IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_AlmacenId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="AlmacenId" Type="Int32" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="Nombre" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="original_AlmacenId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>
                </article>
            </div>
          </section>
</asp:Content>
