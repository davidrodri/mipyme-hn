using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MiPymes_V2.Clases
{
    public class BaseDatos
    {
        public static SqlConnection conexionMiPyme = new SqlConnection(ConfigurationManager.ConnectionStrings["MiPymeConnectionString"].ConnectionString);
    }
}