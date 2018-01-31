using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace MiPymes_V2.es.Configuraciones
{
    public partial class CAIAutorizados : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.CaiAutorizacionesTableAdapter _caiAutorizacionesTableAdapter =
              new DataSetMiPymeTableAdapters.CaiAutorizacionesTableAdapter();
        DataSetMiPymeTableAdapters.CaiNumeracionesTableAdapter _caiNumeracionesTableAdapter =
              new DataSetMiPymeTableAdapters.CaiNumeracionesTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void gvCaiAutorizaciones_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            var contador = _caiAutorizacionesTableAdapter.CaiAutorizacionesPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            e.NewValues["AutorizacionCAIId"] = contador;
            e.NewValues["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
            e.NewValues["Activo"] = true;
        }

        protected void gvCaiNumeracion_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            string[] s_keys = grid.GetMasterRowKeyValue().ToString().Split('|');

            var contador = _caiNumeracionesTableAdapter.CaiNumeracionesPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            e.NewValues["CaiNumeracionId"] = contador;
            e.NewValues["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
            string v = Session["Auto"].ToString();
            e.NewValues["AutorizacionCaiId"] = s_keys[0];
        }

        protected void gvCaiNumeracion_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            string[] s_keys = grid.GetMasterRowKeyValue().ToString().Split('|');
            Session["Auto"] = s_keys[0];
            Session["Emp"] = s_keys[1];
        }
    }
}