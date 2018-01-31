using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Configuraciones
{
    public partial class TipoImpuestos : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.TipoImpuestosTableAdapter _tipoImpuestosTableAdapter =
               new DataSetMiPymeTableAdapters.TipoImpuestosTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void gvTiposImpuestos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            var contador= _tipoImpuestosTableAdapter.TipoImpuestoPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            e.NewValues["TipoImpuestoId"]=contador;
            e.NewValues["EmpresaId"]= Request.Cookies["UserInfo"]["empresaId"].ToString();
        }

       
    }
}