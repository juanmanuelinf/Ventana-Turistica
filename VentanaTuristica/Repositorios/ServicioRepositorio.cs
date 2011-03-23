using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class ServicioRepositorio : IRepositorio<Servicio>
    {
        #region IRepositorio<Servicio> Members

        int IRepositorio<Servicio>.Save(Servicio entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdServicio;
                }
            }
        }

        bool IRepositorio<Servicio>.Update(Servicio entity)
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

        void IRepositorio<Servicio>.Delete(Servicio entity)
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

        public IList<Servicio> GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Servicio));

                return criteria.List<Servicio>();
            }
        }

        public Servicio GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Servicio>().Add(Restrictions.Eq("IdServicio", id)).UniqueResult<Servicio>();
        }

        #endregion
    }
}
