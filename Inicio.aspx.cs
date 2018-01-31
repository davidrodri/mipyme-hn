using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;

namespace MiPymes_V2
{
    public partial class Inicio : System.Web.UI.Page
    {
        Alertas mostrarAlerta = null;
        //Cookies Usuarios
        HttpCookie myPymeCookie = new HttpCookie("UserInfo");

        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarAlerta = new Alertas(this);
            if (Request.Cookies["UserInfo"] != null)
            {
                Response.Cookies["UserInfo"].Expires = DateTime.Now.AddDays(-1);
                Response.Redirect("Inicio.aspx");
            }
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            DataSetMiPymeProcedimientosTableAdapters.spLoginUsuarioTableAdapter spLoginUsuario = 
                new DataSetMiPymeProcedimientosTableAdapters.spLoginUsuarioTableAdapter();
           
            DataSetMiPymeProcedimientos.spLoginUsuarioDataTable loginUsuario;
            loginUsuario = spLoginUsuario.GetData(txtCorreo.Text, txtClave.Text);
            
            var encontroUsuario = loginUsuario.FirstOrDefault();
           
            if (encontroUsuario == null)
            {
                mostrarAlerta.Error("No existe el usuario ingresado.");
                return;
            }

            if (encontroUsuario.ClaveCorrecta ==0)
            {
                mostrarAlerta.Advertencia("Usario o clave incorrecta.");
                return;
            }

            if (encontroUsuario.Bloqueado==true)
            {
                mostrarAlerta.Advertencia("El usuario ha sido bloqueado.");
                return;
            }

            
            myPymeCookie["usuarioId"] = encontroUsuario.UsuarioId.ToString();
            myPymeCookie["empresaId"] = encontroUsuario.EmpresaId.ToString();
            myPymeCookie["perfilId"] = encontroUsuario.PerfilId.ToString();
            myPymeCookie["cuenta"] = (encontroUsuario.Nombre + "." + encontroUsuario.Apellido); 
            myPymeCookie.Expires = DateTime.Now.AddDays(1d);
            Response.Cookies.Add(myPymeCookie);

            
            Session["empresaId"] = encontroUsuario.EmpresaId.ToString();
            Response.Redirect("~/es/Principal/Index.aspx");
        }

       
    }
}
