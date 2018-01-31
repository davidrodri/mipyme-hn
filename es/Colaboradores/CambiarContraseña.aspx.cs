using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.Colaboradores
{
    public partial class CambiarContraseña : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        DataSetMiPymeProcedimientosTableAdapters.spActualizarContraUsuarioTableAdapter _actualizarContraUsuarioTableAdapter =
               new DataSetMiPymeProcedimientosTableAdapters.spActualizarContraUsuarioTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarAlerta = new Alertas(this);
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            if (txtContraseña.Text!=txtConfirmarContra.Text)
            {
                mostrarAlerta.Error("Las contraseñas no coinciden");
                return;
            }

            try
            {
                var re = _actualizarContraUsuarioTableAdapter.GetData(
               int.Parse(Request.Cookies["UserInfo"]["usuarioId"].ToString()), int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()), txtContraseña.Text);
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