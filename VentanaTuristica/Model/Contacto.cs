using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Iesi.Collections.Generic;

namespace VentanaTuristica.Model
{
	[Serializable]
	public partial class Contacto
	{
        [DataType(DataType.Text)]
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

        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", ErrorMessage = "Formato e-mail: ejemplo@ventanaturistica.com")]
        [DataType(DataType.EmailAddress)]
        [DisplayName("E-mail")]
        public virtual string Mail
		{
			get;
			set;
		}
        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", ErrorMessage = "Formato e-mail: ejemplo@ventanaturistica.com")]
        [DataType(DataType.EmailAddress)]
        [DisplayName("E-mail2")]
        public virtual string Mail2
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

        [DataType(DataType.Text)]
        [RegularExpression(@"P|E")]
        [DisplayName(@"Tipo de Contacto")]
		public virtual string Tipo
		{
			get;
			set;
		
        }

        public virtual IList<Telefono> ListaTelefonos
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