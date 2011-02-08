using System;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Contacto
	{
		public virtual string Cargo
		{
			get;
			set;
		}
		public virtual int IdContacto
		{
			get;
			set;
		}
		public virtual int? IdEmpresa
		{
			get;
			set;
		}
		public virtual int? IdPatrocinante
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
		public virtual string Tipo
		{
			get;
			set;
		}
		
		public override bool Equals(object obj)
		{
			if (ReferenceEquals(this, obj))
				return true;
				
			return Equals(obj as Contacto);
		}
		
		public virtual bool Equals(Contacto obj)
		{
			if (obj == null) return false;

			if (Equals(Cargo, obj.Cargo) == false)
				return false;

			if (Equals(IdContacto, obj.IdContacto) == false)
				return false;

			if (Equals(IdEmpresa, obj.IdEmpresa) == false)
				return false;

			if (Equals(IdPatrocinante, obj.IdPatrocinante) == false)
				return false;

			if (Equals(Mail, obj.Mail) == false)
				return false;

			if (Equals(Nombre, obj.Nombre) == false)
				return false;

			if (Equals(Tipo, obj.Tipo) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (Cargo != null ? Cargo.GetHashCode() : 0);
			result = (result * 397) ^ (IdContacto != null ? IdContacto.GetHashCode() : 0);
			result = (result * 397) ^ (IdEmpresa != null ? IdEmpresa.GetHashCode() : 0);
			result = (result * 397) ^ (IdPatrocinante != null ? IdPatrocinante.GetHashCode() : 0);
			result = (result * 397) ^ (Mail != null ? Mail.GetHashCode() : 0);
			result = (result * 397) ^ (Nombre != null ? Nombre.GetHashCode() : 0);
			result = (result * 397) ^ (Tipo != null ? Tipo.GetHashCode() : 0);			
			return result;
		}
	}
}