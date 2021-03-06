using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Categorium
	{
        [DataType(DataType.MultilineText)]
		public virtual string Descripcion
		{
			get;
			set;
		}

		public virtual int? FkIdCategoria
		{
			get;
			set;
		}

		public virtual int IdCategoria
		{
			get;
			set;
		}

        [DataType(DataType.Text)]
        [RegularExpression(@"en-US|es-MX")]
		public virtual string Idioma
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

        public virtual IList<SubCategorium> SubCategoriums
        {
            get;
            set;
        }
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Categorium);
		}
		
		public virtual bool Equals(Categorium obj)
		{
			if (obj == null) return false;

			if (Equals(Descripcion, obj.Descripcion) == false)
				return false;

			if (Equals(FkIdCategoria, obj.FkIdCategoria) == false)
				return false;

			if (Equals(IdCategoria, obj.IdCategoria) == false)
				return false;

			if (Equals(Idioma, obj.Idioma) == false)
				return false;

			if (Equals(Nombre, obj.Nombre) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Descripcion != null ? Descripcion.GetHashCode() : 0);
			result = (result * 397) ^ (FkIdCategoria != null ? FkIdCategoria.GetHashCode() : 0);
			result = (result * 397) ^ (IdCategoria != null ? IdCategoria.GetHashCode() : 0);
			result = (result * 397) ^ (Idioma != null ? Idioma.GetHashCode() : 0);
			result = (result * 397) ^ (Nombre != null ? Nombre.GetHashCode() : 0);			
			return result;
		}
	}
}