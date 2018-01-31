using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.Colaboradores
{
    public partial class ListadoUsuarios : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        DataSetMiPymeProcedimientosTableAdapters.spActualizarContraUsuarioTableAdapter _actualizarContraUsuarioTableAdapter =
              new DataSetMiPymeProcedimientosTableAdapters.spActualizarContraUsuarioTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarAlerta = new Alertas(this);
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void btnRestablecerContra_Click(object sender, EventArgs e)
        {
            if (gvListadoUsuarios.VisibleRowCount==0)
            {
                return;
            }

            int usuarioSeleccionado =0;
            usuarioSeleccionado =int.Parse( gvListadoUsuarios.GetRowValues(gvListadoUsuarios.FocusedRowIndex, "UsuarioId").ToString());

            if (usuarioSeleccionado==0)
            {
                return;
            }

            try
            {
                var re = _actualizarContraUsuarioTableAdapter.GetData(
               usuarioSeleccionado, int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), "1234");
                mostrarAlerta.Exito("Contraseña Actualizada");
            }
            catch (Exception)
            {
                mostrarAlerta.Advertencia("Error al actualizar contraseña");
                throw;
            }

        }
    }
}