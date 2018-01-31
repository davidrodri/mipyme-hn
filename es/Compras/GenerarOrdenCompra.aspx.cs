using DevExpress.Web;
using DevExpress.XtraExport.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;
using MiPymes_V2.Funciones;

namespace MiPymes_V2.es.Compras
{
    public partial class GenerarOrdenCompra : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        DataSetMiPymeTableAdapters.OrdenCompraTableAdapter _ordenCompraTableAdapter =
              new DataSetMiPymeTableAdapters.OrdenCompraTableAdapter();
        DataSetMiPymeTableAdapters.OrdenCompra_DetalleTableAdapter _ordenCompraDetalleTableAdapter =
              new DataSetMiPymeTableAdapters.OrdenCompra_DetalleTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
            var ordenCompraId = _ordenCompraTableAdapter.OrdenCompraPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            txtNoDocumento.Value = ordenCompraId;
            mostrarAlerta = new Alertas(this);
            
            if (!IsPostBack)
            {
                dFechaInicio.Value = DateTime.Now;
                dFechaFin.Value = DateTime.Now;
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
            newRow["Producto"] = cboProductos.Text;
            newRow["Cantidad"] = 0;
            newRow["Precio"] = 0;
            newRow["Impuesto"] = 0;
            newRow["Descuento"] = 0;
            newRow["TotalLinea"] = 0;


            dt.Rows.Add(newRow);
            ActualizarNumeroLinea(dt);
            ViewState["vw"] = dt;
            gvGenerarOrdenCompra.DataSource = dt;
            gvGenerarOrdenCompra.DataBind();
        }
        private DataTable ActualizarNumeroLinea(DataTable datos)
        {

            for (int i = 0; i <= datos.Rows.Count - 1; i++)
            {
                datos.Rows[i]["ID"] = i + 1;
            }

            return datos;
        }
        protected void spinCantidad_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotalesGrid();
            CalcularTotal();
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
                    vTotalLinea.Value = Convert.ToDecimal(vCantidad.Value) * Convert.ToDecimal(vPrecio.Value)*(1-Convert.ToDecimal(vDescuento.Value));
                }
                //vTotalLinea.Value = Convert.ToDecimal(vCantidad.Value) * Convert.ToDecimal(vPrecio.Value);
                //vTotalLinea.Value = Convert.ToDecimal(vTotalLinea.Value) * Convert.ToDecimal(vDescuento.Value);
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
            totalDescuento= Convert.ToDecimal(spinSubTotal.Value) * (Convert.ToDecimal(spinDescuentoDocumento.Value));
            spinTotalDescuento.Value = totalDescuento;
            
            totalImpuesto = totalAcumulado * (Convert.ToDecimal(spinImpuesto.Value));
            spinTotalImpuesto.Value =  totalImpuesto;
            
            spinTotal.Value = Convert.ToDecimal(spinSubTotal.Value)- totalDescuento + totalImpuesto;
        }

        protected void spinPrecio_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotalesGrid();
            CalcularTotal();
        }

        protected void spinDescuento_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotalesGrid();
            CalcularTotal();
        }

        protected void btnProcesar_Click(object sender, EventArgs e)
        {
            if (gvGenerarOrdenCompra.VisibleRowCount==0)
            {
                mostrarAlerta.Advertencia("No existen productos a guardar");
                return;
            }
            var noOrdenCompra = _ordenCompraTableAdapter.OrdenCompraPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            
            int resultado = 0;
            try
            {
                resultado = _ordenCompraTableAdapter.Insert(Convert.ToInt32(noOrdenCompra),
                    int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()),Convert.ToInt32("301"),
                    cboProveedor.Value.ToString(), int.Parse(cboMoneda.Value.ToString()), Convert.ToDecimal(spinTasaCambio.Value),
                    int.Parse(cboEstado.Value.ToString()), DateTime.Now, DateTime.Now, memoComentarios.Text,
                    Convert.ToDecimal(spinSubTotal.Value), Convert.ToDouble(spinDescuentoDocumento.Value),
                    Convert.ToDecimal(spinTotalDescuento.Value), Convert.ToDouble(spinImpuesto.Value),
                    Convert.ToDecimal(spinTotalImpuesto.Value),
                    Convert.ToDecimal(spinTotal.Value), "", DateTime.Now, "");
               
                if (resultado !=0)
                {
                    _ordenCompraDetalleTableAdapter.EliminarOrdenCompraDetalle(Convert.ToInt32(noOrdenCompra),
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

                        _ordenCompraDetalleTableAdapter.Insert((Convert.ToInt32(noOrdenCompra)),
                            int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), lineaId, codigo, producto,
                            Convert.ToInt32(vCantidad.Value),Convert.ToDecimal(vPrecio.Value),Convert.ToDouble(vDescuento.Value),0,0,"",DateTime.Now, 
                            Convert.ToDecimal(vTotalLinea.Value));
                    }

                   
                }

            }
            catch (Exception ex)
            {

                throw;
            }

            if (resultado == 1)
            {
                DatosGlobales.MostrarMensaje("Orden de Compra, Realizada", this, GetType(), 2);
                
                Limpiar();
            }
        }

        public void Limpiar()
        {
            ViewState["vw"] = "";
            cboProveedor.Value = null;
            cboMoneda.Value = null;
            cboProductos.Value = null;
            spinSubTotal.Value = 0;
            spinImpuesto.Value = 0;
            spinTotalImpuesto.Value = 0;
            spinDescuentoDocumento.Value = 0;
            spinTotalDescuento.Value = 0;
            spinTotal.Value = 0;
            gvGenerarOrdenCompra.DataSource = ViewState["vw"];
            gvGenerarOrdenCompra.DataBind();
        }

        protected void spinDescuentoDocumento_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void spinImpuesto_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void txtNoDocumento_ButtonClick(object source, ButtonEditClickEventArgs e)
        {
            mostrarAlerta.Exito("asdsdsfds");
        }

      
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

     

        protected void btnBuscarOC_Click(object sender, EventArgs e)
        {
            dsOrdenComBusqueda.DataBind();
            gvOrdenCompraBusqueda.DataBind();
        }

        protected void lbVer_Click(object sender, EventArgs e)
        {
            ViewState["vw"] = "";
            gvGenerarOrdenCompra.DataSource = ViewState["vw"];
            gvGenerarOrdenCompra.DataBind();

          int ordenID = (int)gvOrdenCompraBusqueda.GetRowValues(gvOrdenCompraBusqueda.FocusedRowIndex, "OrdenCompraId");
            DataTable tblObtener = new DataTable();
            string sqlQuery = null;

            sqlQuery = @"SELECT LineaId ID,p.ProductoId Codigo,NombreProducto Producto,
                        Cantidad,Precio,1 Impuesto,ocd.Descuento,TotalLinea FROM	OrdenCompra  oc
                        INNER JOIN OrdenCompra_Detalle  ocd ON oc.OrdenCompraId = ocd.OrdenCompraId
                        INNER JOIN Productos p ON p.ProductoId = ocd.ProductoId
                        WHERE oc.OrdenCompraId = " + ordenID + "";

            tblObtener = new FuncionesGlobales().getDataTable(sqlQuery);

            ViewState["vw"] = tblObtener;
            gvGenerarOrdenCompra.DataSource = ViewState["vw"];
            gvGenerarOrdenCompra.DataBind();
            ObtenerEncabezadoDeOrden(ordenID);
        }



       private void ObtenerEncabezadoDeOrden(int ordenID)
        {

            DataTable tblObtener = new DataTable();
            string sqlQuery = null;

            sqlQuery = @"SELECT SocioNegocioId,MonedaId,TasaCambio,EstadoDocumentoId,
                         SubTotal,TotalImpuesto,TotalPagar,Descuento,Impuesto ,TotalDescuento
                         FROM OrdenCompra oc WHERE oc.OrdenCompraId = " + ordenID + "";


            tblObtener = new FuncionesGlobales().getDataTable(sqlQuery);

            if (tblObtener.Rows.Count > 0)
            {
                cboProveedor.Value = (string)tblObtener.Rows[0]["SocioNegocioId"];
                cboMoneda.Value = tblObtener.Rows[0]["MonedaId"].ToString();
                spinTasaCambio.Value = (decimal)tblObtener.Rows[0]["TasaCambio"];
                cboEstado.Value = tblObtener.Rows[0]["EstadoDocumentoId"].ToString();
                spinDescuentoDocumento.Value = Convert.ToDouble(tblObtener.Rows[0]["Descuento"]);
                spinImpuesto.Value = Convert.ToDouble(tblObtener.Rows[0]["Impuesto"]);
                spinTotalDescuento.Value = (decimal)tblObtener.Rows[0]["TotalDescuento"];
                spinTotalImpuesto.Value = (decimal)tblObtener.Rows[0]["TotalImpuesto"];
                spinTotal.Value = (decimal)tblObtener.Rows[0]["TotalPagar"];
                spinSubTotal.Value = (decimal)tblObtener.Rows[0]["SubTotal"];
            }

          
        }

        protected void btnBuscarOrdenCompra_Click(object sender, EventArgs e)
        {

        }
    }
}