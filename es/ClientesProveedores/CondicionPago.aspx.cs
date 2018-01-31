using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.ClientesProveedores
{
    public partial class CondicionPago : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.CondicionesPagoTableAdapter _condicionesPagoTableAdapter =
              new DataSetMiPymeTableAdapters.CondicionesPagoTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"]; 
        }

        protected void gvCondicionesPago_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            var contador = _condicionesPagoTableAdapter.CondicionesPagoPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            e.NewValues["CondicionPagoId"] = contador;
            e.NewValues["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
        }
    }
}