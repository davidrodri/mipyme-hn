﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiPymes_V2.es.Inventarios
{
    public partial class Inventarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Session["EmpresaId"] = Session["empresaId"];
        }
    }
}