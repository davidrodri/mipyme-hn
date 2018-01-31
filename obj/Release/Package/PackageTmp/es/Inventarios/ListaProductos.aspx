<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="MiPymes_V2.es.Inventarios.ListaProductos" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-cube"></i>
                Inventarios
                <span>>
                    Lista de Productos
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
                        <h2>Información de Productos </h2>
                    </header>
     
                    <div>
                        <dx:ASPxGridView ID="gvListarProductos" runat="server" Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="dsProductos" KeyFieldName="ProductoId;EmpresaId">
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
                                  <dx:GridViewCommandColumn VisibleIndex="0" Visible="False">
                                  </dx:GridViewCommandColumn>
                                  <dx:GridViewDataTextColumn FieldName="ProductoId" ReadOnly="True" VisibleIndex="1" Caption="Código" ShowInCustomizationForm="True">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" VisibleIndex="2" ShowInCustomizationForm="True" Visible="False">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="3" Caption="Producto" ShowInCustomizationForm="True">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="6" ShowInCustomizationForm="True">
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="14" ShowInCustomizationForm="True">
                                  </dx:GridViewDataCheckColumn>
                                  <dx:GridViewDataComboBoxColumn Caption="Categoría" FieldName="CategoriaProductoId" VisibleIndex="4">
                                      <PropertiesComboBox DataSourceID="dscategoriaproductos" TextField="Descripcion" ValueField="CategoriaProductoId">
                                      </PropertiesComboBox>
                                  </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataComboBoxColumn Caption="Tipo" FieldName="TipoProductoId" VisibleIndex="5">
                                      <PropertiesComboBox DataSourceID="dstipoproductos" TextField="Nombre" ValueField="TipoProductoId">
                                      </PropertiesComboBox>
                                  </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataComboBoxColumn Caption="Almacén" FieldName="AlmacenId" VisibleIndex="7">
                                      <PropertiesComboBox DataSourceID="dsalmacenes" TextField="Nombre" ValueField="AlmacenId">
                                      </PropertiesComboBox>
                                  </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataSpinEditColumn Caption="Inv. Minimo" FieldName="InventarioMinimo" VisibleIndex="8">
                                      <PropertiesSpinEdit DisplayFormatString="g">
                                      </PropertiesSpinEdit>
                                  </dx:GridViewDataSpinEditColumn>
                                  <dx:GridViewDataSpinEditColumn Caption="Inv. Maximo" FieldName="InventarioMaximo" VisibleIndex="9">
                                      <PropertiesSpinEdit DisplayFormatString="g">
                                      </PropertiesSpinEdit>
                                  </dx:GridViewDataSpinEditColumn>
                                  <dx:GridViewDataComboBoxColumn Caption="Impuesto Compra" FieldName="TipoImpuestoIdCompra" VisibleIndex="10">
                                      <PropertiesComboBox DataSourceID="dstipoimpuestos" TextField="Nombre" ValueField="TipoImpuestoId">
                                          <Columns>
                                              <dx:ListBoxColumn Caption="Nombre" FieldName="Nombre">
                                              </dx:ListBoxColumn>
                                              <dx:ListBoxColumn Caption="Tarifa" FieldName="Tarifa">
                                              </dx:ListBoxColumn>
                                          </Columns>
                                      </PropertiesComboBox>
                                  </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataComboBoxColumn Caption="Impuesto Venta" FieldName="TipoImpuestoIdVenta" VisibleIndex="11">
                                      <PropertiesComboBox DataSourceID="dstipoimpuestos" TextField="Nombre" ValueField="TipoImpuestoId">
                                          <Columns>
                                              <dx:ListBoxColumn Caption="Nombre" FieldName="Nombre">
                                              </dx:ListBoxColumn>
                                              <dx:ListBoxColumn Caption="Tarifa" FieldName="Tarifa">
                                              </dx:ListBoxColumn>
                                          </Columns>
                                      </PropertiesComboBox>
                                  </dx:GridViewDataComboBoxColumn>
                                  <dx:GridViewDataSpinEditColumn FieldName="PrecioCosto" VisibleIndex="12">
                                      <PropertiesSpinEdit DisplayFormatString="n2" NumberFormat="Custom" DecimalPlaces="2">
                                      </PropertiesSpinEdit>
                                  </dx:GridViewDataSpinEditColumn>
                                  <dx:GridViewDataSpinEditColumn FieldName="PrecioVenta" VisibleIndex="13">
                                      <PropertiesSpinEdit DisplayFormatString="n2" NumberFormat="Custom" DecimalPlaces="2">
                                      </PropertiesSpinEdit>
                                  </dx:GridViewDataSpinEditColumn>
                              </Columns>
                            
                        </dx:ASPxGridView>
                        
                        <asp:SqlDataSource ID="dsProductos" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [Productos] WHERE [ProductoId] = @original_ProductoId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND [CategoriaProductoId] = @original_CategoriaProductoId AND [TipoProductoId] = @original_TipoProductoId AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND (([AlmacenId] = @original_AlmacenId) OR ([AlmacenId] IS NULL AND @original_AlmacenId IS NULL)) AND (([InventarioMinimo] = @original_InventarioMinimo) OR ([InventarioMinimo] IS NULL AND @original_InventarioMinimo IS NULL)) AND (([InventarioMaximo] = @original_InventarioMaximo) OR ([InventarioMaximo] IS NULL AND @original_InventarioMaximo IS NULL)) AND (([TipoImpuestoIdCompra] = @original_TipoImpuestoIdCompra) OR ([TipoImpuestoIdCompra] IS NULL AND @original_TipoImpuestoIdCompra IS NULL)) AND (([TipoImpuestoIdVenta] = @original_TipoImpuestoIdVenta) OR ([TipoImpuestoIdVenta] IS NULL AND @original_TipoImpuestoIdVenta IS NULL)) AND (([PrecioCosto] = @original_PrecioCosto) OR ([PrecioCosto] IS NULL AND @original_PrecioCosto IS NULL)) AND (([PrecioVenta] = @original_PrecioVenta) OR ([PrecioVenta] IS NULL AND @original_PrecioVenta IS NULL)) AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))" InsertCommand="INSERT INTO [Productos] ([ProductoId], [EmpresaId], [Nombre], [CategoriaProductoId], [TipoProductoId], [Descripcion], [AlmacenId], [InventarioMinimo], [InventarioMaximo], [TipoImpuestoIdCompra], [TipoImpuestoIdVenta], [PrecioCosto], [PrecioVenta], [Activo]) VALUES (@ProductoId, @EmpresaId, @Nombre, @CategoriaProductoId, @TipoProductoId, @Descripcion, @AlmacenId, @InventarioMinimo, @InventarioMaximo, @TipoImpuestoIdCompra, @TipoImpuestoIdVenta, @PrecioCosto, @PrecioVenta, @Activo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Productos] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [Productos] SET [Nombre] = @Nombre, [CategoriaProductoId] = @CategoriaProductoId, [TipoProductoId] = @TipoProductoId, [Descripcion] = @Descripcion, [AlmacenId] = @AlmacenId, [InventarioMinimo] = @InventarioMinimo, [InventarioMaximo] = @InventarioMaximo, [TipoImpuestoIdCompra] = @TipoImpuestoIdCompra, [TipoImpuestoIdVenta] = @TipoImpuestoIdVenta, [PrecioCosto] = @PrecioCosto, [PrecioVenta] = @PrecioVenta, [Activo] = @Activo WHERE [ProductoId] = @original_ProductoId AND [EmpresaId] = @original_EmpresaId AND [Nombre] = @original_Nombre AND [CategoriaProductoId] = @original_CategoriaProductoId AND [TipoProductoId] = @original_TipoProductoId AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND (([AlmacenId] = @original_AlmacenId) OR ([AlmacenId] IS NULL AND @original_AlmacenId IS NULL)) AND (([InventarioMinimo] = @original_InventarioMinimo) OR ([InventarioMinimo] IS NULL AND @original_InventarioMinimo IS NULL)) AND (([InventarioMaximo] = @original_InventarioMaximo) OR ([InventarioMaximo] IS NULL AND @original_InventarioMaximo IS NULL)) AND (([TipoImpuestoIdCompra] = @original_TipoImpuestoIdCompra) OR ([TipoImpuestoIdCompra] IS NULL AND @original_TipoImpuestoIdCompra IS NULL)) AND (([TipoImpuestoIdVenta] = @original_TipoImpuestoIdVenta) OR ([TipoImpuestoIdVenta] IS NULL AND @original_TipoImpuestoIdVenta IS NULL)) AND (([PrecioCosto] = @original_PrecioCosto) OR ([PrecioCosto] IS NULL AND @original_PrecioCosto IS NULL)) AND (([PrecioVenta] = @original_PrecioVenta) OR ([PrecioVenta] IS NULL AND @original_PrecioVenta IS NULL)) AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_ProductoId" Type="String" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_CategoriaProductoId" Type="Int32" />
                                <asp:Parameter Name="original_TipoProductoId" Type="Int32" />
                                <asp:Parameter Name="original_Descripcion" Type="String" />
                                <asp:Parameter Name="original_AlmacenId" Type="Int32" />
                                <asp:Parameter Name="original_InventarioMinimo" Type="Int32" />
                                <asp:Parameter Name="original_InventarioMaximo" Type="Int32" />
                                <asp:Parameter Name="original_TipoImpuestoIdCompra" Type="Int32" />
                                <asp:Parameter Name="original_TipoImpuestoIdVenta" Type="Int32" />
                                <asp:Parameter Name="original_PrecioCosto" Type="Decimal" />
                                <asp:Parameter Name="original_PrecioVenta" Type="Decimal" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ProductoId" Type="String" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="CategoriaProductoId" Type="Int32" />
                                <asp:Parameter Name="TipoProductoId" Type="Int32" />
                                <asp:Parameter Name="Descripcion" Type="String" />
                                <asp:Parameter Name="AlmacenId" Type="Int32" />
                                <asp:Parameter Name="InventarioMinimo" Type="Int32" />
                                <asp:Parameter Name="InventarioMaximo" Type="Int32" />
                                <asp:Parameter Name="TipoImpuestoIdCompra" Type="Int32" />
                                <asp:Parameter Name="TipoImpuestoIdVenta" Type="Int32" />
                                <asp:Parameter Name="PrecioCosto" Type="Decimal" />
                                <asp:Parameter Name="PrecioVenta" Type="Decimal" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Nombre" Type="String" />
                                <asp:Parameter Name="CategoriaProductoId" Type="Int32" />
                                <asp:Parameter Name="TipoProductoId" Type="Int32" />
                                <asp:Parameter Name="Descripcion" Type="String" />
                                <asp:Parameter Name="AlmacenId" Type="Int32" />
                                <asp:Parameter Name="InventarioMinimo" Type="Int32" />
                                <asp:Parameter Name="InventarioMaximo" Type="Int32" />
                                <asp:Parameter Name="TipoImpuestoIdCompra" Type="Int32" />
                                <asp:Parameter Name="TipoImpuestoIdVenta" Type="Int32" />
                                <asp:Parameter Name="PrecioCosto" Type="Decimal" />
                                <asp:Parameter Name="PrecioVenta" Type="Decimal" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                                <asp:Parameter Name="original_ProductoId" Type="String" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_Nombre" Type="String" />
                                <asp:Parameter Name="original_CategoriaProductoId" Type="Int32" />
                                <asp:Parameter Name="original_TipoProductoId" Type="Int32" />
                                <asp:Parameter Name="original_Descripcion" Type="String" />
                                <asp:Parameter Name="original_AlmacenId" Type="Int32" />
                                <asp:Parameter Name="original_InventarioMinimo" Type="Int32" />
                                <asp:Parameter Name="original_InventarioMaximo" Type="Int32" />
                                <asp:Parameter Name="original_TipoImpuestoIdCompra" Type="Int32" />
                                <asp:Parameter Name="original_TipoImpuestoIdVenta" Type="Int32" />
                                <asp:Parameter Name="original_PrecioCosto" Type="Decimal" />
                                <asp:Parameter Name="original_PrecioVenta" Type="Decimal" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        
                    </div>
                </div>
                <asp:SqlDataSource ID="dscategoriaproductos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM CategoriaProductos WHERE EmpresaId = @EmpresaId">
                    <SelectParameters>
                        <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dstipoproductos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM TipoProductos "></asp:SqlDataSource>
                <asp:SqlDataSource ID="dsalmacenes" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Almacenes WHERE EmpresaId =  @EmpresaId">
                    <SelectParameters>
                        <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dstipoimpuestos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM TipoImpuestos WHERE EmpresaId =  @EmpresaId ">
                    <SelectParameters>
                        <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </article>
        </div>



    </section>
</asp:Content>
