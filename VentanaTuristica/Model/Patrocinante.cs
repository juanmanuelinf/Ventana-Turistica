using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Patrocinante
	{
        [DataType(DataType.MultilineText)]
		public virtual string Descripcion
		{
			get;
			set;
		}

		public virtual int IdPatrocinante
		{
			get;
			set;
		}

        [Required]
        [DataType(DataType.Text)]
		public virtual string Nombre
		{
			get;
			set;
		}

        public virtual IList<Contacto> Contacto
        {
            get;
            set;
        }
        
        public virtual Imagene Imagene
        {
            get;
            set;
        }

        [Required]
        public virtual HttpPostedFileBase File
        {
            get;
            set;
        }

        [Required]
        [RegularExpression(@"http://([\w-]+\.)+[\w-]+(/[\w- ./?%#&amp;=]*)?", ErrorMessage = "Ejemplo website: http://www.google.com")]
        [DataType(DataType.Text)]
        public virtual String Link 
        {
            get;
            set;
        }

		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Patrocinante);
		}
		
		public virtual bool Equals(Patrocinante obj)
		{
			if (obj == null) return false;

			if (Equals(Descripcion, obj.Descripcion) == false)
				return false;

			if (Equals(IdPatrocinante, obj.IdPatrocinante) == false)
				return false;

			if (Equals(Nombre, obj.Nombre) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Descripcion != null ? Descripcion.GetHashCode() : 0);
			result = (result * 397) ^ (IdPatrocinante != null ? IdPatrocinante.GetHashCode() : 0);
			result = (result * 397) ^ (Nombre != null ? Nombre.GetHashCode() : 0);			
			return result;
		}
	}
}