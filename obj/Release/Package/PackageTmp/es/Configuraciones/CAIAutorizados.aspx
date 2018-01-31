<%@ Page Title="" Language="C#" MasterPageFile="~/es/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CAIAutorizados.aspx.cs" Inherits="MiPymes_V2.es.Configuraciones.CAIAutorizados" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
            <h1 class="page-title txt-color-blueDark">
                <i class="fa-fw fa fa-tags "></i>
                Configuraciones
                <span>>
                   CAI Autorizados
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
                        <h2>Información de CAI Autorizados</h2>
                    </header>
                    <div>


                        <dx:ASPxGridView ID="gvCaiAutorizaciones" runat="server" AutoGenerateColumns="False" Theme="MaterialCompact" Width="100%" EnableTheming="True" DataSourceID="dsCaiAutorizaciones" KeyFieldName="AutorizacionCAIId;EmpresaId" OnRowInserting="gvCaiAutorizaciones_RowInserting">
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

                            <Templates>
                                <DetailRow>
                                    <dx:ASPxGridView ID="gvCaiNumeracion" runat="server" AutoGenerateColumns="False" Theme="Material" Width="100%" EnableTheming="True" DataSourceID="dsCaiNumeraciones" KeyFieldName="CaiNumeracionId;AutorizacionCaiId;EmpresaId" OnBeforePerformDataSelect="gvCaiNumeracion_BeforePerformDataSelect" OnRowInserting="gvCaiNumeracion_RowInserting">
                                        <SettingsAdaptivity AdaptivityMode="HideDataCells" HideDataCellsAtWindowInnerWidth="3">
                                        </SettingsAdaptivity>

                                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="25" PageSize="25">
                                            <AllButton Visible="True">
                                            </AllButton>
                                        </SettingsPager>

                                        <SettingsSearchPanel Visible="True" />
                                        <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" />


                                        <Columns>
                                            <dx:GridViewCommandColumn ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="CaiNumeracionId" ReadOnly="True" VisibleIndex="1" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="AutorizacionCaiId" ReadOnly="True" VisibleIndex="2" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" VisibleIndex="3" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NumeroInicial" VisibleIndex="5" Caption="Número Inicial">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NumeroFinal" VisibleIndex="6" Caption="Número Final">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TipoDoctoDEI" VisibleIndex="7" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Establecimiento" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="PuntoEmision" VisibleIndex="9" Caption="Punto Emisión">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NumeroActual" VisibleIndex="10" Caption="Número Actual" ReadOnly="True">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="Documento" FieldName="TipoDoctoId" VisibleIndex="4">
                                                <PropertiesComboBox DataSourceID="dsTiposDocumentos" TextField="NombreTipoDocto" ValueField="TipoDoctoID">
                                                    <Columns>
                                                        <dx:ListBoxColumn Caption="Tipo" FieldName="TipoDoctoID">
                                                        </dx:ListBoxColumn>
                                                        <dx:ListBoxColumn Caption="Descripción" FieldName="NombreTipoDocto">
                                                        </dx:ListBoxColumn>
                                                        <dx:ListBoxColumn Caption="Abrev." FieldName="NombreCorto">
                                                        </dx:ListBoxColumn>
                                                    </Columns>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                        </Columns>
                                    </dx:ASPxGridView>

                                </DetailRow>
                            </Templates>

                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="25" PageSize="25">
                                <AllButton Visible="True">
                                </AllButton>
                            </SettingsPager>

                            <SettingsSearchPanel Visible="True" />
                            <SettingsText CommandApplySearchPanelFilter="Buscar registros" CommandCancel="Cancelar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Realizar" EmptyDataRow="No existen registros" />



                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" Visible="False">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="AutorizacionCAIId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EmpresaId" ReadOnly="True" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CAI" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="FechaCai" VisibleIndex="4" Caption="Fecha">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataCheckColumn FieldName="Activo" VisibleIndex="5">
                                </dx:GridViewDataCheckColumn>
                            </Columns>



                        </dx:ASPxGridView>



                        

                        <asp:SqlDataSource ID="dsCaiAutorizaciones" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [CaiAutorizaciones] WHERE [AutorizacionCAIId] = @original_AutorizacionCAIId AND [EmpresaId] = @original_EmpresaId AND [CAI] = @original_CAI AND [FechaCai] = @original_FechaCai AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))" InsertCommand="INSERT INTO [CaiAutorizaciones] ([AutorizacionCAIId], [EmpresaId], [CAI], [FechaCai], [Activo]) VALUES (@AutorizacionCAIId, @EmpresaId, @CAI, @FechaCai, @Activo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CaiAutorizaciones] WHERE ([EmpresaId] = @EmpresaId)" UpdateCommand="UPDATE [CaiAutorizaciones] SET [CAI] = @CAI, [FechaCai] = @FechaCai, [Activo] = @Activo WHERE [AutorizacionCAIId] = @original_AutorizacionCAIId AND [EmpresaId] = @original_EmpresaId AND [CAI] = @original_CAI AND [FechaCai] = @original_FechaCai AND (([Activo] = @original_Activo) OR ([Activo] IS NULL AND @original_Activo IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_AutorizacionCAIId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_CAI" Type="String" />
                                <asp:Parameter Name="original_FechaCai" Type="DateTime" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="AutorizacionCAIId" Type="Int32" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="CAI" Type="String" />
                                <asp:Parameter Name="FechaCai" Type="DateTime" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="EmpresaId" SessionField="EmpresaId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CAI" Type="String" />
                                <asp:Parameter Name="FechaCai" Type="DateTime" />
                                <asp:Parameter Name="Activo" Type="Boolean" />
                                <asp:Parameter Name="original_AutorizacionCAIId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_CAI" Type="String" />
                                <asp:Parameter Name="original_FechaCai" Type="DateTime" />
                                <asp:Parameter Name="original_Activo" Type="Boolean" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsTiposDocumentos" runat="server" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" SelectCommand="SELECT * FROM TipoDocumento WHERE Activo =1"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsCaiNumeraciones" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MiPymes_V2.Properties.Settings.MiPymeConnection %>" DeleteCommand="DELETE FROM [CaiNumeraciones] WHERE [CaiNumeracionId] = @original_CaiNumeracionId AND [AutorizacionCaiId] = @original_AutorizacionCaiId AND [EmpresaId] = @original_EmpresaId AND [TipoDoctoId] = @original_TipoDoctoId AND [NumeroInicial] = @original_NumeroInicial AND [NumeroFinal] = @original_NumeroFinal AND (([TipoDoctoDEI] = @original_TipoDoctoDEI) OR ([TipoDoctoDEI] IS NULL AND @original_TipoDoctoDEI IS NULL)) AND (([Establecimiento] = @original_Establecimiento) OR ([Establecimiento] IS NULL AND @original_Establecimiento IS NULL)) AND (([PuntoEmision] = @original_PuntoEmision) OR ([PuntoEmision] IS NULL AND @original_PuntoEmision IS NULL)) AND (([NumeroActual] = @original_NumeroActual) OR ([NumeroActual] IS NULL AND @original_NumeroActual IS NULL))" InsertCommand="INSERT INTO [CaiNumeraciones] ([CaiNumeracionId], [AutorizacionCaiId], [EmpresaId], [TipoDoctoId], [NumeroInicial], [NumeroFinal], [TipoDoctoDEI], [Establecimiento], [PuntoEmision], [NumeroActual]) VALUES (@CaiNumeracionId, @AutorizacionCaiId, @EmpresaId, @TipoDoctoId, @NumeroInicial, @NumeroFinal, @TipoDoctoDEI, @Establecimiento, @PuntoEmision, @NumeroActual)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CaiNumeraciones] WHERE (([EmpresaId] = @Emp) AND ([AutorizacionCaiId] = @Auto))" UpdateCommand="UPDATE [CaiNumeraciones] SET [TipoDoctoId] = @TipoDoctoId, [NumeroInicial] = @NumeroInicial, [NumeroFinal] = @NumeroFinal, [TipoDoctoDEI] = @TipoDoctoDEI, [Establecimiento] = @Establecimiento, [PuntoEmision] = @PuntoEmision, [NumeroActual] = @NumeroActual WHERE [CaiNumeracionId] = @original_CaiNumeracionId AND [AutorizacionCaiId] = @original_AutorizacionCaiId AND [EmpresaId] = @original_EmpresaId AND [TipoDoctoId] = @original_TipoDoctoId AND [NumeroInicial] = @original_NumeroInicial AND [NumeroFinal] = @original_NumeroFinal AND (([TipoDoctoDEI] = @original_TipoDoctoDEI) OR ([TipoDoctoDEI] IS NULL AND @original_TipoDoctoDEI IS NULL)) AND (([Establecimiento] = @original_Establecimiento) OR ([Establecimiento] IS NULL AND @original_Establecimiento IS NULL)) AND (([PuntoEmision] = @original_PuntoEmision) OR ([PuntoEmision] IS NULL AND @original_PuntoEmision IS NULL)) AND (([NumeroActual] = @original_NumeroActual) OR ([NumeroActual] IS NULL AND @original_NumeroActual IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_CaiNumeracionId" Type="Int32" />
                                <asp:Parameter Name="original_AutorizacionCaiId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_TipoDoctoId" Type="Int32" />
                                <asp:Parameter Name="original_NumeroInicial" Type="Int32" />
                                <asp:Parameter Name="original_NumeroFinal" Type="Int32" />
                                <asp:Parameter Name="original_TipoDoctoDEI" Type="String" />
                                <asp:Parameter Name="original_Establecimiento" Type="String" />
                                <asp:Parameter Name="original_PuntoEmision" Type="String" />
                                <asp:Parameter Name="original_NumeroActual" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CaiNumeracionId" Type="Int32" />
                                <asp:Parameter Name="AutorizacionCaiId" Type="Int32" />
                                <asp:Parameter Name="EmpresaId" Type="Int32" />
                                <asp:Parameter Name="TipoDoctoId" Type="Int32" />
                                <asp:Parameter Name="NumeroInicial" Type="Int32" />
                                <asp:Parameter Name="NumeroFinal" Type="Int32" />
                                <asp:Parameter Name="TipoDoctoDEI" Type="String" />
                                <asp:Parameter Name="Establecimiento" Type="String" />
                                <asp:Parameter Name="PuntoEmision" Type="String" />
                                <asp:Parameter Name="NumeroActual" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="Emp" SessionField="Emp" />
                                <asp:SessionParameter Name="Auto" SessionField="Auto" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="TipoDoctoId" Type="Int32" />
                                <asp:Parameter Name="NumeroInicial" Type="Int32" />
                                <asp:Parameter Name="NumeroFinal" Type="Int32" />
                                <asp:Parameter Name="TipoDoctoDEI" Type="String" />
                                <asp:Parameter Name="Establecimiento" Type="String" />
                                <asp:Parameter Name="PuntoEmision" Type="String" />
                                <asp:Parameter Name="NumeroActual" Type="Int32" />
                                <asp:Parameter Name="original_CaiNumeracionId" Type="Int32" />
                                <asp:Parameter Name="original_AutorizacionCaiId" Type="Int32" />
                                <asp:Parameter Name="original_EmpresaId" Type="Int32" />
                                <asp:Parameter Name="original_TipoDoctoId" Type="Int32" />
                                <asp:Parameter Name="original_NumeroInicial" Type="Int32" />
                                <asp:Parameter Name="original_NumeroFinal" Type="Int32" />
                                <asp:Parameter Name="original_TipoDoctoDEI" Type="String" />
                                <asp:Parameter Name="original_Establecimiento" Type="String" />
                                <asp:Parameter Name="original_PuntoEmision" Type="String" />
                                <asp:Parameter Name="original_NumeroActual" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>

                </div>
            </article>
        </div>
        <div></div>
    </section>
</asp:Content>
