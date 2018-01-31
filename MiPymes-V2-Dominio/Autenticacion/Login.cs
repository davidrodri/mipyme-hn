using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiPymes_V2_Dominio.Conexion;

namespace MiPymes_V2_Dominio.Autenticacion
{
    public class Login
    {
        public static Usuarios LoginPorUsuarios(string Correo, string Clave)
        {
            //string con = ConfigurationManager.ConnectionStrings["MiPymeConnectionString"].ConnectionString;
            string str = Properties.Settings.Default.MiPymeConnectionString;

            Usuarios result = new Usuarios();

            using (SqlConnection conexion = new SqlConnection(str))
            {
                using (SqlCommand cmd = new SqlCommand("spLoginUsuario", conexion))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@Cuenta", SqlDbType.VarChar).Value = Correo;
                    cmd.Parameters.Add("@Clave", SqlDbType.VarChar).Value = Clave;
                    conexion.Open();

                    using (SqlDataReader dreader = cmd.ExecuteReader())
                    {
                        while (dreader.Read())
                        {
                            Usuarios workItem = new Usuarios()
                            {
                                UsuarioId = dreader.GetInt32(0),
                                EmpresaId = dreader.GetInt32(1)
                            };
                            //result.Add(workItem);
                        }
                        dreader.Close();
                    }

                    conexion.Close();
                }
            }
            return result;
        }
    }
}
