using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Facturacion
{
    public partial class VerFacturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void btnVerFactura_Click(object sender, EventArgs e)
        {

        }

        protected void btnVerFactura_Command(object sender, CommandEventArgs e)
        {
            ObtenerProductosRetirar(gvVerDocumentos.FocusedRowIndex);
        }

        public bool ObtenerProductosRetirar(int index)
        {
            string factura = "";
            factura= gvVerDocumentos.GetRowValues(index, "FacturaId").ToString();
           

            string url = "../Facturacion/DocumentoFactura.aspx?doc=" + factura + "&com=" + Request.Cookies["UserInfo"]["empresaId"].ToString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('" + url + "','_newtab');", true);
            return true;
        }

    }
}