using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Precio
	{
		public virtual int IdPrecio
		{
			get;
			set;
		}

		public virtual int? IdPublicacion
		{
			get;
			set;
		}

        [Required]
        [DataType(DataType.Text)]
		public virtual string Moneda
		{
			get;
			set;
		}

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Precio Maximo")]
		public virtual int PrecioMax
		{
			get;
			set;
		}

        [Required]
        [DataType(DataType.Text)]
        [DisplayName("Precio Minimo")]
		public virtual int PrecioMin
		{
			get;
			set;
		}

        [Required]
        [RegularExpression(@"TA|TB")]
		public virtual string Tipo
		{
			get;
			set;
		}
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Precio);
		}
		
		public virtual bool Equals(Precio obj)
		{
			if (obj == null) return false;

			if (Equals(IdPrecio, obj.IdPrecio) == false)
				return false;

			if (Equals(IdPublicacion, obj.IdPublicacion) == false)
				return false;

			if (Equals(Moneda, obj.Moneda) == false)
				return false;

			if (Equals(PrecioMax, obj.PrecioMax) == false)
				return false;

			if (Equals(PrecioMin, obj.PrecioMin) == false)
				return false;

			if (Equals(Tipo, obj.Tipo) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (IdPrecio != null ? IdPrecio.GetHashCode() : 0);
			result = (result * 397) ^ (IdPublicacion != null ? IdPublicacion.GetHashCode() : 0);
			result = (result * 397) ^ (Moneda != null ? Moneda.GetHashCode() : 0);
			result = (result * 397) ^ (PrecioMax != null ? PrecioMax.GetHashCode() : 0);
			result = (result * 397) ^ (PrecioMin != null ? PrecioMin.GetHashCode() : 0);
			result = (result * 397) ^ (Tipo != null ? Tipo.GetHashCode() : 0);			
			return result;
		}
	}
}