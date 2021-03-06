using System;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Lugar
	{
        [Required]
        [DataType(DataType.Text)]
		public virtual string Nombre
		{
			get;
			set;
		}

        [Required]
        [DataType(DataType.Text)]
		public virtual string Tipo
		{
			get;
			set;
		}

		public virtual int IdLugar
		{
			get;
			set;
		}

        public virtual int? FkLugar
        {
            get;
            set;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(this, obj))
                return true;

            return Equals(obj as Lugar);
        }

		public virtual bool Equals(Lugar obj)
		{
			if (obj == null) return false;

			if (Equals(IdLugar, obj.IdLugar) == false)
				return false;

			if (Equals(Nombre, obj.Nombre) == false)
				return false;

			if (Equals(Tipo, obj.Tipo) == false)
				return false;

			if (Equals(FkLugar, obj.FkLugar) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Nombre != null ? Nombre.GetHashCode() : 0);
			result = (result * 397) ^ (Tipo != null ? Tipo.GetHashCode() : 0);
			result = (result * 397) ^ (IdLugar != null ? IdLugar.GetHashCode() : 0);
			result = (result * 397) ^ (FkLugar != null ? FkLugar.GetHashCode() : 0);			
			return result;
		}
	}
}