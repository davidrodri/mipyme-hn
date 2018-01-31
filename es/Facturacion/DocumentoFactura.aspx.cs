using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Facturacion
{
    public partial class DocumentoFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int documento = 0, com = 0;

            com = Convert.ToInt32(Request.QueryString["com"]);
            documento = Convert.ToInt32(Request.QueryString["doc"]);
            xtraRptFactura rpt = new xtraRptFactura(com, documento);
            this.ASPxDocumentViewer1.Report = rpt;
        }
    }
}