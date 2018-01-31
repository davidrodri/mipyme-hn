﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.Compras
{
    public partial class RealizarCompras : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        DataSetMiPymeTableAdapters.ComprasTableAdapter _comprasTableAdapter =
              new DataSetMiPymeTableAdapters.ComprasTableAdapter();
        DataSetMiPymeTableAdapters.Compras_DetalleTableAdapter _comprasDetalleTableAdapter =
              new DataSetMiPymeTableAdapters.Compras_DetalleTableAdapter();

        DataSetMiPymeProcedimientosTableAdapters.spRealizarCompraTableAdapter _spRealizarCompraTableAdapter =
             new DataSetMiPymeProcedimientosTableAdapters.spRealizarCompraTableAdapter();

        DataSetMiPymeTableAdapters.CaiAutorizacionesTableAdapter _caiAutorizacionesTableAdapter = 
            new DataSetMiPymeTableAdapters.CaiAutorizacionesTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {

            mostrarAlerta = new Alertas(this);
            this.Session["EmpresaId"] = Session["empresaId"];
            var ordenCompraId = _comprasTableAdapter.CompraPorEmpresa(int.Parse(Session["empresaId"].ToString()));
            var caiHabilitado =
                _caiAutorizacionesTableAdapter.EsCaiValidoPorEmpresa(int.Parse(Session["empresaId"].ToString()));
            txtNoDocumento.Value = ordenCompraId;

            if (caiHabilitado == null)
            {
                mostrarAlerta.Advertencia("No existen númeracíon CAI valido.");
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

            if (cboProductos.Text =="")
            {
                return;
            }
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
            newRow["Cantidad"] = 1;
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
            
            mostrarAlerta = new Alertas(this);
           
            if (gvGenerarOrdenCompra.VisibleRowCount == 0)
            {
                DatosGlobales.MostrarMensaje("No existen productos a guardar", this, GetType(), 1);
                return;
            }
            var noOrdenCompra = _comprasTableAdapter.CompraPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));

            int resultado = 0;
            try
            {
                resultado = _comprasTableAdapter.Insert(Convert.ToInt32(noOrdenCompra),
                    int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), Convert.ToInt32("302"),
                    cboProveedor.Value.ToString(), int.Parse(cboMoneda.Value.ToString()), Convert.ToDecimal(spinTasaCambio.Value),
                    int.Parse(cboEstado.Value.ToString()), DateTime.Now, DateTime.Now, memoComentarios.Text,
                    Convert.ToDecimal(spinSubTotal.Value), Convert.ToDouble(spinDescuentoDocumento.Value),
                    Convert.ToDecimal(spinTotalDescuento.Value), Convert.ToDouble(spinImpuesto.Value),
                    Convert.ToDecimal(spinTotalImpuesto.Value),
                    Convert.ToDecimal(spinTotal.Value), "", DateTime.Now, "");

                if (resultado != 0)
                {
                    _comprasDetalleTableAdapter.EliminarDetalleCompras(Convert.ToInt32(noOrdenCompra),
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

                        _comprasDetalleTableAdapter.Insert((Convert.ToInt32(noOrdenCompra)),
                            int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), lineaId, codigo, producto,
                            Convert.ToInt32(vCantidad.Value), Convert.ToDecimal(vPrecio.Value), Convert.ToDouble(vDescuento.Value), 0, 0, "", DateTime.Now,
                            Convert.ToDecimal(vTotalLinea.Value));
                    }
                    DatosGlobales.MostrarMensaje("Compra, Realizada", this, GetType(), 2);
                }
            }
            catch (Exception ex)
            {
                throw;
            }

            if (resultado == 1)
            {
                _spRealizarCompraTableAdapter.GetData(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), noOrdenCompra);
                Limpiar();
                
            }
        }

        public void Limpiar()
        {

            ViewState["vw"] = null;
            cboProveedor.Value = null;
            cboMoneda.Value = null;
            cboProductos.Value = null;
            spinSubTotal.Value = 0;
            memoComentarios.Text = "";
            spinImpuesto.Value = 0;
            spinTotalImpuesto.Value = 0;
            spinDescuentoDocumento.Value = 0;
            spinTotalDescuento.Value = 0;
            spinTotal.Value = 0;
            gvGenerarOrdenCompra.DataSource = null;
            gvGenerarOrdenCompra.DataBind();
            txtNoDocumento.Text = Convert.ToString( _comprasTableAdapter.CompraPorEmpresa(int.Parse(Session["empresaId"].ToString())));
        }

        protected void spinDescuentoDocumento_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void spinImpuesto_ValueChanged(object sender, EventArgs e)
        {
            CalcularTotal();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

    }
}