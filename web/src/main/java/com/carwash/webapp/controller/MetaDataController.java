package com.woc.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woc.model.CityArea;
import com.woc.model.LabelValue;
import com.woc.service.MetaDataManager;

@Controller
public class MetaDataController extends BaseFormController {

	private MetaDataManager metaDataManager;

	@Autowired
	public void setMetaDataManager(MetaDataManager metaDataManager) {
		this.metaDataManager = metaDataManager;
	}

	/**
	 * get area suggestions
	 * 
	 * @return
	 */
	@RequestMapping(value = "/area", method = RequestMethod.GET, produces = "application/xml")
	public @ResponseBody
	List<LabelValue> getAreaSuggestions(
			@RequestParam(required = false, value = "q") String query) {
		List<LabelValue> areas = metaDataManager.getAreaSuggestions(query,
				"178289e8-133c-11e4-a849-e069959ac2ac");
		return areas;
	}

}
