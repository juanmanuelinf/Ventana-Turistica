using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class IdiomaRepositorio : IRepositorio<Idioma>
    {
        #region IRepositorio<Idioma> Members

        public int Save(Idioma entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdIdioma;
                }
            }
        }

        bool IRepositorio<Idioma>.Update(Idioma entity)
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

        void IRepositorio<Idioma>.Delete(Idioma entity)
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

        public IList<Idioma> GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Idioma));

                return criteria.List<Idioma>();
            }
        }

        Idioma IRepositorio<Idioma>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Idioma>().Add(Restrictions.Eq("IdIdioma", id)).UniqueResult<Idioma>();
        }

        #endregion
    }
}
