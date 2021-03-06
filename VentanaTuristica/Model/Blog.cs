using System;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Blog
	{
        [Required]
        [DataType(DataType.MultilineText)]
		public virtual string Descripcion
		{
			get;
			set;
		}

        [Required]
        [DataType(DataType.DateTime)]
		public virtual DateTime Fecha
		{
			get;
			set;
		}

		public virtual int IdBlog
		{
			get;
			set;
		}

        [Required]
        [DataType(DataType.Text)]
		public virtual string Titulo
		{
			get;
			set;
		}
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Blog);
		}
		
		public virtual bool Equals(Blog obj)
		{
			if (obj == null) return false;

			if (Equals(Descripcion, obj.Descripcion) == false)
				return false;

			if (Equals(Fecha, obj.Fecha) == false)
				return false;

			if (Equals(IdBlog, obj.IdBlog) == false)
				return false;

			if (Equals(Titulo, obj.Titulo) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Descripcion != null ? Descripcion.GetHashCode() : 0);
			result = (result * 397) ^ (Fecha != null ? Fecha.GetHashCode() : 0);
			result = (result * 397) ^ (IdBlog != null ? IdBlog.GetHashCode() : 0);
			result = (result * 397) ^ (Titulo != null ? Titulo.GetHashCode() : 0);			
			return result;
		}
	}
}