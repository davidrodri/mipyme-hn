namespace MiPymes_V2.es.Facturacion
{
    partial class xtraRptFacturas
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.GroupHeader1 = new DevExpress.XtraReports.UI.GroupHeaderBand();
            this.PageHeader = new DevExpress.XtraReports.UI.PageHeaderBand();
            this.PageFooter = new DevExpress.XtraReports.UI.PageFooterBand();
            this.dataSetMiPymeProcedimientos1 = new MiPymes_V2.DataSetMiPymeProcedimientos();
            this.spLoginUsuarioTableAdapter = new MiPymes_V2.DataSetMiPymeProcedimientosTableAdapters.spLoginUsuarioTableAdapter();
            this.spXtraReportsDocumentosTableAdapter1 = new MiPymes_V2.DataSetMiPymeProcedimientosTableAdapters.spXtraReportsDocumentosTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.dataSetMiPymeProcedimientos1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.HeightF = 100F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // TopMargin
            // 
            this.TopMargin.HeightF = 46.875F;
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // BottomMargin
            // 
            this.BottomMargin.HeightF = 100F;
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // GroupHeader1
            // 
            this.GroupHeader1.HeightF = 28.125F;
            this.GroupHeader1.Name = "GroupHeader1";
            // 
            // PageHeader
            // 
            this.PageHeader.HeightF = 100F;
            this.PageHeader.Name = "PageHeader";
            // 
            // PageFooter
            // 
            this.PageFooter.HeightF = 100F;
            this.PageFooter.Name = "PageFooter";
            // 
            // dataSetMiPymeProcedimientos1
            // 
            this.dataSetMiPymeProcedimientos1.DataSetName = "DataSetMiPymeProcedimientos";
            this.dataSetMiPymeProcedimientos1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // spLoginUsuarioTableAdapter
            // 
            this.spLoginUsuarioTableAdapter.ClearBeforeFill = true;
            // 
            // spXtraReportsDocumentosTableAdapter1
            // 
            this.spXtraReportsDocumentosTableAdapter1.ClearBeforeFill = true;
            // 
            // xtraRptFacturas
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin,
            this.GroupHeader1,
            this.PageHeader,
            this.PageFooter});
            this.DataAdapter = this.spXtraReportsDocumentosTableAdapter1;
            this.DataMember = "spXtraReportsDocumentos";
            this.DataSource = this.dataSetMiPymeProcedimientos1;
            this.Margins = new System.Drawing.Printing.Margins(100, 100, 47, 100);
            this.Version = "17.1";
            ((System.ComponentModel.ISupportInitialize)(this.dataSetMiPymeProcedimientos1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }

        #endregion

        private DevExpress.XtraReports.UI.DetailBand Detail;
        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
        private DevExpress.XtraReports.UI.GroupHeaderBand GroupHeader1;
        private DevExpress.XtraReports.UI.PageHeaderBand PageHeader;
        private DevExpress.XtraReports.UI.PageFooterBand PageFooter;
        private DataSetMiPymeProcedimientos dataSetMiPymeProcedimientos1;
        private DataSetMiPymeProcedimientosTableAdapters.spLoginUsuarioTableAdapter spLoginUsuarioTableAdapter;
        private DataSetMiPymeProcedimientosTableAdapters.spXtraReportsDocumentosTableAdapter spXtraReportsDocumentosTableAdapter1;
    }
}
