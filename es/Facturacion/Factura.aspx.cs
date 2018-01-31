using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.Facturacion
{
    public partial class Factura : System.Web.UI.Page
    {
        DataSetMiPymeTableAdapters.FacturasTableAdapter _facturasTableAdapter =
             new DataSetMiPymeTableAdapters.FacturasTableAdapter();
        DataSetMiPymeTableAdapters.Facturas_DetalleTableAdapter _facturasDetalleTableAdapter =
              new DataSetMiPymeTableAdapters.Facturas_DetalleTableAdapter();

        DataSetMiPymeTableAdapters.CaiAutorizacionesTableAdapter _caiAutorizacionesTableAdapter =
            new DataSetMiPymeTableAdapters.CaiAutorizacionesTableAdapter();

        private DataSetMiPymeProcedimientosTableAdapters.spRealizarFacturaTableAdapter _realizarFactura =
            new DataSetMiPymeProcedimientosTableAdapters.spRealizarFacturaTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
            var ordenCompraId = _facturasTableAdapter.FacturaPorEmpresa(int.Parse(Session["empresaId"].ToString()));
            var caiHabilitado =
                _caiAutorizacionesTableAdapter.EsCaiValidoPorEmpresa(int.Parse(Session["empresaId"].ToString()));
            txtNoDocumento.Value = ordenCompraId;

            if (caiHabilitado == null)
            {
                DatosGlobales.MostrarMensaje("No existen númeracíon CAI valido", this, GetType(), 1);
                btnProcesar.Enabled = false;
            }

            if (ViewState["vw"] != null)
            {
                gvGenerarOrdenCompra.DataSource = ViewState["vw"];
            }
            cboEstado.Value = "1";
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            //Crear el DataTable
            //DataTable dt;

            if (cboProductos.Text == "")
            {
                return;
            }

            DataSetMiPymeTableAdapters.InventarioLotesTableAdapter _inventarioLotes=
                new DataSetMiPymeTableAdapters.InventarioLotesTableAdapter();
            DataTable dt = new DataTable();

            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("Codigo", typeof(string));
            dt.Columns.Add("Producto", typeof(string));
            dt.Columns.Add("Cantidad", typeof(int));
            dt.Columns.Add("Precio", typeof(double));
            dt.Columns.Add("Impuesto", typeof(double));
            dt.Columns.Add("Descuento", typeof(double));
            dt.Columns.Add("TotalLinea", typeof(double));
            if (ViewState["vw"] != null)
            {
                dt = (DataTable)ViewState["vw"];
            }
            //Conectarlo con el Grid
            DataRow newRow = dt.NewRow();
            newRow["Codigo"] = cboProductos.Value;
            newRow["Producto"] = cboProductos.SelectedItem.GetFieldValue("Nombre").ToString();
            newRow["Cantidad"] = 1;
            newRow["Precio"] = _inventarioLotes.PrecioVentaProducto(int.Parse(Session["empresaId"].ToString()),cboProductos.Value.ToString());
            newRow["Impuesto"] = 0;
            newRow["Descuento"] = 0;
            newRow["TotalLinea"] = 0;


            dt.Rows.Add(newRow);
            ActualizarNumeroLinea(dt);
            ViewState["vw"] = dt;
            gvGenerarOrdenCompra.DataSource = dt;
            gvGenerarOrdenCompra.DataBind();
            CalcularTotalesGrid();
            CalcularTotal();
        }

        private DataTable ActualizarNumeroLinea(DataTable datos)
        {

            for (int i = 0; i <= datos.Rows.Count - 1; i++)
            {
                datos.Rows[i]["ID"] = i + 1;
            }

            return datos;
        }



        private void CalcularTotalesGrid()
        {
            for (int i = 0; i < gvGenerarOrdenCompra.VisibleRowCount; i++)
            {

                ASPxSpinEdit vCantidad = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Cantidad"], "spinCantidad");
                ASPxSpinEdit vPrecio = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Precio"], "spinPrecio");
                ASPxSpinEdit vTotalLinea = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["TotalLinea"], "spinTotalLinea");
                ASPxSpinEdit vDescuento = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Descuento"], "spinDescuento");

                vTotalLinea.Value = 0;
                if (Convert.ToDecimal(vDescuento.Text) == 0)
                {
                    vTotalLinea.Value = Convert.ToDecimal(vCantidad.Value) * Convert.ToDecimal(vPrecio.Value);
                }
                else
                {
                    vTotalLinea.Value = Convert.ToDecimal(vCantidad.Value) * Convert.ToDecimal(vPrecio.Value) * (1 - Convert.ToDecimal(vDescuento.Value));
                }

            }
            ObtenerEstructuraAcutalGrid();
        }


        private void ObtenerEstructuraAcutalGrid()
        {

            DataTable dt = new DataTable();

            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("Codigo", typeof(string));
            dt.Columns.Add("Producto", typeof(string));
            dt.Columns.Add("Cantidad", typeof(int));
            dt.Columns.Add("Precio", typeof(double));
            dt.Columns.Add("Impuesto", typeof(double));
            dt.Columns.Add("Descuento", typeof(double));
            dt.Columns.Add("TotalLinea", typeof(double));

            for (int i = 0; i < gvGenerarOrdenCompra.VisibleRowCount; i++)
            {

                ASPxSpinEdit vCantidad = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Cantidad"], "spinCantidad");
                ASPxSpinEdit vPrecio = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Precio"], "spinPrecio");
                ASPxSpinEdit vTotalLinea = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["TotalLinea"], "spinTotalLinea");
                ASPxSpinEdit vDescuento = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Descuento"], "spinDescuento");

                DataRow row = dt.NewRow();

                row["Codigo"] = gvGenerarOrdenCompra.GetRowValues(i, "Codigo");
                row["Producto"] = gvGenerarOrdenCompra.GetRowValues(i, "Producto");
                row["Cantidad"] = Convert.ToInt32(vCantidad.Value);
                row["Precio"] = Convert.ToDouble(vPrecio.Value);
                row["Impuesto"] = gvGenerarOrdenCompra.GetRowValues(i, "Impuesto");
                row["Descuento"] = Convert.ToDouble(vDescuento.Value);
                row["TotalLinea"] = Convert.ToDouble(vTotalLinea.Value);

                dt.Rows.Add(row);
                ActualizarNumeroLinea(dt);
            }
            ViewState["vw"] = dt;
            gvGenerarOrdenCompra.DataSource = dt;

        }

        protected void spinCantidad_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotalesGrid();
            CalcularTotal();
        }

        protected void LbElimimar_Command(object sender, CommandEventArgs e)
        {
            int filaActual = (int)gvGenerarOrdenCompra.GetRowValues(gvGenerarOrdenCompra.FocusedRowIndex, "ID");
            DataTable dt = new DataTable();
            dt = (DataTable)ViewState["vw"];
            //DataRow row = default(DataRow);
            DataRow[] row = dt.Select("ID=' " + e.CommandArgument + " ' ");

            for (int i = 0; i < row.Length; i++)
                dt.Rows.Remove(row[i]);
            dt.AcceptChanges();

            dt = ActualizarNumeroLinea(dt);
            ViewState["vw"] = dt;
            gvGenerarOrdenCompra.DataSource = dt;
            gvGenerarOrdenCompra.DataBind();
        }

        private void CalcularTotal()
        {
            decimal totalAcumulado = 0;
            decimal totalDescuento = 0;
            decimal totalImpuesto = 0;
            //decimal totalDespuesDescuento = 0;
            for (int i = 0; i < gvGenerarOrdenCompra.VisibleRowCount; i++)
            {
                ASPxSpinEdit vTotalLinea = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["TotalLinea"], "spinTotalLinea");

                totalAcumulado += Convert.ToDecimal(vTotalLinea.Value);
            }
            spinSubTotal.Value = totalAcumulado;
            totalDescuento = Convert.ToDecimal(spinSubTotal.Value) * (Convert.ToDecimal(spinDescuentoDocumento.Value));
            spinTotalDescuento.Value = totalDescuento;

            totalImpuesto = totalAcumulado * (Convert.ToDecimal(spinImpuesto.Value));
            spinTotalImpuesto.Value = totalImpuesto;

            spinTotal.Value = Convert.ToDecimal(spinSubTotal.Value) - totalDescuento + totalImpuesto;
        }


        protected void spinDescuento_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotalesGrid();
            CalcularTotal();
        }

        protected void spinPrecio_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotalesGrid();
            CalcularTotal();
        }

        public void Limpiar()
        {

            ViewState["vw"] = null;
            cboProveedor.Value = null;
            cboMoneda.Value = null;
            cboProductos.Value = null;
            cboProductos.DataBind();
            spinSubTotal.Value = 0;
            memoComentarios.Text = "";
            spinImpuesto.Value = 0;
            spinTotalImpuesto.Value = 0;
            spinDescuentoDocumento.Value = 0;
            spinTotalDescuento.Value = 0;
            spinTotal.Value = 0;
            gvGenerarOrdenCompra.DataSource = null;
            gvGenerarOrdenCompra.DataBind();
            txtNoDocumento.Text = Convert.ToString(_facturasTableAdapter.FacturaPorEmpresa(int.Parse(Session["empresaId"].ToString())));
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (gvGenerarOrdenCompra.VisibleRowCount == 0)
            {
                DatosGlobales.MostrarMensaje("No existen productos a guardar", this, GetType(), 1);
                return;
            }
            var noOrdenCompra = _facturasTableAdapter.FacturaPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));

            int resultado = 0;

            try
            {
                resultado = _facturasTableAdapter.Insert(Convert.ToInt32(noOrdenCompra),
                    int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), Convert.ToInt32("402"),
                    cboProveedor.Value.ToString(), int.Parse(cboMoneda.Value.ToString()), Convert.ToDecimal(spinTasaCambio.Value),
                    int.Parse(cboEstado.Value.ToString()), int.Parse(cboCondicionPago.Value.ToString()), DateTime.Now, DateTime.Now, memoComentarios.Text,
                    Convert.ToDecimal(spinSubTotal.Value), Convert.ToDouble(spinDescuentoDocumento.Value),
                    Convert.ToDecimal(spinTotalDescuento.Value), Convert.ToDouble(spinImpuesto.Value),
                    Convert.ToDecimal(spinTotalImpuesto.Value),
                    Convert.ToDecimal(spinTotal.Value), "", DateTime.Now, "");

                if (resultado != 0)
                {
                    _facturasDetalleTableAdapter.EliminarDetalleCompras(Convert.ToInt32(noOrdenCompra),
                        int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));

                    for (int i = 0; i < gvGenerarOrdenCompra.VisibleRowCount; i++)
                    {
                        int lineaId = Convert.ToInt32(gvGenerarOrdenCompra.GetRowValues(i, "ID"));
                        string codigo = gvGenerarOrdenCompra.GetRowValues(i, "Codigo").ToString();
                        string producto = gvGenerarOrdenCompra.GetRowValues(i, "Producto").ToString();
                        ASPxSpinEdit vCantidad = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Cantidad"], "spinCantidad");
                        ASPxSpinEdit vPrecio = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Precio"], "spinPrecio");
                        ASPxSpinEdit vTotalLinea = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["TotalLinea"], "spinTotalLinea");
                        ASPxSpinEdit vDescuento = (ASPxSpinEdit)gvGenerarOrdenCompra.FindRowCellTemplateControl(i, (GridViewDataColumn)gvGenerarOrdenCompra.Columns["Descuento"], "spinDescuento");

                        _facturasDetalleTableAdapter.Insert((Convert.ToInt32(noOrdenCompra)),
                            int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), lineaId, codigo, producto,
                            Convert.ToInt32(vCantidad.Value), Convert.ToDecimal(vPrecio.Value), Convert.ToDouble(vDescuento.Value), 0, 0, "", DateTime.Now,
                            Convert.ToDecimal(vTotalLinea.Value));
                    }
                    ViewState["vwFacturaVenta"] = _realizarFactura.GetData(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), Convert.ToInt32(noOrdenCompra));

                }
                DataTable dtFac = (DataTable)ViewState["vwFacturaVenta"];
                DataRow[] busquedaRegistros;
                busquedaRegistros = dtFac.Select();
                string valor = "";

                for (int i = 0; i < busquedaRegistros.Length; i++)
                {
                    valor = busquedaRegistros[i]["Respuesta"].ToString();
                }

                string url = "../Facturacion/DocumentoFactura.aspx?doc=" + noOrdenCompra.ToString() + "&com=" + Request.Cookies["UserInfo"]["empresaId"].ToString();

               

                if (valor == "1")
                {
                    DatosGlobales.MostrarMensaje("Venta, Realizada", this, GetType(), 2);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('" + url + "','_newtab');", true);
                    Limpiar();

                }
                else
                {
                    DatosGlobales.MostrarMensaje("No existe suficiente inventario para realizar la venta.", this, GetType(), 3);
                }
            }
            catch (Exception ex)
            {
                throw;
            }

           
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void spinDescuentoDocumento_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void spinImpuesto_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }
    }
}