package com.woc.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.woc.dao.MetaDataDao;
import com.woc.model.CityArea;
import com.woc.model.City;

/**
 * This class interacts with Hibernate session to save/delete and retrieve meta
 * data objects.
 * 
 * @author mathi
 */
@Repository("metaDataDao")
public class MetaDataDaoHibernate extends GenericDaoHibernate<CityArea, String>
		implements MetaDataDao {

	public MetaDataDaoHibernate() {
		super(CityArea.class);
		// TODO Auto-generated constructor stub
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List<City> citySuggestions(String query) {
		List<City> cities = getSession().createCriteria(City.class)
				.add(Restrictions.like("cityName", "%" + query + "%"))
				.setMaxResults(10).list();
		return cities;
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public CityArea getArea(String id) {
		List<CityArea> areas = getSession().createCriteria(CityArea.class)
				.add(Restrictions.eq("id", id)).list();
		if (areas.isEmpty()) {
			return null;
		} else {
			return areas.get(0);
		}
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public CityArea getAreaByName(String areaName) {
		List<CityArea> areas = getSession().createCriteria(CityArea.class)
				.add(Restrictions.eq("areaName", areaName)).list();
		if (areas.isEmpty()) {
			return null;
		} else {
			return areas.get(0);
		}
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List<CityArea> areaSuggestions(String query, String cityId) {
		List<CityArea> areas = getSession().createCriteria(CityArea.class, "cityArea")
				.add(Restrictions.like("cityArea.areaName", "%" + query + "%"))
				.createAlias("cityArea.city", "city")
				.add(Restrictions.eq("city.id", cityId))
				.setMaxResults(10).list();
		return areas;
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public City getCity(String id) {
		List<City> cities = getSession().createCriteria(City.class)
				.add(Restrictions.eq("id", id)).list();
		if (cities.isEmpty()) {
			return null;
		} else {
			return cities.get(0);
		}
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public City getCityByName(String cityName) {
		List<City> cities = getSession().createCriteria(City.class)
				.add(Restrictions.eq("cityName", cityName)).list();
		if (cities.isEmpty()) {
			return null;
		} else {
			return cities.get(0);
		}
	}
}
