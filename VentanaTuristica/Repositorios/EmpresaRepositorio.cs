using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class EmpresaRepositorio : IRepositorio<Empresa>
    {
        #region IRepositorio<Empresa> Members

        int IRepositorio<Empresa>.Save(Empresa entity)
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                using (ITransaction transaction = session.BeginTransaction())
                {
                    session.Save(entity);
                    transaction.Commit();
                    return entity.IdEmpresa;
                }
            }
        }

        bool IRepositorio<Empresa>.Update(Empresa entity)
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

        void IRepositorio<Empresa>.Delete(Empresa entity)
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

        public IList<Empresa> GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(Empresa));

                return criteria.List<Empresa>();
            }
        }

        public Empresa GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<Empresa>().Add(Restrictions.Eq("IdEmpresa", id)).UniqueResult<Empresa>();
        }

        #endregion
    }
}
