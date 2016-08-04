package com.meatball.linkz.common;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

/**
 * 配置解析器
 */
public class SimpleConfigurationParser {
	
	private static SimpleConfigurationParser instance = null;
	
	private Configuration properties;

	private SimpleConfigurationParser() {
		try {
			properties = new PropertiesConfiguration(this.getClass().getResource("/constants.properties"));
		} catch (ConfigurationException e) {
			e.printStackTrace();
		}
	}

	public static SimpleConfigurationParser getInstance() {
		if (instance == null) {
			synchronized(SimpleConfigurationParser.class){
				instance = new SimpleConfigurationParser();
			}
		}
		return instance;
	}

	public Configuration getProperties() {
		return properties;
	}
	
}
