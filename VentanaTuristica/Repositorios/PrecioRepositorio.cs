using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class PrecioRepositorio : IRepositorio<Precio>
    {
        #region IRepositorio<Precio> Members

        int IRepositorio<Precio>.Save(Precio entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdPrecio;
                }
            }
        }

        bool IRepositorio<Precio>.Update(Precio entity)
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

        void IRepositorio<Precio>.Delete(Precio entity)
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

        public IList<Precio> GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Precio));

                return criteria.List<Precio>();
            }
        }

        Precio IRepositorio<Precio>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Precio>().Add(Restrictions.Eq("IdPrecio", id)).UniqueResult<Precio>();
        }

        #endregion
    }
}
