using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace MiPymes_V2.es.Compras
{
    public partial class OrdenesCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dateInicial.Date = DateTime.Now;
                    dateFinal.Date=DateTime.Now;
            }
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void gvOrdenCompraDetalle_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["OrdenCompraId"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
    }
}