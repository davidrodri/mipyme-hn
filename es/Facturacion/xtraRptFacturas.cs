using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace MiPymes_V2.es.Facturacion
{
    public partial class xtraRptFacturas : DevExpress.XtraReports.UI.XtraReport
    {
        public xtraRptFacturas(int empresa, int documento)
        {
            InitializeComponent();
            this.spXtraReportsDocumentosTableAdapter1.Fill(this.dataSetMiPymeProcedimientos1.spXtraReportsDocumentos, empresa,
                documento);
        }

    }
}
