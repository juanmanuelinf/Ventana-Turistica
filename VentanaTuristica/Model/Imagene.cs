using System;
using System.ComponentModel.DataAnnotations;
using System.Web;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Imagene
	{
		public virtual byte[] DatosOriginal
		{
			get;
			set;
		}

		public virtual byte[] DatosTrans
		{
			get;
			set;
		}

        [DataType(DataType.MultilineText)]
		public virtual string Descripcion
		{
			get;
			set;
		}

		public virtual int IdImagen
		{
			get;
			set;
		}

		public virtual int? IdPatrocinante
		{
			get;
			set;
		}

		public virtual int? IdPublicacion
		{
			get;
			set;
		}

        [RegularExpression(@"S|P|L|I")]
		public virtual string Tipo
		{
			get;
			set;
		}

        public virtual string Link
        {
            get;
            set;
        }

        public virtual HttpPostedFileBase File
        {
            get;
            set;
        }

		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Imagene);
		}
		
		public virtual bool Equals(Imagene obj)
		{
			if (obj == null) return false;

			if (Equals(DatosOriginal, obj.DatosOriginal) == false)
				return false;

			if (Equals(DatosTrans, obj.DatosTrans) == false)
				return false;

			if (Equals(Descripcion, obj.Descripcion) == false)
				return false;

			if (Equals(IdImagen, obj.IdImagen) == false)
				return false;

			if (Equals(IdPatrocinante, obj.IdPatrocinante) == false)
				return false;

			if (Equals(IdPublicacion, obj.IdPublicacion) == false)
				return false;

			if (Equals(Tipo, obj.Tipo) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (DatosOriginal != null ? DatosOriginal.GetHashCode() : 0);
			result = (result * 397) ^ (DatosTrans != null ? DatosTrans.GetHashCode() : 0);
			result = (result * 397) ^ (Descripcion != null ? Descripcion.GetHashCode() : 0);
			result = (result * 397) ^ (IdImagen != null ? IdImagen.GetHashCode() : 0);
			result = (result * 397) ^ (IdPatrocinante != null ? IdPatrocinante.GetHashCode() : 0);
			result = (result * 397) ^ (IdPublicacion != null ? IdPublicacion.GetHashCode() : 0);
			result = (result * 397) ^ (Tipo != null ? Tipo.GetHashCode() : 0);			
			return result;
		}
	}
}