using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.Clases
{
    public class DatosGlobales
    {
        //Constructor de la clase


        /// <summary>
        /// Muestra un mensaje en Forma de Toast
        /// </summary>
        /// <param name="Mensaje"></param>
        /// <param name="P">this</param>
        /// <param name="T">GetType()</param>
        /// <param name="tipoMensaje">1-Advertencia 2-Exitoso 3-Error 4-Información</param>
        /// <param name="tiempo"></param>
        public static void MostrarMensaje(string Mensaje, Page P, Type T, int tipoMensaje = 1, Int32 tiempo = 5000)
        {
            string titulo = "";
            string tipoMensajeTitulo = "";

            switch (tipoMensaje)
            {
                case 1:
                    titulo = "Advertencia:";
                    tipoMensajeTitulo = ".warning";
                    tiempo = 10000;
                    break;

                case 2:
                    titulo = "OK:";
                    tipoMensajeTitulo = ".success";
                    break;

                case 3:
                    titulo = "Error:";
                    tipoMensajeTitulo = ".error";
                    tiempo = 10000;
                    break;

                case 4:
                    titulo = "Información:";
                    tipoMensajeTitulo = ".info";
                    break;


                default:
                    titulo = "Información:";
                    tipoMensajeTitulo = ".info";
                    break;
            }

            ScriptManager.RegisterStartupScript(P, T, "YourUniqueScriptKey",
       "iziToast" + tipoMensajeTitulo + "({    title: '" + titulo + "',  message: '" + Mensaje + "',timeout:" + tiempo + ",messageSize:16,position: 'bottomRight',});", true);

        }
        }
}