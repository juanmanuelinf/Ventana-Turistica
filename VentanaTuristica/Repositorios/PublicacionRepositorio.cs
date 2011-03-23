using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class PublicacionRepositorio : IRepositorio<Publicacion>
    {
        #region IRepositorio<Publicacion> Members

        public int Save(Publicacion entity)
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

        bool IRepositorio<Publicacion>.Update(Publicacion entity)
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

        void IRepositorio<Publicacion>.Delete(Publicacion entity)
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

        public IList<Publicacion> GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Publicacion));

                return criteria.List<Publicacion>();
            }
        }

        public Publicacion GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Publicacion>().Add(Restrictions.Eq("IdPublicacion", id)).UniqueResult<Publicacion>();
        }

        #endregion
    }
}
