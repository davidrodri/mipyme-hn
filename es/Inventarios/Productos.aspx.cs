using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.Inventarios
{
    public partial class Productos : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarAlerta = new Alertas(this);
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            DataSetMiPymeTableAdapters.ProductosTableAdapter _productosTableAdapter =
               new DataSetMiPymeTableAdapters.ProductosTableAdapter();

            var existeProducto = _productosTableAdapter.ExisteProductoPorEmpresa(
                int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), txtCodigo.Text);

            if (existeProducto != 0)
            {
                mostrarAlerta.Error("El codigo ingresado del producto ya existe");
                return;
            }
            int resultado = 0;
            try
            {
               resultado  = _productosTableAdapter.Insert(txtCodigo.Text, int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()),
               txtProducto.Text, int.Parse(cboCategoria.Value.ToString()), int.Parse(cboTipoProducto.Value.ToString()),
               memoDescripcion.Text, int.Parse(cboAlmacen.Value.ToString()),
               int.Parse(spinInvMinimo.Value.ToString()), int.Parse(spinInvMaximo.Value.ToString()),
               int.Parse(cboImpuestoCompra.Value.ToString()), int.Parse(cboImpuestoVenta.Value.ToString()),
               decimal.Parse(spinPrecioCosto.Value.ToString()), decimal.Parse(spinPrecioVenta.Value.ToString()), true);

                if (resultado == 1)
                {
                    mostrarAlerta.Exito("Producto Ingresado");
                    Limpiar();
                }
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        private void Limpiar()
        {
            txtCodigo.Text= null;
            txtProducto.Text = null;
            cboTipoProducto.Value = null;
            cboCategoria.Value = null;
            memoDescripcion.Text = null;
            cboAlmacen.Value = null;
            spinInvMinimo.Value = 0;
            spinInvMaximo.Value = 0;
            cboImpuestoCompra.Value = null;
            cboImpuestoVenta.Value = null;
            spinPrecioCosto.Value = 0;
            spinPrecioVenta.Value = 0;

        }
    }
}