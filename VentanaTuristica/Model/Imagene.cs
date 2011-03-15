using System;

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
		public virtual string Tipo
		{
			get;
			set;
		}
		public virtual Patrocinante Patrocinante
		{
			get;
			set;
		}
		public virtual Publicacion Publicacion
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
			result = (result * 397) ^ (Tipo != null ? Tipo.GetHashCode() : 0);			
			return result;
		}
	}
}