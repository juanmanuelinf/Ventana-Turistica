using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class PublicacionServicioRepositorio : IRepositorio<PublicacionServicio>
    {
        #region IRepositorio<PublicacionServicio> Members

        public int Save(PublicacionServicio entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdPublicacion;
                }
            }
        }

        bool IRepositorio<PublicacionServicio>.Update(PublicacionServicio entity)
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

        void IRepositorio<PublicacionServicio>.Delete(PublicacionServicio entity)
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

        public IList<PublicacionServicio> GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(PublicacionServicio));

                return criteria.List<PublicacionServicio>();
            }
        }

        PublicacionServicio IRepositorio<PublicacionServicio>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<PublicacionServicio>().Add(Restrictions.Eq("IdPublicacion", id)).UniqueResult<PublicacionServicio>();
        }

        #endregion
    }
}
