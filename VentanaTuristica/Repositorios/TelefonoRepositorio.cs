using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class TelefonoRepositorio : IRepositorio<Telefono>
    {
        #region IRepositorio<Telefono> Members

        int IRepositorio<Telefono>.Save(Telefono entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdTelefono;
                }
            }
        }

        bool IRepositorio<Telefono>.Update(Telefono entity)
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

        void IRepositorio<Telefono>.Delete(Telefono entity)
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

        IList<Telefono> IRepositorio<Telefono>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Telefono));

                return criteria.List<Telefono>();
            }
        }

        Telefono IRepositorio<Telefono>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Telefono>().Add(Restrictions.Eq("IdTelefono", id)).UniqueResult<Telefono>();
        }

        #endregion
    }
}
