using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class PatrocinanteRepositorio : IRepositorio<Patrocinante>
    {
        #region IRepositorio<Patrocinante> Members

        void IRepositorio<Patrocinante>.Save(Patrocinante entity)
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

        bool IRepositorio<Patrocinante>.Update(Patrocinante entity)
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

        void IRepositorio<Patrocinante>.Delete(Patrocinante entity)
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

        IList<Patrocinante> IRepositorio<Patrocinante>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Patrocinante));

                return criteria.List<Patrocinante>();
            }
        }

        Patrocinante IRepositorio<Patrocinante>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Patrocinante>().Add(Restrictions.Eq("IdPatrocinante", id)).UniqueResult<Patrocinante>();
        }

        #endregion
    }
}
