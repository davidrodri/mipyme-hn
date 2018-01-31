using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.Xpo;
using DevExpress.XtraReports.UI;

namespace MiPymes_V2.es.Facturacion
{
    public partial class xtraRptFactura : DevExpress.XtraReports.UI.XtraReport
    {
        
        public xtraRptFactura(int empresa,int documento)
        {
            InitializeComponent();
            this.spXtraReportsDocumentosTableAdapter1.Fill(this.dataSetMiPymeProcedimientos1.spXtraReportsDocumentos, empresa,
                 documento);
        }

    }
}
