using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MiPymes_V2.Clases;

namespace MiPymes_V2.es.MasterPage
{

    public partial class MasterPage : System.Web.UI.MasterPage
    {
        Alertas mostrarAlerta = null;
        SqlConnection MiPymeConexion = new SqlConnection(Properties.Settings.Default.MiPymeConnection);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["UserInfo"] == null)
            {
                Response.Redirect("../../Inicio.aspx");
            }

            if (Session["empresaId"] ==null)
            {
                Response.Redirect("../../Inicio.aspx");
            }



            lblCuenta.Text = Request.Cookies["UserInfo"]["cuenta"];

            string SqlQryMenuEncabezado = "";
            string Admin = "";
            Admin = Request.Cookies["UserInfo"]["perfilId"];
            if (Request.Cookies["UserInfo"]["perfilId"] == "1")
            {
                SqlQryMenuEncabezado = "SELECT LinkId,Descripcion,LinkUrl,CssClass,Titulo,Icono FROM Links WHERE PadreID = 0 AND EstadoLink = 1";
            }
            else
            {
                SqlQryMenuEncabezado = "SELECT T0.LinkId,T0.Descripcion,T0.LinkUrl,T0.CssClass,T0.Titulo,T0.Icono " +
                                 "FROM Links T0 " +
                                 "INNER JOIN LinksPermisos T1 ON T0.LinkId = T1.LinkId " +
                                 "WHERE T0.PadreID = 0 AND T0.EstadoLink = 1 AND T1.PerfilId =" + Request.Cookies["UserInfo"]["perfilId"];
            }

            SqlDataAdapter da = new SqlDataAdapter(SqlQryMenuEncabezado, MiPymeConexion);
            DataTable dtMenuEncabezado = new DataTable();
            da.Fill(dtMenuEncabezado);
            HtmlGenericControl main = UList("Menuid", "MenuDinamico");
            foreach (DataRow row in dtMenuEncabezado.Rows)
            {
                if (Request.Cookies["UserInfo"]["perfilId"] == "1")
                {
                    da = new SqlDataAdapter("SELECT LinkId,Descripcion,LinkUrl,CssClass,Titulo,Icono FROM Links WHERE EstadoLink=1 AND PadreID=" + row["LinkId"].ToString(), MiPymeConexion);
                }
                else
                {
                    da = new SqlDataAdapter("SELECT T0.LinkId,T0.Descripcion,T0.LinkUrl,T0.CssClass,T0.Titulo,T0.Icono FROM Links T0 " +
                                            "INNER JOIN LinksPermisos T1 ON T0.LinkId = T1.LinkId " +
                                            "WHERE T0.EstadoLink = 1 AND T0.PadreID =" + row["LinkId"].ToString() + "AND T1.PerfilId =" + Request.Cookies["UserInfo"]["perfilId"], MiPymeConexion);
                }

                DataTable dtMenuDetalle = new DataTable();
                da.Fill(dtMenuDetalle);
                if (dtMenuDetalle.Rows.Count > 0)
                {
                    HtmlGenericControl sub_menu = LIList(row["Descripcion"].ToString(), row["LinkId"].ToString(), row["LinkUrl"].ToString(), row["CssClass"].ToString(), row["Titulo"].ToString(), row["Icono"].ToString());
                    HtmlGenericControl ul = new HtmlGenericControl("ul");
                    foreach (DataRow r in dtMenuDetalle.Rows)
                    {
                        ul.Controls.Add(LIList(r["Descripcion"].ToString(), r["LinkId"].ToString(), r["LinkUrl"].ToString(), r["CssClass"].ToString(), r["Titulo"].ToString(), r["Icono"].ToString()));
                    }
                    sub_menu.Controls.Add(ul);
                    main.Controls.Add(sub_menu);
                }
                else
                {
                    main.Controls.Add(LIList(row["Descripcion"].ToString(), row["LinkId"].ToString(), row["LinkUrl"].ToString(), row["CssClass"].ToString(), row["Titulo"].ToString(), row["Icono"].ToString()));
                }
            }

            //Conversión de HtmlGenericControl a String
            String output = "";
            StringBuilder generatedHtml = new StringBuilder();
            using (var htmlStringWriter = new StringWriter(generatedHtml))
            {
                using (var htmlTextWriter = new HtmlTextWriter(htmlStringWriter))
                {
                    main.RenderControl(htmlTextWriter);
                    output = generatedHtml.ToString();
                }
            }

            //CARGA DE MENU A ELEMENTO WEB *MENUWEB
            MenuWeb.Controls.Add(new LiteralControl(output));


        }

        private HtmlGenericControl UList(string id, string cssClass)
        {
            HtmlGenericControl ul = new HtmlGenericControl("ul");
            ul.ID = id;
            ul.Attributes.Add("class", cssClass);
            return ul;
        }
        private HtmlGenericControl LIList(string innerHtml, string rel, string url, string Clase, string Titulo, string Icono)
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            li.Attributes.Add("rel", rel);
            li.InnerHtml = string.Format("<a href=\"{0}\" title=\"{1}\"><i class=\"{4}\"></i><span class=\"{2}\">{3}</span></a>", url, Titulo, Clase, innerHtml, Icono);
            return li;
        }
    }
}