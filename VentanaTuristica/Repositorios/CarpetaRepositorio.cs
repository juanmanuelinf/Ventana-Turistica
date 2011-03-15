using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class CarpetaViajeraRepositorio : IRepositorio<CarpetaViajera>
    {
        #region IRepositorio<CarpetaViajera> Members

        void IRepositorio<CarpetaViajera>.Save(CarpetaViajera entity)
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

        bool IRepositorio<CarpetaViajera>.Update(CarpetaViajera entity)
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

        void IRepositorio<CarpetaViajera>.Delete(CarpetaViajera entity)
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

        IList<CarpetaViajera> IRepositorio<CarpetaViajera>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(CarpetaViajera));

                return criteria.List<CarpetaViajera>();
            }
        }

        CarpetaViajera IRepositorio<CarpetaViajera>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<CarpetaViajera>().Add(Restrictions.Eq("IdUsuario", id)).UniqueResult<CarpetaViajera>();
        }

        #endregion
    }
}
