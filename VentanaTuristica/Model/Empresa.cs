using System;
using System.Collections.Generic;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Empresa
	{
		public virtual string Ciudad
		{
			get;
			set;
		}
		public virtual string Direccion
		{
			get;
			set;
		}
		public virtual int IdEmpresa
		{
			get;
			set;
		}
		public virtual string Localidad
		{
			get;
			set;
		}
		public virtual string Mail
		{
			get;
			set;
		}
		public virtual string Nombre
		{
			get;
			set;
		}
		public virtual string Rif
		{
			get;
			set;
		}
		public virtual string Website
		{
			get;
			set;
		}
        public virtual IList<Telefono> Telefonos
        {
            get;
            set;
        }
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Empresa);
		}
		
		public virtual bool Equals(Empresa obj)
		{
			if (obj == null) return false;

			if (Equals(Ciudad, obj.Ciudad) == false)
				return false;

			if (Equals(Direccion, obj.Direccion) == false)
				return false;

			if (Equals(IdEmpresa, obj.IdEmpresa) == false)
				return false;

			if (Equals(Localidad, obj.Localidad) == false)
				return false;

			if (Equals(Mail, obj.Mail) == false)
				return false;

			if (Equals(Nombre, obj.Nombre) == false)
				return false;

			if (Equals(Rif, obj.Rif) == false)
				return false;

			if (Equals(Website, obj.Website) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Ciudad != null ? Ciudad.GetHashCode() : 0);
			result = (result * 397) ^ (Direccion != null ? Direccion.GetHashCode() : 0);
			result = (result * 397) ^ (IdEmpresa != null ? IdEmpresa.GetHashCode() : 0);
			result = (result * 397) ^ (Localidad != null ? Localidad.GetHashCode() : 0);
			result = (result * 397) ^ (Mail != null ? Mail.GetHashCode() : 0);
			result = (result * 397) ^ (Nombre != null ? Nombre.GetHashCode() : 0);
			result = (result * 397) ^ (Rif != null ? Rif.GetHashCode() : 0);
			result = (result * 397) ^ (Website != null ? Website.GetHashCode() : 0);			
			return result;
		}
	}
}