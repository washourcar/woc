package com.woc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woc.dao.MetaDataDao;
import com.woc.model.CityArea;
import com.woc.model.City;
import com.woc.model.LabelValue;
import com.woc.service.MetaDataManager;
import com.woc.service.MetaDataService;

/**
 * Implementation of MetaDataManager interface.
 * 
 * @author mathi
 */
@Service("metaDataManager")
@WebService(serviceName = "MetaDataService", endpointInterface = "com.woc.service.MetaDataService")
public class MetaDataManagerImpl extends GenericManagerImpl<CityArea, String>
		implements MetaDataManager, MetaDataService {

	private MetaDataDao metaDataDao;

	@Autowired
	public MetaDataManagerImpl(MetaDataDao metaDataDao) {
		super(metaDataDao);
		this.metaDataDao = metaDataDao;
	}

	/**
	 * {@inheritDoc}
	 */
	public List<City> citySuggestions(String query) {
		return metaDataDao.citySuggestions(query);
	}

	/**
	 * {@inheritDoc}
	 */
	public List<LabelValue> getCitySuggestions(String query) {
		List<City> cities = metaDataDao.citySuggestions(query);
		List<LabelValue> list = new ArrayList<LabelValue>();

		for (City city : cities) {
			list.add(new LabelValue(city.getCityName(), city.getId()));
		}

		return list;
	}

	/**
	 * {@inheritDoc}
	 */
	public List<LabelValue> getAreaSuggestion(String query) {
		return getAreaSuggestions(query, "178289e8-133c-11e4-a849-e069959ac2ac");
	}

	/**
	 * {@inheritDoc}
	 */
	public List<LabelValue> getAreaSuggestions(String query, String cityId) {
		List<CityArea> areas = metaDataDao.areaSuggestions(query, cityId);
		List<LabelValue> list = new ArrayList<LabelValue>();

		for (CityArea area : areas) {
			list.add(new LabelValue(area.getAreaName(), area.getId()));
		}

		return list;
	}

	/**
	 * {@inheritDoc}
	 */
	public CityArea getArea(String id) {
		return metaDataDao.get(id);
	}

	/**
	 * {@inheritDoc}
	 */
	public CityArea getAreaByName(String areaName) {
		return metaDataDao.getAreaByName(areaName);
	}

	/**
	 * {@inheritDoc}
	 */
	public List<CityArea> areaSuggestions(String query, String cityId) {
		return metaDataDao.areaSuggestions(query, cityId);
	}

	/**
	 * {@inheritDoc}
	 */
	public City getCity(String id) {
		return metaDataDao.getCity(id);
	}

	/**
	 * {@inheritDoc}
	 */
	public City getCityByName(String cityName) {
		return metaDataDao.getCityByName(cityName);
	}

}
