using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraReports;
using MiPymes_V2.es.Facturacion;

namespace MiPymes_V2.es.Principal
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
        }

     
    }
}