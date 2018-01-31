using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace MiPymes_V2.Clases
{
    public class Alertas
    {
        public Page _page;
        public Page Page
        {
            get { return _page; }
            set { _page = value; }
        }

        public Alertas(Page page)
        {
            _page = page;
        }


        public void Error(string mensaje)
        {
            Error(mensaje, 7000);
        }

        public void Error(string mensaje, int tiempo)
        {
            _page.ClientScript.RegisterStartupScript(_page.GetType(), DateTime.Now.Ticks.ToString(), "iziToast.error({ title: 'Error', message:'" + mensaje.Replace("'", "") + "',timeout:" + tiempo + ",messageSize:13, position: 'topCenter',animateInside: true });", true);
        }

        public void Advertencia(string mensaje)
        {
            Advertencia(mensaje, 7000);
        }

        public void Advertencia(string mensaje, int tiempo)
        {
            _page.ClientScript.RegisterStartupScript(_page.GetType(), DateTime.Now.Ticks.ToString(), "iziToast.warning({ title: 'Atención', message:'" + mensaje + "',timeout:" + tiempo + ",messageSize:13, position: 'topCenter',animateInside: true });", true);
        }

        public void Exito(string mensaje)
        {
            Exito(mensaje, 7000);
        }

        public void Exito(string mensaje, int tiempo)
        {
            _page.ClientScript.RegisterStartupScript(_page.GetType(), DateTime.Now.Ticks.ToString(), "iziToast.success({ title: 'Éxito', message:'" + mensaje + "',timeout:" + tiempo + ",messageSize:13, position: 'topCenter',animateInside: true });", true);
        }

        public void Info(string mensaje)
        {
            Info(mensaje, 7000);
        }

        public void Info(string mensaje, int tiempo)
        {
            _page.ClientScript.RegisterStartupScript(_page.GetType(), DateTime.Now.Ticks.ToString(), "iziToast.info({ title: 'Información', message:'" + mensaje + "',timeout:" + tiempo + ",messageSize:13, position: 'topCenter',animateInside: true });", true);
        }
    }
}
