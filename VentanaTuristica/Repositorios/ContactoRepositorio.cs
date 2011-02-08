using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class ContactoRepositorio : IRepositorio<Contacto>
    {
        #region IRepositorio<Contacto> Members

        int IRepositorio<Contacto>.Save(Contacto entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdContacto;
                }
            }
        }

        bool IRepositorio<Contacto>.Update(Contacto entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Update(entity);
                    transaction.Commit();
                }
            }
            return true;
        }

        void IRepositorio<Contacto>.Delete(Contacto entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Delete(entity);
                    transaction.Commit();
                }
            }
        }

        IList<Contacto> IRepositorio<Contacto>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Contacto));

                return criteria.List<Contacto>();
            }
        }

        Contacto IRepositorio<Contacto>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Contacto>().Add(Restrictions.Eq("IdContacto", id)).UniqueResult<Contacto>();
        }

        #endregion
    }
}
