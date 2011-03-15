﻿using System;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Criterion;
using VentanaTuristica.Model;

namespace VentanaTuristica.Repositorios
{
    public class SubCategoriumRepositorio : IRepositorio<SubCategorium>
    {
        #region IRepositorio<SubCategorium> Members

        void IRepositorio<SubCategorium>.Save(SubCategorium entity)
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

        bool IRepositorio<SubCategorium>.Update(SubCategorium entity)
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

        void IRepositorio<SubCategorium>.Delete(SubCategorium entity)
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

        IList<SubCategorium> IRepositorio<SubCategorium>.GetAll()
        {
            using (ISession session = NHibernateHelper.OpenSession())
            {
                ICriteria criteria = session.CreateCriteria(typeof(SubCategorium));

                return criteria.List<SubCategorium>();
            }
        }

        SubCategorium IRepositorio<SubCategorium>.GetById(int id)
        {
            using (ISession session = NHibernateHelper.OpenSession())
                return session.CreateCriteria<SubCategorium>().Add(Restrictions.Eq("IdSubCategoria", id)).UniqueResult<SubCategorium>();
        }

        #endregion
    }
}
