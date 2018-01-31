using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiPymes_V2_Dominio.Conexion
{
    public class BaseDatos
    {
        public static SqlConnection conexionMiPyme = new SqlConnection(ConfigurationManager.ConnectionStrings["MiPymeConnectionString"].ConnectionString);
       
    }
}
