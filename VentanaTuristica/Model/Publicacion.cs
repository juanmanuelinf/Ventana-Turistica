using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Publicacion
	{
        [DataType(DataType.Text)]
		public virtual string Efectivo
		{
			get;
			set;
		}
        [Required]
		public virtual int IdEmpresa
		{
			get;
			set;
		}
		public virtual int IdPublicacion
		{
			get;
			set;
		}
		public virtual int IdSubCategoria
		{
			get;
			set;
		}
        [DataType(DataType.Text)]
		public virtual string Latitud
		{
			get;
			set;
		}
        [DataType(DataType.Text)]
		public virtual string Longitud
		{
			get;
			set;
		}
        [DataType(DataType.Text)]
		public virtual string Reservacion
		{
			get;
			set;
		}
        [DataType(DataType.Text)]
		public virtual string Tcredito
		{
			get;
			set;
		}
        [DataType(DataType.Text)]
		public virtual string Tdebito
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
        [Required]
        [DataType(DataType.Text)]
        public virtual string Ciudad
        {
            get;
            set;
        }
        [Required]
        [DataType(DataType.Text)]
        public virtual string Estado
        {
            get;
            set;
        }
        [Required]
        [DataType(DataType.Text)]
        public virtual string Pais
        {
            get;
            set;
        }
        [Required]
        [DataType(DataType.Text)]
        public virtual string Direccion
        {
            get;
            set;
        }
        [DataType(DataType.Text)]
		public virtual string Transferencia
		{
			get;
			set;
		}
        public virtual SubCategorium SubCategorium
        {
            get;
            set;
        }
        public virtual Empresa Empresa
        {
            get;
            set;
        }
        public virtual IList<Idioma> Idioma
        {
            get;
            set;
        }
        public virtual IList<Servicio> Servicios
        {
            get;
            set;
        }
        public virtual IList<Imagene> Imagenes
        {
            get;
            set;
        }
        public virtual Categorium Categorium
        {
            get;
            set;
        }
        public virtual Imagene Imagen
        {
            get;
            set;
        }
        public virtual IList<Precio> Precios
        {
            get;
            set;
        }
        

        public virtual bool Equals(object obj)
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

			if (Equals(IdEmpresa, obj.IdEmpresa) == false)
				return false;

			if (Equals(IdPublicacion, obj.IdPublicacion) == false)
				return false;

			if (Equals(IdSubCategoria, obj.IdSubCategoria) == false)
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
			result = (result * 397) ^ (IdEmpresa != null ? IdEmpresa.GetHashCode() : 0);
			result = (result * 397) ^ (IdPublicacion != null ? IdPublicacion.GetHashCode() : 0);
			result = (result * 397) ^ (IdSubCategoria != null ? IdSubCategoria.GetHashCode() : 0);
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