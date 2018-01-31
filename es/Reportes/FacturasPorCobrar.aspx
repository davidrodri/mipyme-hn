<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="FacturasPorCobrar.aspx.cs" Inherits="MiPymes_V2.es.Reportes.FacturasPorCobrar" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.Bootstrap" Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Reportes
                <span>>
                  Facturas por Cobrar
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
                        <h2>Información de Facturas por Cobrar</h2>
                    </header>
                    <dx:BootstrapFormLayout runat="server">
                        <Items>
                            <dx:BootstrapLayoutItem Caption="Fecha Inicial" ColSpanSm="4">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:ASPxDateEdit ID="dateFechaInicial" runat="server" Theme="MaterialCompact" Width="100%">
                                            <ValidationSettings ValidationGroup="Validation">
                                                <RequiredField IsRequired="true" ErrorText="Ingrese la Fecha Inicial" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>
                            <dx:BootstrapLayoutItem Caption="Fecha Final" ColSpanSm="4" >
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:ASPxDateEdit ID="dateFechaFinal" runat="server" Theme="MaterialCompact" Width="100%">
                                            <ValidationSettings ValidationGroup="Validation">
                                                <RequiredField IsRequired="true" ErrorText="Ingrese la Fecha Final" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:BootstrapLayoutItem>

                            <dx:BootstrapLayoutItem ColSpanSm="4" ShowCaption="False" HorizontalAlign="Left">
                                <ContentCollection>
                                    <dx:ContentControl>
                                        <dx:BootstrapButton runat="server" Text="Generar" AutoPostBack="true" ID="btnguardar" OnClick="btnguardar_Click" >
                                            <ClientSideEvents Click="function(s, e) { e.processOnServer = ASPxClientEdit.ValidateGroup('Validation'); }" />
                                            <CssClasses Icon="fa fa-check" />
                                            <SettingsBootstrap RenderOption="Primary" />
                                        </dx:BootstrapButton>
                                        
                                    </dx:ContentControl>
                                </ContentCollection>

                            </dx:BootstrapLayoutItem>
                        </Items>
                    </dx:BootstrapFormLayout>


                    <div>
                        <dx:ASPxGridView ID="gvFacturasPorCobrar" runat="server" Theme="MaterialCompact" Width="100%" EnableTheming="True" AutoGenerateColumns="False" KeyFieldName="FacturaId;EmpresaId">

                            <SettingsDetail ShowDetailRow="True" />
                            <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                            </SettingsAdaptivity>
                            <Settings ShowFooter="True" />
                            <SettingsBehavior AllowFocusedRow="true" />
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="50" PageSize="50">
                                <AllButton Visible="True">
                                </AllButton>
                            </SettingsPager>

                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" GroupPanel="Coloque sus columnas aquí" />

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="FacturaId" ReadOnly="True" VisibleIndex="0" >
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" VisibleIndex="1" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="SocioNegocioId" ReadOnly="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreSocioNegocio" ReadOnly="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FechaDocumento" ReadOnly="True" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="d">
                                        
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FechaVence" ReadOnly="True" VisibleIndex="5">
                                    <PropertiesTextEdit DisplayFormatString="d"></PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="TotalPagar" ReadOnly="True" VisibleIndex="6" >
                                    <PropertiesTextEdit DisplayFormatString="n2">
                                        
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>

                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="Total:{0:0.00}" FieldName="TotalPagar" ShowInColumn="TotalPagar" SummaryType="Sum" ValueDisplayFormat="n2" />
                            </TotalSummary>

                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsFacturasPorCobrar" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT 0 FacturaId,0 EmpresaId,'' SocioNegocioId,'' NombreSocioNegocio,'' FechaDocumento,'' FechaVence,0.00 TotalPagar"></asp:SqlDataSource>

                    </div>
                </div>
            </article>
        </div>
    </section>
</asp:Content>
