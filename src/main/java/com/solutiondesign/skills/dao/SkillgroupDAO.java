package com.solutiondesign.skills.dao;

// Generated Feb 28, 2013 11:04:59 AM by Hibernate Tools 3.4.0.CR1

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.solutiondesign.skills.domain.Skillgroup;

/**
 * Home object for domain model class Skillgroup.
 * @see com.solutiondesign.skills.domain.Skillgroup
 * @author Hibernate Tools
 */
public class SkillgroupDAO extends BaseDAO {
	
	private static final Log log = LogFactory.getLog(SkillgroupDAO.class);

//	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	
//	protected SessionFactory getSessionFactory() {
//		return sessionFactory;
//	}
//	private final SessionFactory sessionFactory = getSessionFactory();

	@Transactional
	public Skillgroup findById(java.lang.Integer id) {
		log.debug("getting Skillgroup instance with id: " + id);
		System.out.println("### getting Skillgroup instance with id: " + id);
		System.out.println("### sessionFactory: " + sessionFactory);
		System.out.println("### Skillgroup sessionFactory.getCurrentSession()" + sessionFactory.getCurrentSession());
		System.out.println("### Skillgroup findById");
		try {
			Skillgroup instance = (Skillgroup) sessionFactory.getCurrentSession().get("com.solutiondesign.skills.domain.Skillgroup", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	
//	public void persist(Skillgroup transientInstance) {
//		log.debug("persisting Skillgroup instance");
//		try {
//			sessionFactory.getCurrentSession().persist(transientInstance);
//			log.debug("persist successful");
//		} catch (RuntimeException re) {
//			log.error("persist failed", re);
//			throw re;
//		}
//	}
//
//	public void attachDirty(Skillgroup instance) {
//		log.debug("attaching dirty Skillgroup instance");
//		try {
//			sessionFactory.getCurrentSession().saveOrUpdate(instance);
//			log.debug("attach successful");
//		} catch (RuntimeException re) {
//			log.error("attach failed", re);
//			throw re;
//		}
//	}
//
//	public void attachClean(Skillgroup instance) {
//		log.debug("attaching clean Skillgroup instance");
//		try {
//			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
//			log.debug("attach successful");
//		} catch (RuntimeException re) {
//			log.error("attach failed", re);
//			throw re;
//		}
//	}
//
//	public void delete(Skillgroup persistentInstance) {
//		log.debug("deleting Skillgroup instance");
//		try {
//			sessionFactory.getCurrentSession().delete(persistentInstance);
//			log.debug("delete successful");
//		} catch (RuntimeException re) {
//			log.error("delete failed", re);
//			throw re;
//		}
//	}
//
//	public Skillgroup merge(Skillgroup detachedInstance) {
//		log.debug("merging Skillgroup instance");
//		try {
//			Skillgroup result = (Skillgroup) sessionFactory.getCurrentSession()
//					.merge(detachedInstance);
//			log.debug("merge successful");
//			return result;
//		} catch (RuntimeException re) {
//			log.error("merge failed", re);
//			throw re;
//		}
//	}


//	public List findByExample(Skillgroup instance) {
//		log.debug("finding Skillgroup instance by example");
//		try {
//			List results = sessionFactory.getCurrentSession()
//					.createCriteria("com.solutiondesign.skills.domain.Skillgroup")
//					.add(Example.create(instance)).list();
//			log.debug("find by example successful, result size: "
//					+ results.size());
//			return results;
//		} catch (RuntimeException re) {
//			log.error("find by example failed", re);
//			throw re;
//		}
//	}
}
