using System;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class PublicacionServicio
	{
        [Required]
		public virtual int IdPublicacion
		{
			get;
			set;
		}

        [Required]
		public virtual int IdServicio
		{
			get;
			set;
		}
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as PublicacionServicio);
		}
		
		public virtual bool Equals(PublicacionServicio obj)
		{
			if (obj == null) return false;

			if (Equals(IdPublicacion, obj.IdPublicacion) == false)
				return false;

			if (Equals(IdServicio, obj.IdServicio) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (IdPublicacion != null ? IdPublicacion.GetHashCode() : 0);
			result = (result * 397) ^ (IdServicio != null ? IdServicio.GetHashCode() : 0);			
			return result;
		}
	}
}