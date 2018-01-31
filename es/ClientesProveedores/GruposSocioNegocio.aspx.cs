using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Configuraciones
{
    public partial class GruposSocioNegocio : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.GrupoSociosNegocioTableAdapter _grupoSociosNegocioTableAdapterTableAdapter =
              new DataSetMiPymeTableAdapters.GrupoSociosNegocioTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void gvSocioNegocio_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            var contador = _grupoSociosNegocioTableAdapterTableAdapter.GrupoSocioNegocioPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            e.NewValues["GrupoSocioNegocioId"] = contador;
            e.NewValues["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
        }
    }
}