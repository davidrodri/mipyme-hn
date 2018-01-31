using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.ClientesProveedores
{
    public partial class CrearClienteProveedor : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.SociosNegocioTableAdapter _sociosNegocioTableAdapter =
             new DataSetMiPymeTableAdapters.SociosNegocioTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"]; 
        }

        protected void gvSocioNegocio_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
           
            e.NewValues["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
            //e.NewValues["Activo"] = true;
        }

      
    }
}