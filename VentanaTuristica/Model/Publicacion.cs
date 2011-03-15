using System;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Publicacion
	{
		public virtual string Efectivo
		{
			get;
			set;
		}
		public virtual int IdPublicacion
		{
			get;
			set;
		}
		public virtual string Latitud
		{
			get;
			set;
		}
		public virtual string Longitud
		{
			get;
			set;
		}
		public virtual string Reservacion
		{
			get;
			set;
		}
		public virtual string Tcredito
		{
			get;
			set;
		}
		public virtual string Tdebito
		{
			get;
			set;
		}
		public virtual string Transferencia
		{
			get;
			set;
		}
		public virtual ISet<CarpetaViajera> CarpetaViajeras
		{
			get;
			set;
		}
		public virtual Empresa Empresa
		{
			get;
			set;
		}
		public virtual ISet<Idioma> Idiomas
		{
			get;
			set;
		}
		public virtual ISet<Imagene> Imagenes
		{
			get;
			set;
		}
		public virtual ISet<Precio> Precios
		{
			get;
			set;
		}
		public virtual ISet<Servicio> Servicios
		{
			get;
			set;
		}
		public virtual SubCategorium SubCategorium
		{
			get;
			set;
		}
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Publicacion);
		}
		
		public virtual bool Equals(Publicacion obj)
		{
			if (obj == null) return false;

			if (Equals(Efectivo, obj.Efectivo) == false)
				return false;

			if (Equals(IdPublicacion, obj.IdPublicacion) == false)
				return false;

			if (Equals(Latitud, obj.Latitud) == false)
				return false;

			if (Equals(Longitud, obj.Longitud) == false)
				return false;

			if (Equals(Reservacion, obj.Reservacion) == false)
				return false;

			if (Equals(Tcredito, obj.Tcredito) == false)
				return false;

			if (Equals(Tdebito, obj.Tdebito) == false)
				return false;

			if (Equals(Transferencia, obj.Transferencia) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Efectivo != null ? Efectivo.GetHashCode() : 0);
			result = (result * 397) ^ (IdPublicacion != null ? IdPublicacion.GetHashCode() : 0);
			result = (result * 397) ^ (Latitud != null ? Latitud.GetHashCode() : 0);
			result = (result * 397) ^ (Longitud != null ? Longitud.GetHashCode() : 0);
			result = (result * 397) ^ (Reservacion != null ? Reservacion.GetHashCode() : 0);
			result = (result * 397) ^ (Tcredito != null ? Tcredito.GetHashCode() : 0);
			result = (result * 397) ^ (Tdebito != null ? Tdebito.GetHashCode() : 0);
			result = (result * 397) ^ (Transferencia != null ? Transferencia.GetHashCode() : 0);			
			return result;
		}
	}
}