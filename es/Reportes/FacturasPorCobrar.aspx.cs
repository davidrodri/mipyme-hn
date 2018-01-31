using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace MiPymes_V2.es.Reportes
{
    public partial class FacturasPorCobrar : System.Web.UI.Page
    {

        DataSetMiPymeProcedimientosTableAdapters.spFacturasPorCobrarTableAdapter _facturasPorCobrar =
              new DataSetMiPymeProcedimientosTableAdapters.spFacturasPorCobrarTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
            if (IsPostBack == false)
            {
                dateFechaInicial.Date=DateTime.Now;
                dateFechaFinal.Date=DateTime.Now;
            }
            else
            {
                gvFacturasPorCobrar.DataSource = ViewState["vwFacturasPorCobrar"];
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            Limpiar();

            ViewState["vwFacturasPorCobrar"] =
                _facturasPorCobrar.GetData(Convert.ToInt32(Request.Cookies["UserInfo"]["empresaId"].ToString()), 
                    dateFechaInicial.Date,dateFechaFinal.Date);

            gvFacturasPorCobrar.DataSource = ViewState["vwFacturasPorCobrar"];
            gvFacturasPorCobrar.DataBind();
        }

        public void Limpiar()
        {
            ViewState["vwFacturasPorCobrar"] = "";
            gvFacturasPorCobrar.DataSource = ViewState["vwFacturasPorCobrar"];
            gvFacturasPorCobrar.DataBind();
        }
    }
}