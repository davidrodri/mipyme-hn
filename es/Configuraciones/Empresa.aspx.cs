using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.Configuraciones
{
    public partial class Empresa : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        DataSetMiPymeTableAdapters.EmpresasTableAdapter _empresaTableAdapter =
               new DataSetMiPymeTableAdapters.EmpresasTableAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarAlerta = new Alertas(this);
            if (!IsPostBack)
            {
                this.Session["EmpresaId"] = Session["empresaId"];

                DataSetMiPyme.EmpresasDataTable empresasDataTable;
                empresasDataTable = _empresaTableAdapter.GetDataByEmpresaId(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));

                var empresa = empresasDataTable.FirstOrDefault();
                if (empresa == null)
                {
                    mostrarAlerta.Error("No se realizo la carga de la información");
                    return;
                }
                txtEmpresa.Text = empresa.Nombre;
                txtRTN.Text = empresa.Rtn;
                cboMoneda.SelectedIndex = 0;
                cboPaises.SelectedIndex = 0;
                cboDepartamento.SelectedIndex = 0;
                txtTelefono.Text = empresa.Telefono;
                txtCorreo.Text = empresa.CorreoElectronico;
                memoDireccion.Text = empresa.Direccion;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            
        }

        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            int vAccion = 0;
            vAccion = int.Parse(e.Parameter);
            if (vAccion == 1)
            {
                dsDepartamentos.SelectParameters[0].DefaultValue = (cboPaises.Value.ToString());
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            var resultado = _empresaTableAdapter.ActualizarEmpresa(txtEmpresa.Text, int.Parse(cboDepartamento.Value.ToString()), memoDireccion.Text, txtTelefono.Text,
            txtCorreo.Text, int.Parse(cboMoneda.Value.ToString()), txtRTN.Text, 1, true, int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()),
            int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));

            if (resultado == 1)
            {
                mostrarAlerta.Exito("Empresa Actualizada");
            }
            else
            {
                mostrarAlerta.Error("Problemas al actualizar empresa.");
            }
        }
    }
}