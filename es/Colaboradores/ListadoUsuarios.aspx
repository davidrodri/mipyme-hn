<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListadoUsuarios.aspx.cs" Inherits="MiPymes_V2.es.Colaboradores.ListadoUsuarios" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Colaboradores
                <span>>
                 Lista de Usuarios
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
                        
                        <dx:ASPxGridView ID="gvListadoUsuarios" runat="server" Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="dsUsuarios" KeyFieldName="UsuarioId;EmpresaId">
                              <Columns>
                                  <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
                                  </dx:GridViewCommandColumn>
                                  <dx:GridViewDataTextColumn FieldName="UsuarioId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" Visible="False" VisibleIndex="2">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="3">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Apellido" VisibleIndex="4">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Correo" VisibleIndex="5">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataCheckColumn FieldName="Bloqueado" VisibleIndex="6">
                                  </dx:GridViewDataCheckColumn>
                                  <dx:GridViewDataCheckColumn FieldName="CambiarClave" Visible="False" VisibleIndex="7">
                                  </dx:GridViewDataCheckColumn>
                                  <dx:GridViewDataComboBoxColumn FieldName="PerfilId" VisibleIndex="8">
                                      <PropertiesComboBox DataSourceID="dsPerfiles" TextField="Nombre" ValueField="PerfilId">
                                      </PropertiesComboBox>
                                  </dx:GridViewDataComboBoxColumn>
                              </Columns>
                              <Toolbars>
                                <dx:GridViewToolbar ItemAlign="Left" EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="New" Name="Nuevo" Text="Nuevo" Visible="False" />
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
                           
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsUsuarios" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [UsuarioId] = @original_UsuarioId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND (([Apellido] = @original_Apellido) OR ([Apellido] IS NULL AND @original_Apellido IS NULL)) AND [Correo] = @original_Correo AND [Clave] = @original_Clave AND (([Bloqueado] = @original_Bloqueado) OR ([Bloqueado] IS NULL AND @original_Bloqueado IS NULL)) AND (([CambiarClave] = @original_CambiarClave) OR ([CambiarClave] IS NULL AND @original_CambiarClave IS NULL)) AND [PerfilId] = @original_PerfilId" InsertCommand="INSERT INTO [Usuarios] ([UsuarioId], [EmpresaId], [Nombre], [Apellido], [Correo], [Clave], [Bloqueado], [CambiarClave], [PerfilId]) VALUES (@UsuarioId, @EmpresaId, @Nombre, @Apellido, @Correo, @Clave, @Bloqueado, @CambiarClave, @PerfilId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Usuarios] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [Usuarios] SET [Nombre] = @Nombre, [Apellido] = @Apellido, [Correo] = @Correo, [Bloqueado] = @Bloqueado, [CambiarClave] = @CambiarClave, [PerfilId] = @PerfilId WHERE [UsuarioId] = @original_UsuarioId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND (([Apellido] = @original_Apellido) OR ([Apellido] IS NULL AND @original_Apellido IS NULL)) AND [Correo] = @original_Correo  AND (([Bloqueado] = @original_Bloqueado) OR ([Bloqueado] IS NULL AND @original_Bloqueado IS NULL)) AND (([CambiarClave] = @original_CambiarClave) OR ([CambiarClave] IS NULL AND @original_CambiarClave IS NULL)) AND [PerfilId] = @original_PerfilId">
                            <DeleteParameters>
                                <asp:Parameter Name="original_UsuarioId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_Apellido" Type="String" />
                                <asp:Parameter Name="original_Correo" Type="String" />
                                <asp:Parameter Name="original_Clave" Type="Object" />
                                <asp:Parameter Name="original_Bloqueado" Type="Boolean" />
                                <asp:Parameter Name="original_CambiarClave" Type="Boolean" />
                                <asp:Parameter Name="original_PerfilId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="UsuarioId" Type="Int32" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="Apellido" Type="String" />
                                <asp:Parameter Name="Correo" Type="String" />
                                <asp:Parameter Name="Clave" Type="Object" />
                                <asp:Parameter Name="Bloqueado" Type="Boolean" />
                                <asp:Parameter Name="CambiarClave" Type="Boolean" />
                                <asp:Parameter Name="PerfilId" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="Apellido" Type="String" />
                                <asp:Parameter Name="Correo" Type="String" />
                                <asp:Parameter Name="Bloqueado" Type="Boolean" />
                                <asp:Parameter Name="CambiarClave" Type="Boolean" />
                                <asp:Parameter Name="PerfilId" Type="Int32" />
                                <asp:Parameter Name="original_UsuarioId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_Apellido" Type="String" />
                                <asp:Parameter Name="original_Correo" Type="String" />
                                <asp:Parameter Name="original_Bloqueado" Type="Boolean" />
                                <asp:Parameter Name="original_CambiarClave" Type="Boolean" />
                                <asp:Parameter Name="original_PerfilId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsPerfiles" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Perfiles"></asp:SqlDataSource>
                    </div>
                    <div>
                        <dx:ASPxButton ID="btnRestablecerContra" runat="server" Text="Restablecer Contraseña" Theme="MaterialCompact" OnClick="btnRestablecerContra_Click" Width="25%">
                        </dx:ASPxButton>
                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
