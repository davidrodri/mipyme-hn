using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.Configuraciones
{
    public partial class CrearUsuarios : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        DataSetMiPymeTableAdapters.UsuariosTableAdapter _usuariosTableAdapter =
               new DataSetMiPymeTableAdapters.UsuariosTableAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarAlerta = new Alertas(this);
            this.Session["EmpresaId"] = Session["empresaId"];
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            var existe = _usuariosTableAdapter.ValidarUsuarioPorEmpresa(txtCorreo.Text);
            if (existe != 0)
            {
                mostrarAlerta.Error("Error al registrar el usuario, ya existe un usuario con este correo");
                return;
            }

            var codigoUsuario = _usuariosTableAdapter.CodigoSiguienteUsuariosPorEmpresa(int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()));
            txtCodigo.Text = (codigoUsuario.ToString());
            int resultado = 0;
            try
            {
                bool activo = chkbloqueado.Checked;
                resultado = _usuariosTableAdapter.InsertarUsuarioEncrypt(int.Parse(txtCodigo.Text), int.Parse(Request.Cookies["UserInfo"]["empresaId"].ToString()),
                    txtNombre.Text,txtApellido.Text,txtCorreo.Text,txtContraseña.Text, activo, false,int.Parse(cboPerfil.Value.ToString())
               );
            }
            catch (Exception ex)
            {
                mostrarAlerta.Error("Error al registrar el usuario");
                throw;
            }

            if (resultado == 1)
            {
                mostrarAlerta.Exito("Usuario Registrado");
                Limpiar();
            }
        }
        private void Limpiar()
        {
            txtCodigo.Text = null;
            txtNombre.Text = null;
            txtApellido.Text = null;
            txtCorreo.Text = null;
            txtContraseña.Text = null;
            cboPerfil.Value = null;
            

        }
    }
}