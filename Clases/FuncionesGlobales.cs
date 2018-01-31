using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MiPymes_V2.Funciones
{
    public class FuncionesGlobales
    {
        public DataTable getDataTable(string query)
        {
            DataTable tbl = new DataTable();
            using (var Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["MiPymes_V2.Properties.Settings.MiPymeConnection"].ConnectionString))
            {
                SqlDataAdapter adpObjetos = new SqlDataAdapter();

                adpObjetos.SelectCommand = new SqlCommand();
                adpObjetos.SelectCommand.CommandText = query;
                adpObjetos.SelectCommand.Connection = Conexion;
                adpObjetos.SelectCommand.CommandType = CommandType.Text;
                adpObjetos.Fill(tbl);
            }
            return tbl;
        }
        public DataTable Inserto(string query)
        {
            DataTable tbl = new DataTable();
            using (var Conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["MiPymes_V2.Properties.Settings.MiPymeConnection"].ConnectionString))
            {
                SqlDataAdapter adpObjetos = new SqlDataAdapter();
                Conexion.Open();
                adpObjetos.InsertCommand = new SqlCommand();
                adpObjetos.InsertCommand.CommandText = query;
                adpObjetos.InsertCommand.Connection = Conexion;
                adpObjetos.InsertCommand.CommandType = CommandType.Text;
                adpObjetos.InsertCommand.ExecuteNonQuery();
                adpObjetos.Update(tbl);
                Conexion.Close();
            }

            return tbl;
        }




    }
}