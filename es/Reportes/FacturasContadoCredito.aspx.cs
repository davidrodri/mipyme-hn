using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Reportes
{
    public partial class FacturasContadoCredito : System.Web.UI.Page
    {
        DataSetMiPymeProcedimientosTableAdapters.spFacturasContadoCreditoTableAdapter _facturasContadoCredito =
             new DataSetMiPymeProcedimientosTableAdapters.spFacturasContadoCreditoTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
            if (IsPostBack == false)
            {
                dateFechaInicial.Date = DateTime.Now;
                dateFechaFinal.Date = DateTime.Now;
            }
            else
            {
                BootstrapPieChart1.DataSource = ViewState["vwFacturasPorCobrar"];
            }

        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            Limpiar();

            ViewState["vwFacturasPorCobrar"] =
                _facturasContadoCredito.GetData(Convert.ToInt32(Request.Cookies["UserInfo"]["empresaId"].ToString()),
                    dateFechaInicial.Date, dateFechaFinal.Date);

            BootstrapPieChart1.DataSource = ViewState["vwFacturasPorCobrar"];
            BootstrapPieChart1.DataBind();
        }

        public void Limpiar()
        {
            ViewState["vwFacturasPorCobrar"] = "";
            BootstrapPieChart1.DataSource = ViewState["vwFacturasPorCobrar"];
            BootstrapPieChart1.DataBind();
        }
    }
}