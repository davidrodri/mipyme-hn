<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Empresa.aspx.cs" Inherits="MiPymes_V2.es.Configuraciones.Empresa" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
        <div class="row">
            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                <h1 class="page-title txt-color-blueDark">
                    <i class="fa-fw fa fa-home "></i>
                    Configuraciones
                <span>>
                    Empresa
                </span>
                </h1>
            </div>
        </div>
     

    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="callb" OnCallback="ASPxCallbackPanel1_Callback">
        <PanelCollection>
            <dx:PanelContent runat="server">
                
            
    
        <section id="widget-grid" class="">
            <div class="row">
                <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0" data-widget-editbutton="false">
                        <header>
                            <span class="widget-icon"><i class="fa fa-table"></i></span>
                            <h2>Información Empresa </h2>
                        </header>
                        <div>

                            <dx:BootstrapFormLayout runat="server">
                                <Items>
                                    <dx:BootstrapLayoutItem Caption="Empresa" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Nombre de la empresa" ID="txtEmpresa">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Nombre es requerido" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="RTN" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Número de RTN de la empresa" ID="txtRTN">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="RTN es requerido" />

                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Moneda" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox ID="cboMoneda" NullText="Moneda por defecto" runat="server" DataSourceID="dsMonedas" TextField="Nombre" ValueField="MonedaId"></dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsMonedas" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Monedas WHERE Activo = 1"></asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Pais" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox ID="cboPaises" runat="server" DataSourceID="dsPaises" DropDownStyle="DropDown" TextField="Nombre" ValueField="PaisId">
                                                    <ClientSideEvents ValueChanged="function(s, e) {
	callb.PerformCallback(1);
}" />
                                                </dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsPaises" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Paises WHERE Activo = 1"></asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Departamento" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapComboBox ID="cboDepartamento" runat="server" DataSourceID="dsDepartamentos" TextField="Nombre" ValueField="PaisId"></dx:BootstrapComboBox>
                                                <asp:SqlDataSource ID="dsDepartamentos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Departamentos WHERE PaisId = @PaisId AND Activo=1">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="cboPaises" Name="PaisId" PropertyName="Value" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Telefono" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" ID="txtTelefono">
                                                    <MaskSettings Mask="+(000) 0000-0000" IncludeLiterals="None" ErrorText="Ingrese un número de telefono valido" />
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>

                                    <dx:BootstrapLayoutItem Caption="Correo" ColSpanSm="6">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapTextBox runat="server" NullText="Ingrese el correo electronico" Text="" ID="txtCorreo">
                                                    <ValidationSettings ValidationGroup="Validation">
                                                        <RequiredField IsRequired="true" ErrorText="Correo es requerido" />
                                                        <RegularExpression ErrorText="Correo Invalido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                    </ValidationSettings>
                                                </dx:BootstrapTextBox>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem Caption="Dirección" ColSpanSm="12">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapMemo runat="server" NullText="Ingrese la dirección de la empresa" Rows="4" ID="memoDireccion" />
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:BootstrapLayoutItem>
                                    <dx:BootstrapLayoutItem ColSpanSm="12" ShowCaption="False" HorizontalAlign="Right">
                                        <ContentCollection>
                                            <dx:ContentControl>
                                                <dx:BootstrapButton runat="server" Text="Guardar" AutoPostBack="true" ID="btnguardar" OnClick="btnguardar_Click">
                                                    <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                                    <CssClasses Icon="fa fa-check" />
                                                    <SettingsBootstrap RenderOption="Primary" />
                                                </dx:BootstrapButton>
                                                <dx:BootstrapButton runat="server" Text="Cancelar" AutoPostBack="false" ID="btnCancelar" OnClick="btnCancelar_Click">
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
      
</dx:PanelContent>
        </PanelCollection>
         </dx:ASPxCallbackPanel> 

           

    <asp:SqlDataSource ID="dsEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM Empresas WHERE EmpresaId = @EmpresaId">
                                <SelectParameters>
                                    <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" />
                                </SelectParameters>
                            </asp:SqlDataSource>


 </asp:Content>