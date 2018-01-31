<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="GruposSocioNegocio.aspx.cs" Inherits="MiPymes_V2.es.Configuraciones.GruposSocioNegocio" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-sitemap "></i>
                 Clientes - Proveedores
                <span>>
                    Grupo de Negocios
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
                        <h2>Información de Grupos de Negocio </h2>
                    </header>
                   <div>
                       <dx:ASPxGridView ID="gvSocioNegocio" runat="server" AutoGenerateColumns="False"  Theme="MaterialCompact" Width="100%" EnableTheming="True" DataSourceID="dsGrupoSociosNegocio" KeyFieldName="GrupoSocioNegocioId;EmpresaId" OnRowInserting="gvSocioNegocio_RowInserting" >
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
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                                </SettingsAdaptivity>
                               
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="25" PageSize="25">
                                <AllButton Visible="True">
                                </AllButton>
                            </SettingsPager>
                               
                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" />
                            
                           

                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="GrupoSocioNegocioId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="4">
                                </dx:GridViewDataCheckColumn>
                            </Columns>
                            
                           

                       </dx:ASPxGridView>
                       <asp:SqlDataSource ID="dsGrupoSociosNegocio" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [GrupoSociosNegocio] WHERE [GrupoSocioNegocioId] = @original_GrupoSocioNegocioId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))" InsertCommand="INSERT INTO [GrupoSociosNegocio] ([GrupoSocioNegocioId], [EmpresaId], [Nombre], [Activo]) VALUES (@GrupoSocioNegocioId, @EmpresaId, @Nombre, @Activo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [GrupoSociosNegocio] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [GrupoSociosNegocio] SET [Nombre] = @Nombre, [Activo] = @Activo WHERE [GrupoSocioNegocioId] = @original_GrupoSocioNegocioId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))">
                           <DeleteParameters>
                               <asp:Parameter Name="original_GrupoSocioNegocioId" Type="Int32" />
                               <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                               <asp:Parameter Name="original_Nombre" Type="String" />
                               <asp:Parameter Name="original_Activo" Type="Boolean" />
                           </DeleteParameters>
                           <InsertParameters>
                               <asp:Parameter Name="GrupoSocioNegocioId" Type="Int32" />
                               <asp:Parameter Name="EmpresaId" Type="Int32" />
                               <asp:Parameter Name="Nombre" Type="String" />
                               <asp:Parameter Name="Activo" Type="Boolean" />
                           </InsertParameters>
                           <SelectParameters>
                               <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                           </SelectParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="Nombre" Type="String" />
                               <asp:Parameter Name="Activo" Type="Boolean" />
                               <asp:Parameter Name="original_GrupoSocioNegocioId" Type="Int32" />
                               <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                               <asp:Parameter Name="original_Nombre" Type="String" />
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
