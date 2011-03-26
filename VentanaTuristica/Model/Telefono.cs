using System;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Telefono
	{
		public virtual int CodigoInt
		{
			get;
			set;
		}
		public virtual int CodigoLoc
		{
			get;
			set;
		}
		public virtual int? IdContacto
		{
			get;
			set;
		}
		public virtual int? IdEmpresa
		{
			get;
			set;
		}
		public virtual int IdTelefono
		{
			get;
			set;
		}
		public virtual int Numero
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
				
			return Equals(obj as Telefono);
		}
		
		public virtual bool Equals(Telefono obj)
		{
			if (obj == null) return false;

			if (Equals(CodigoInt, obj.CodigoInt) == false)
				return false;

			if (Equals(CodigoLoc, obj.CodigoLoc) == false)
				return false;

			if (Equals(IdContacto, obj.IdContacto) == false)
				return false;

			if (Equals(IdEmpresa, obj.IdEmpresa) == false)
				return false;

			if (Equals(IdTelefono, obj.IdTelefono) == false)
				return false;

			if (Equals(Numero, obj.Numero) == false)
				return false;

			if (Equals(Tipo, obj.Tipo) == false)
				return false;

			return true;
		}
		
		public override int GetHashCode()
		{
			int result = 1;

			result = (result * 397) ^ (CodigoInt != null ? CodigoInt.GetHashCode() : 0);
			result = (result * 397) ^ (CodigoLoc != null ? CodigoLoc.GetHashCode() : 0);
			result = (result * 397) ^ (IdContacto != null ? IdContacto.GetHashCode() : 0);
			result = (result * 397) ^ (IdEmpresa != null ? IdEmpresa.GetHashCode() : 0);
			result = (result * 397) ^ (IdTelefono != null ? IdTelefono.GetHashCode() : 0);
			result = (result * 397) ^ (Numero != null ? Numero.GetHashCode() : 0);
			result = (result * 397) ^ (Tipo != null ? Tipo.GetHashCode() : 0);			
			return result;
		}
	}
}