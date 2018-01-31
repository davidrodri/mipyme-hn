using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiPymes_V2_Dominio.Autenticacion
{
    public class Usuarios
    {
        public int UsuarioId { get; set; }
        public int EmpresaId { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public bool Bloqueado { get; set; }
        public bool CambiarClave { get; set; }
        public int PerfilId { get; set; }
        public bool ClaveCorrecta { get; set; }
    }
}
