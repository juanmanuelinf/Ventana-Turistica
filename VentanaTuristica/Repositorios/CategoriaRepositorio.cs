using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class CategoriumRepositorio : IRepositorio<Categorium>
    {
        #region IRepositorio<Categorium> Members

        void IRepositorio<Categorium>.Save(Categorium entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                }
            }
        }

        bool IRepositorio<Categorium>.Update(Categorium entity)
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

        void IRepositorio<Categorium>.Delete(Categorium entity)
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

        IList<Categorium> IRepositorio<Categorium>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Categorium));

                return criteria.List<Categorium>();
            }
        }

        Categorium IRepositorio<Categorium>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Categorium>().Add(Restrictions.Eq("IdCategoria", id)).UniqueResult<Categorium>();
        }

        #endregion
    }
}
