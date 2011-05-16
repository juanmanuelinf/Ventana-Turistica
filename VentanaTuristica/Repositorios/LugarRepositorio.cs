using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class LugarRepositorio : IRepositorio<Lugar>
    {
        #region IRepositorio<Lugar> Members

        int IRepositorio<Lugar>.Save(Lugar entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdLugar;
                }
            }
        }

        bool IRepositorio<Lugar>.Update(Lugar entity)
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

        void IRepositorio<Lugar>.Delete(Lugar entity)
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

        IList<Lugar> IRepositorio<Lugar>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Lugar));

                return criteria.List<Lugar>();
            }
        }

        public Lugar GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Lugar>().Add(Restrictions.Eq("IdLugar", id)).UniqueResult<Lugar>();
        }

        #endregion
    }
}
