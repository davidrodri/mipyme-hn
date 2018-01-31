namespace MiPymes_V2.es.Reportes
{
    partial class XtraReportDocumento
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
            this.dataSetMiPymeProcedimientos1 = new MiPymes_V2.DataSetMiPymeProcedimientos();
            this.spLoginUsuarioTableAdapter = new MiPymes_V2.DataSetMiPymeProcedimientosTableAdapters.spLoginUsuarioTableAdapter();
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
            this.TopMargin.HeightF = 100F;
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
            // dataSetMiPymeProcedimientos1
            // 
            this.dataSetMiPymeProcedimientos1.DataSetName = "DataSetMiPymeProcedimientos";
            this.dataSetMiPymeProcedimientos1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // spLoginUsuarioTableAdapter
            // 
            this.spLoginUsuarioTableAdapter.ClearBeforeFill = true;
            // 
            // XtraReportDocumento
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
            this.DataMember = "spXtraReportsDocumentos";
            this.DataSource = this.dataSetMiPymeProcedimientos1;
            this.Version = "17.1";
            ((System.ComponentModel.ISupportInitialize)(this.dataSetMiPymeProcedimientos1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }

        #endregion

        private DevExpress.XtraReports.UI.DetailBand Detail;
        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
        private DataSetMiPymeProcedimientos dataSetMiPymeProcedimientos1;
        private DataSetMiPymeProcedimientosTableAdapters.spLoginUsuarioTableAdapter spLoginUsuarioTableAdapter;
    }
}
