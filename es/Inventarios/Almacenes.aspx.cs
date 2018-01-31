using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Inventarios
{
    public partial class Almacenes : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.AlmacenesTableAdapter _almacenesTableAdapter =
             new DataSetMiPymeTableAdapters.AlmacenesTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void gvAlmacenes_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            var contador = _almacenesTableAdapter.AlmacenesPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            e.NewValues["AlmacenId"] = contador;
            e.NewValues["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
        }
    }
}