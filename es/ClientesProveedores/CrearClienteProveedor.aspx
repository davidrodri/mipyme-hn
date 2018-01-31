<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearClienteProveedor.aspx.cs" Inherits="MiPymes_V2.es.ClientesProveedores.CrearClienteProveedor" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Clientes - Proveedores
                <span>>
                  Crear Socio de Negocio
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
                        <h2>Información de Clientes - Proveedores</h2>
                    </header>
                    <div>
                        <dx:ASPxGridView ID="gvSocioNegocio" runat="server"  Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="dsSocioNegocio" KeyFieldName="SocioNegocioId;EmpresaId" OnRowInserting="gvSocioNegocio_RowInserting">
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


                            <Settings ShowGroupPanel="True" />
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="SocioNegocioId" VisibleIndex="1" Caption="Código">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreSocioNegocio" VisibleIndex="3" Caption="Nombre">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn FieldName="PagaImpuesto" VisibleIndex="6" Visible="False">
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataTextColumn FieldName="Telefono" VisibleIndex="10">
                                    <PropertiesTextEdit>
                                        <MaskSettings Mask="+(999) 0000-0000" />
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CorreoElectronico" VisibleIndex="11">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Cai" VisibleIndex="13">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="FechaCai" VisibleIndex="14">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="Rtn" VisibleIndex="15">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="16">
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Grupo de Socios" FieldName="GrupoSocioNegocioId" VisibleIndex="4">
                                    <PropertiesComboBox DataSourceID="dsGrupoSociosNegocio" TextField="Nombre" ValueField="GrupoSocioNegocioId">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Tipo de Socio" FieldName="TipoSocioNegocioId" VisibleIndex="5">
                                    <PropertiesComboBox DataSourceID="dsTiposSocioNegocio" TextField="Nombre" ValueField="TipoSocioNegocioId">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataMemoColumn Caption="Dirección" FieldName="Direccion" VisibleIndex="9">
                                </dx:GridViewDataMemoColumn>
                                <dx:GridViewDataSpinEditColumn FieldName="LimiteCredito" VisibleIndex="12">
                                    <PropertiesSpinEdit DisplayFormatString="n2" NumberFormat="Custom">
                                        <SpinButtons ClientVisible="False">
                                        </SpinButtons>
                                    </PropertiesSpinEdit>
                                </dx:GridViewDataSpinEditColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Condición de Pago" FieldName="CondicionPagoId" VisibleIndex="7">
                                    <PropertiesComboBox DataSourceID="dsCondicionPago" TextField="Nombre" ValueField="CondicionPagoId">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Condición" FieldName="Nombre">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Días" FieldName="DiasCredito">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Departamento" FieldName="DepartamentoId" VisibleIndex="8">
                                    <PropertiesComboBox DataSourceID="dsDepartamentos" TextField="Nombre" ValueField="DepartamentoId">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>

                        </dx:ASPxGridView>
                        
                        <asp:SqlDataSource ID="dsSocioNegocio" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [SociosNegocio] WHERE [SocioNegocioId] = @original_SocioNegocioId AND [EmpresaId] = @original_EmpresaId AND [TipoSocioNegocioId] = @original_TipoSocioNegocioId AND [GrupoSocioNegocioId] = @original_GrupoSocioNegocioId AND [NombreSocioNegocio] = @original_NombreSocioNegocio AND (([PagaImpuesto] = @original_PagaImpuesto) OR ([PagaImpuesto] IS NULL AND @original_PagaImpuesto IS NULL)) AND (([CondicionPagoId] = @original_CondicionPagoId) OR ([CondicionPagoId] IS NULL AND @original_CondicionPagoId IS NULL)) AND (([DepartamentoId] = @original_DepartamentoId) OR ([DepartamentoId] IS NULL AND @original_DepartamentoId IS NULL)) AND (([Direccion] = @original_Direccion) OR ([Direccion] IS NULL AND @original_Direccion IS NULL)) AND (([Telefono] = @original_Telefono) OR ([Telefono] IS NULL AND @original_Telefono IS NULL)) AND (([CorreoElectronico] = @original_CorreoElectronico) OR ([CorreoElectronico] IS NULL AND @original_CorreoElectronico IS NULL)) AND (([LimiteCredito] = @original_LimiteCredito) OR ([LimiteCredito] IS NULL AND @original_LimiteCredito IS NULL)) AND (([Cai] = @original_Cai) OR ([Cai] IS NULL AND @original_Cai IS NULL)) AND (([FechaCai] = @original_FechaCai) OR ([FechaCai] IS NULL AND @original_FechaCai IS NULL)) AND (([Rtn] = @original_Rtn) OR ([Rtn] IS NULL AND @original_Rtn IS NULL)) AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))" InsertCommand="INSERT INTO [SociosNegocio] ([SocioNegocioId], [EmpresaId], [TipoSocioNegocioId], [GrupoSocioNegocioId], [NombreSocioNegocio], [PagaImpuesto], [CondicionPagoId], [DepartamentoId], [Direccion], [Telefono], [CorreoElectronico], [LimiteCredito], [Cai], [FechaCai], [Rtn], [Activo]) VALUES (@SocioNegocioId, @EmpresaId, @TipoSocioNegocioId, @GrupoSocioNegocioId, @NombreSocioNegocio, @PagaImpuesto, @CondicionPagoId, @DepartamentoId, @Direccion, @Telefono, @CorreoElectronico, @LimiteCredito, @Cai, @FechaCai, @Rtn, @Activo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SociosNegocio] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [SociosNegocio] SET [TipoSocioNegocioId] = @TipoSocioNegocioId, [GrupoSocioNegocioId] = @GrupoSocioNegocioId, [NombreSocioNegocio] = @NombreSocioNegocio, [PagaImpuesto] = @PagaImpuesto, [CondicionPagoId] = @CondicionPagoId, [DepartamentoId] = @DepartamentoId, [Direccion] = @Direccion, [Telefono] = @Telefono, [CorreoElectronico] = @CorreoElectronico, [LimiteCredito] = @LimiteCredito, [Cai] = @Cai, [FechaCai] = @FechaCai, [Rtn] = @Rtn, [Activo] = @Activo WHERE [SocioNegocioId] = @original_SocioNegocioId AND [EmpresaId] = @original_EmpresaId AND [TipoSocioNegocioId] = @original_TipoSocioNegocioId AND [GrupoSocioNegocioId] = @original_GrupoSocioNegocioId AND [NombreSocioNegocio] = @original_NombreSocioNegocio AND (([PagaImpuesto] = @original_PagaImpuesto) OR ([PagaImpuesto] IS NULL AND @original_PagaImpuesto IS NULL)) AND (([CondicionPagoId] = @original_CondicionPagoId) OR ([CondicionPagoId] IS NULL AND @original_CondicionPagoId IS NULL)) AND (([DepartamentoId] = @original_DepartamentoId) OR ([DepartamentoId] IS NULL AND @original_DepartamentoId IS NULL)) AND (([Direccion] = @original_Direccion) OR ([Direccion] IS NULL AND @original_Direccion IS NULL)) AND (([Telefono] = @original_Telefono) OR ([Telefono] IS NULL AND @original_Telefono IS NULL)) AND (([CorreoElectronico] = @original_CorreoElectronico) OR ([CorreoElectronico] IS NULL AND @original_CorreoElectronico IS NULL)) AND (([LimiteCredito] = @original_LimiteCredito) OR ([LimiteCredito] IS NULL AND @original_LimiteCredito IS NULL)) AND (([Cai] = @original_Cai) OR ([Cai] IS NULL AND @original_Cai IS NULL)) AND (([FechaCai] = @original_FechaCai) OR ([FechaCai] IS NULL AND @original_FechaCai IS NULL)) AND (([Rtn] = @original_Rtn) OR ([Rtn] IS NULL AND @original_Rtn IS NULL)) AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_SocioNegocioId" Type="String" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_TipoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="original_GrupoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="original_NombreSocioNegocio" Type="String" />
                                <asp:Parameter Name="original_PagaImpuesto" Type="Boolean" />
                                <asp:Parameter Name="original_CondicionPagoId" Type="Int32" />
                                <asp:Parameter Name="original_DepartamentoId" Type="Int32" />
                                <asp:Parameter Name="original_Direccion" Type="String" />
                                <asp:Parameter Name="original_Telefono" Type="String" />
                                <asp:Parameter Name="original_CorreoElectronico" Type="String" />
                                <asp:Parameter Name="original_LimiteCredito" Type="Decimal" />
                                <asp:Parameter Name="original_Cai" Type="String" />
                                <asp:Parameter Name="original_FechaCai" Type="DateTime" />
                                <asp:Parameter Name="original_Rtn" Type="String" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="SocioNegocioId" Type="String" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="TipoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="GrupoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="NombreSocioNegocio" Type="String" />
                                <asp:Parameter Name="PagaImpuesto" Type="Boolean" />
                                <asp:Parameter Name="CondicionPagoId" Type="Int32" />
                                <asp:Parameter Name="DepartamentoId" Type="Int32" />
                                <asp:Parameter Name="Direccion" Type="String" />
                                <asp:Parameter Name="Telefono" Type="String" />
                                <asp:Parameter Name="CorreoElectronico" Type="String" />
                                <asp:Parameter Name="LimiteCredito" Type="Decimal" />
                                <asp:Parameter Name="Cai" Type="String" />
                                <asp:Parameter Name="FechaCai" Type="DateTime" />
                                <asp:Parameter Name="Rtn" Type="String" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="TipoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="GrupoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="NombreSocioNegocio" Type="String" />
                                <asp:Parameter Name="PagaImpuesto" Type="Boolean" />
                                <asp:Parameter Name="CondicionPagoId" Type="Int32" />
                                <asp:Parameter Name="DepartamentoId" Type="Int32" />
                                <asp:Parameter Name="Direccion" Type="String" />
                                <asp:Parameter Name="Telefono" Type="String" />
                                <asp:Parameter Name="CorreoElectronico" Type="String" />
                                <asp:Parameter Name="LimiteCredito" Type="Decimal" />
                                <asp:Parameter Name="Cai" Type="String" />
                                <asp:Parameter Name="FechaCai" Type="DateTime" />
                                <asp:Parameter Name="Rtn" Type="String" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                                <asp:Parameter Name="original_SocioNegocioId" Type="String" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_TipoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="original_GrupoSocioNegocioId" Type="Int32" />
                                <asp:Parameter Name="original_NombreSocioNegocio" Type="String" />
                                <asp:Parameter Name="original_PagaImpuesto" Type="Boolean" />
                                <asp:Parameter Name="original_CondicionPagoId" Type="Int32" />
                                <asp:Parameter Name="original_DepartamentoId" Type="Int32" />
                                <asp:Parameter Name="original_Direccion" Type="String" />
                                <asp:Parameter Name="original_Telefono" Type="String" />
                                <asp:Parameter Name="original_CorreoElectronico" Type="String" />
                                <asp:Parameter Name="original_LimiteCredito" Type="Decimal" />
                                <asp:Parameter Name="original_Cai" Type="String" />
                                <asp:Parameter Name="original_FechaCai" Type="DateTime" />
                                <asp:Parameter Name="original_Rtn" Type="String" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        
                        <asp:SqlDataSource ID="dsGrupoSociosNegocio" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM GrupoSociosNegocio WHERE EmpresaId = @EmpresaId ">
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsTiposSocioNegocio" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM TiposSocioNegocio"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsCondicionPago" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM CondicionesPago WHERE EmpresaId = @EmpresaId">
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsDepartamentos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT DepartamentoId,Nombre FROM Departamentos"></asp:SqlDataSource>
                        
                        </div>

                    </div>
                </article>
            </div>
        </section>
</asp:Content>
