<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="RealizarCompras.aspx.cs" Inherits="MiPymes_V2.es.Compras.RealizarCompras" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                    <h1 class="page-title txt-color-blueDark">
                        <i class="fa-fw fa fa-cart-plus "></i>
                        Compras
                <span>>
                  Compra
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
                                <h2>Información de Compra</h2>
                            </header>

                            <div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <dx:BootstrapFormLayout runat="server">
                                            <Items>

                                                <dx:BootstrapLayoutItem Caption="Proveedor" ColSpanSm="9">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxComboBox ID="cboProveedor" runat="server" DataSourceID="dsSociosNegocio" TextField="NombreSocioNegocio" ValueField="SocioNegocioId" Theme="MaterialCompact" Width="100%">
                                                                <ValidationSettings ValidationGroup="Validation">
                                                                    <RequiredField IsRequired="true" ErrorText="Proveedor es Requerido" />
                                                                </ValidationSettings>
                                                            </dx:ASPxComboBox>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="No. Documento" ColSpanSm="2" HorizontalAlign="Right">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxButtonEdit ID="txtNoDocumento" runat="server" Width="100%" HorizontalAlign="Left" Theme="MaterialCompact" ReadOnly="True">
                                                            </dx:ASPxButtonEdit>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="Moneda" ColSpanSm="4">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxComboBox ID="cboMoneda" Width="100%" HorizontalAlign="Right" Theme="MaterialCompact" runat="server" ValueType="System.String" DataSourceID="dsMonedas" TextField="Nombre" ValueField="MonedaId">
                                                                 <ValidationSettings ValidationGroup="Validation">
                                                                    <RequiredField IsRequired="true" ErrorText="Moneda es Requerida" />
                                                                </ValidationSettings>
                                                            </dx:ASPxComboBox>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="Tasa" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxSpinEdit ID="spinTasaCambio" runat="server" Number="1" Theme="MaterialCompact" DecimalPlaces="2" DisplayFormatString="n2">
                                                                <SpinButtons ClientVisible="False">
                                                                </SpinButtons>

                                                            </dx:ASPxSpinEdit>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="2">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="Estado" ColSpanSm="3" HorizontalAlign="Right">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxComboBox ID="cboEstado" Width="100%" HorizontalAlign="Right" Theme="MaterialCompact" runat="server" ValueType="System.String" DataSourceID="dsEstadosDocumento" TextField="Nombre" ValueField="EstadoDocumentoId" ReadOnly="True"></dx:ASPxComboBox>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="Productos" ColSpanSm="7">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxComboBox ID="cboProductos" runat="server" DataSourceID="dsProductosPorEmpresa" TextField="Nombre" ValueField="ProductoId" Theme="MaterialCompact" Width="100%">
                                                                 <ValidationSettings ValidationGroup="Validation">
                                                                    <RequiredField IsRequired="true" ErrorText="Producto es Requerido" />
                                                                </ValidationSettings>
                                                            </dx:ASPxComboBox>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Agregar" Theme="MaterialCompact">
                                                            </dx:ASPxButton>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="2">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <%--<dx:ASPxButton ID="btnBuscarOrdenCompra" runat="server" Text=".." Theme="MaterialCompact" OnClick="btnBuscarOrdenCompra_Click"></dx:ASPxButton>--%>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                            </Items>
                                        </dx:BootstrapFormLayout>


                                        <asp:SqlDataSource ID="dsProductosPorEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Productos WHERE EmpresaId = @EmpresaId">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <dx:ASPxGridView ID="gvGenerarOrdenCompra" runat="server" AutoGenerateColumns="False" Theme="MaterialCompact" KeyFieldName="ID" Width="100%">
                                            <SettingsBehavior AllowFocusedRow="True" />

                                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                                            </SettingsAdaptivity>
                                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="50" PageSize="50">
                                                <AllButton Visible="True">
                                                </AllButton>
                                            </SettingsPager>

                                            <SettingsSearchPanel Visible="True" />
                                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" GroupPanel="Coloque sus columnas aquí" />

                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Codigo" ReadOnly="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Producto" ReadOnly="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Cantidad" ReadOnly="True" VisibleIndex="4">
                                                    <DataItemTemplate>
                                                        <dx:ASPxSpinEdit ID="spinCantidad" runat="server" Number="0"
                                                            OnValueChanged="spinCantidad_ValueChanged" AutoPostBack="True" Value='<%# Bind("Cantidad") %>' Theme="MaterialCompact" Width="100%">
                                                            <SpinButtons ClientVisible="False">
                                                            </SpinButtons>
                                                            <Border BorderStyle="None" />
                                                        </dx:ASPxSpinEdit>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Precio" ReadOnly="True" VisibleIndex="5">
                                                    <DataItemTemplate>
                                                        <dx:ASPxSpinEdit ID="spinPrecio" runat="server" AutoPostBack="True" Number="0" Value='<%# Bind("Precio") %>' Theme="MaterialCompact" OnValueChanged="spinPrecio_ValueChanged" DisplayFormatString="n2" Width="100%">
                                                            <SpinButtons ClientVisible="False">
                                                            </SpinButtons>
                                                            <Border BorderStyle="None" />
                                                        </dx:ASPxSpinEdit>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Impuesto" ReadOnly="True" VisibleIndex="6" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Descuento" ReadOnly="True" VisibleIndex="7">
                                                    <DataItemTemplate>
                                                        <dx:ASPxSpinEdit ID="spinDescuento" runat="server" AutoPostBack="True" Number="0" Value='<%# Bind("Descuento") %>' Theme="MaterialCompact" OnValueChanged="spinDescuento_ValueChanged" DisplayFormatString="P" Width="100%">
                                                            <SpinButtons ClientVisible="False">
                                                            </SpinButtons>
                                                            <Border BorderStyle="None" />
                                                        </dx:ASPxSpinEdit>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TotalLinea" ReadOnly="True" VisibleIndex="8">
                                                    <DataItemTemplate>
                                                        <dx:ASPxSpinEdit ID="spinTotalLinea" runat="server" Number="0" Value='<%# Bind("TotalLinea") %>' Theme="MaterialCompact" Width="100%" DisplayFormatString="n2" ReadOnly="True">
                                                            <SpinButtons ClientVisible="False">
                                                            </SpinButtons>
                                                            <Border BorderStyle="None" />
                                                        </dx:ASPxSpinEdit>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Eliminar" VisibleIndex="0">
                                                    <DataItemTemplate>
                                                        <asp:LinkButton ID="LbElimimar" runat="server" CommandArgument='<%# Eval("ID") %>' OnCommand="LbElimimar_Command">Remover</asp:LinkButton>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>

                                        <br />
                                        <dx:BootstrapFormLayout runat="server">
                                            <Items>
                                                <dx:BootstrapLayoutItem Caption="Comentarios" ColSpanSm="6">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:BootstrapMemo ID="memoComentarios" runat="server" Rows="7"></dx:BootstrapMemo>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="SubTotal" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl>

                                                            <dx:ASPxSpinEdit ID="spinSubTotal" runat="server" Number="0" Theme="MaterialCompact" ReadOnly="True" DecimalPlaces="2" DisplayFormatString="n2">
                                                                <SpinButtons ClientVisible="False">
                                                                </SpinButtons>

                                                            </dx:ASPxSpinEdit>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="Descuento" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxSpinEdit ID="spinDescuentoDocumento" runat="server" Number="0" Theme="MaterialCompact" DecimalPlaces="2" DisplayFormatString="P" AutoPostBack="True" OnValueChanged="spinDescuentoDocumento_ValueChanged">
                                                                <SpinButtons ClientVisible="False">
                                                                </SpinButtons>
                                                            </dx:ASPxSpinEdit>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="Descto. Aplicado" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxSpinEdit ID="spinTotalDescuento" runat="server" Number="0" Theme="MaterialCompact" DecimalPlaces="2" DisplayFormatString="n2" ReadOnly="True">
                                                                <SpinButtons ClientVisible="False">
                                                                </SpinButtons>
                                                            </dx:ASPxSpinEdit>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>



                                                <dx:BootstrapLayoutItem Caption="Impuesto" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxSpinEdit ID="spinImpuesto" runat="server" Number="0" Theme="MaterialCompact" DecimalPlaces="2" DisplayFormatString="P" AutoPostBack="True" OnValueChanged="spinImpuesto_ValueChanged">
                                                                <SpinButtons ClientVisible="False">
                                                                </SpinButtons>

                                                            </dx:ASPxSpinEdit>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="Imp. Aplicado" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">
                                                            <dx:ASPxSpinEdit ID="spinTotalImpuesto" runat="server" Number="0" Theme="MaterialCompact" DecimalPlaces="2" DisplayFormatString="n2" ReadOnly="True">
                                                                <SpinButtons ClientVisible="False">
                                                                </SpinButtons>

                                                            </dx:ASPxSpinEdit>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>

                                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="Total Pagar" ColSpanSm="3">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxSpinEdit ID="spinTotal" runat="server" Number="0" Theme="MaterialCompact" ReadOnly="True" DecimalPlaces="2" DisplayFormatString="n2">
                                                                <SpinButtons ClientVisible="False">
                                                                </SpinButtons>

                                                            </dx:ASPxSpinEdit>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="3" BeginRow="True">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:ASPxButton ID="btnProcesar" runat="server" Text="Procesar" Theme="MaterialCompact" OnClick="btnProcesar_Click">
                                                                 <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                                            </dx:ASPxButton>
                                                            <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Theme="MaterialCompact" OnClick="btnCancelar_Click">
                                                            </dx:ASPxButton>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                                <dx:BootstrapLayoutItem Caption="" ColSpanSm="1">
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapLayoutItem>
                                            </Items>
                                        </dx:BootstrapFormLayout>


                                        <asp:SqlDataSource ID="dsOrdenCompra" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT '' Codigo, '' Producto, 0 Cantidad,0 Precio,0 Impuesto, 0 Descuento, 0 TotalLinea"></asp:SqlDataSource>

                                        <asp:SqlDataSource ID="dsEstadosDocumento" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM EstadosDocumento"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="dsSociosNegocio" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT SocioNegocioId,NombreSocioNegocio FROM SociosNegocio WHERE TipoSocioNegocioId =2 AND EmpresaId = @EmpresaId">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="dsMonedas" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="select * from Monedas"></asp:SqlDataSource>


                                    </ContentTemplate>


                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </article>
                </div>

            </section>
        </ContentTemplate>


    </asp:UpdatePanel>
</asp:Content>
