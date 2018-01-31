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
    public partial class CrearCuenta : System.Web.UI.Page
    {
        private static string vCorreo = "";
        private static bool vDisponible = false;
        private static int cantidad = 0;
        Alertas mostrarAlerta = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            mostrarAlerta = new Alertas(this);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            bool vRespuesta = false;
            CrearEmpresaUsuario(txtNombreEmpresa.Text, txtNombrePropietario.Text, txtApellido.Text,
                Int32.Parse(cboDepartamento.Value.ToString()), Int32.Parse(cboMoneda.Value.ToString()), 
                txtCorreo.Text, txtClave.Text,out vRespuesta);

            if (cantidad == 0)
            {
                mostrarAlerta.Error("Error al crear la empresa.");
                return;
            }
            if (vRespuesta == false)
            {
                mostrarAlerta.Advertencia("El correo ya se encuentra registrado.");
                return;
            }

            Limpiar();
            
            //Response.Redirect("Inicio.aspx");
            mostrarAlerta.Exito("Empresa Creada Correctamente, proceda a Iniciar Sesión.");
        }

        private void Limpiar()
        {
            txtNombreEmpresa.Text = "";
            txtNombrePropietario.Text = "";
            txtApellido.Text = "";
            cboDepartamento.Value = null;
            cboMoneda.Value = null;
            txtCorreo.Text = "";
            txtClave.Text = "";
        }

        public static int CrearEmpresaUsuario(string nombreEmpresa, string nombrePropietario,string apellidoPropietario,int departamento, 
            int moneda,string correo,string contraseña,out bool vSalida )
        {
            string str = Properties.Settings.Default.MiPymeConnection;
            vSalida = false;
            using (SqlConnection cadenaConexion = new SqlConnection(str))
            {
                using (SqlCommand cmd = new SqlCommand("spAgregarEmpresaUsuario", cadenaConexion))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@NombreEmpresa", SqlDbType.VarChar).Value = nombreEmpresa;
                    cmd.Parameters.Add("@NombrePropietario", SqlDbType.VarChar).Value = nombrePropietario;
                    cmd.Parameters.Add("@ApellidoPropietario", SqlDbType.VarChar).Value = apellidoPropietario;
                    cmd.Parameters.Add("@Departamento", SqlDbType.Int).Value = departamento;
                    cmd.Parameters.Add("@Moneda", SqlDbType.Int).Value = moneda;
                    cmd.Parameters.Add("@Correo", SqlDbType.VarChar).Value = correo;
                    cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar).Value = contraseña;
                    cmd.Parameters.Add("@PlanId", SqlDbType.Int).Value = contraseña;

                    if (cadenaConexion.State == ConnectionState.Closed) { cadenaConexion.Open(); }
                    using (SqlDataReader dreader = cmd.ExecuteReader())
                    {
                        while (dreader.Read())
                        {
                            vCorreo = dreader.GetString(0);
                            vDisponible = dreader.GetBoolean(1);
                            vSalida = dreader.GetBoolean(1);
                        };
                        if (dreader.HasRows) { cantidad += 1; }
                        dreader.Close();
                    }
                }
                if (cadenaConexion.State == ConnectionState.Open) { cadenaConexion.Close(); }
            }
            return cantidad;
        }
    }
}