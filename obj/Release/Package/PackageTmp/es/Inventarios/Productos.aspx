<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="MiPymes_V2.es.Inventarios.Productos" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                <h1 class="page-title txt-color-blueDark">
                    <i class="fa-fw fa fa-cube"></i>
                   Inventarios
                <span>>
                    Productos
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

                            <dx:BootstrapFormLayout runat="server">
                                <Items>
                                     <dx:BootstrapLayoutItem Caption="Codigo" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Codígo del producto" ID="txtCodigo">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Codigo es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Producto" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Nombre del producto" ID="txtProducto">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Nombre es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                     <dx:BootstrapLayoutItem Caption="Categoria" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox runat="server" NullText="Categoria de Producto" ID="cboCategoria" DataSourceID="dsCategoria" TextField="Descripcion" ValueField="CategoriaProductoId">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Categoria es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM CategoriaProductos WHERE EmpresaId=@EmpresaId">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Tipo" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox runat="server" NullText="Tipo de Producto" ID="cboTipoProducto" DataSourceID="dsTipoProductos" TextField="Nombre" ValueField="TipoProductoId">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Tipo es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsTipoProductos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM TipoProductos"></asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Descripcion" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapMemo runat="server" NullText="Ingrese la descripción del producto" Rows="4" ID="memoDescripcion" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                   
                                   <dx:BootstrapLayoutItem Caption="Almacén" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox runat="server" NullText="Almacén de Producto" ID="cboAlmacen" DataSourceID="dsAlmacen" TextField="Nombre" ValueField="AlmacenId">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Almacén es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsAlmacen" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Almacenes WHERE EmpresaId = @EmpresaId">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                    

                                    <dx:BootstrapLayoutItem Caption="Inventario Minimo" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapSpinEdit ID="spinInvMinimo" runat="server" NullText="0" Number="0" NumberType="Integer" >
                                                    
                                                    <SpinButtons ClientVisible="False" ShowIncrementButtons="False" />
                                                    
                                                </dx:BootstrapSpinEdit>
                                                
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                    <dx:BootstrapLayoutItem Caption="Inventario Maximo" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapSpinEdit ID="spinInvMaximo" runat="server" NullText="0" Number="0">
                                                    <SpinButtons ClientVisible="False" ShowIncrementButtons="False" />
                                                </dx:BootstrapSpinEdit>
                                                
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                     
                                    
                                    <dx:BootstrapLayoutItem Caption="Precio Costo" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapSpinEdit ID="spinPrecioCosto" runat="server" NullText="0" Number="0" DecimalPlaces="2" DisplayFormatString="n2">
                                                    <ClearButton DisplayMode="Never" />
                                                    <SpinButtons ClientVisible="False" ShowIncrementButtons="False" />
                                                </dx:BootstrapSpinEdit>
                                                
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                     <dx:BootstrapLayoutItem Caption="Precio Venta" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapSpinEdit ID="spinPrecioVenta" runat="server" NullText="0" Number="0" DisplayFormatString="n2">
                                                    <SpinButtons ClientVisible="False" ShowIncrementButtons="False" />
                                                </dx:BootstrapSpinEdit>
                                                
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                 
                                    
                                    <dx:BootstrapLayoutItem Caption="Impuestos de Compra" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox runat="server" NullText="Impuestos de Compra" ID="cboImpuestoCompra" DataSourceID="dsTipoImpuestos" TextField="Nombre" ValueField="TipoImpuestoId">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Impuesto es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsTipoImpuestos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM TipoImpuestos WHERE EmpresaId = @EmpresaId">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    
                                    <dx:BootstrapLayoutItem Caption="Impuestos de Venta" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox runat="server" NullText="Impuestos de Venta" ID="cboImpuestoVenta" DataSourceID="dsTipoImpuestos" TextField="Nombre" ValueField="TipoImpuestoId">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Impuesto es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapComboBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                   
                                    <dx:BootstrapLayoutItem ColSpanSm="12" ShowCaption="False" HorizontalAlign="Right">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapButton runat="server" Text="Guardar" AutoPostBack="true" ID="btnguardar" OnClick="btnguardar_Click" >
                                                    <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                                    <CssClasses Icon="fa fa-check" />
                                                    <SettingsBootstrap RenderOption="Primary" />
                                                </dx:BootstrapButton>
                                                <dx:BootstrapButton runat="server" Text="Cancelar" AutoPostBack="false" ID="btnCancelar" >
                                                    <SettingsBootstrap RenderOption="Danger" />
                                                </dx:BootstrapButton>
                                            </dx:ContentControl>
                                        </ContentCollection>

                                    </dx:BootstrapLayoutItem>
                                </Items>


                            </dx:BootstrapFormLayout>

                            
                        </div>
                    </div>
                </article>
            </div>



        </section>
</asp:Content>
