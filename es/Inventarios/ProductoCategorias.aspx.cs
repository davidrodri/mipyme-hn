using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Inventarios
{
    public partial class ProductoCategorias : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.CategoriaProductosTableAdapter _categoriaProductosTableAdapter =
             new DataSetMiPymeTableAdapters.CategoriaProductosTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void gvCategoriasProductos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            var contador = _categoriaProductosTableAdapter.CategoriaProductosPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            e.NewValues["CategoriaProductoId"] = contador;
            e.NewValues["EmpresaId"] = Request.Cookies["UserInfo"]["empresaId"].ToString();
        }
    }
}