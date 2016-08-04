package com.meatball.linkz.common.util;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class JsonUtil {

	public static String objectToJson(Object object, String[] fields, boolean next) {
		StringBuilder json = new StringBuilder();
		if (object == null) {
			json.append("\"\"");
		} else if (object instanceof String) {
			String objstr = (String) object;
			objstr = objstr.replaceAll("\"", "“");
			if (!CheckNull.isNull(fields)) {
				for (int i = 0; i < fields.length; i++) {

					if (objstr.equals(fields[i])) {
						json.append("\"").append(objstr).append("\"");
					}
				}
			} else {
				json.append("\"").append(objstr).append("\"");
			}

		} else if (object instanceof Integer) {
			Integer objInt = (Integer) object;
			if (!CheckNull.isNull(fields)) {
				for (int i = 0; i < fields.length; i++) {
					if (fields[i].equals(objInt)) {
						json.append(objInt);
					}
				}
			} else {
				json.append(objInt);
			}

		} else if (object instanceof BigInteger) {
			BigInteger objInt = (BigInteger) object;
			if (!CheckNull.isNull(fields)) {
				for (int i = 0; i < fields.length; i++) {
					if (fields[i].equals(objInt)) {
						json.append(objInt);
					}
				}
			} else {
				json.append(objInt);
			}
		} else if (object instanceof Date) {
			Date objdate = (Date) object;
			if (!CheckNull.isNull(fields)) {
				for (int i = 0; i < fields.length; i++) {
					if (fields[i].equals(objdate)) {
						json.append("\"").append(DateUtil.dateToStr(objdate)).append("\"");

					}
				}
			} else {
				json.append("\"").append(DateUtil.dateToStr(objdate)).append("\"");
			}
		} else if (object instanceof Double) {
			Double objdate = (Double) object;
			if (!CheckNull.isNull(fields)) {
				for (int i = 0; i < fields.length; i++) {
					if (fields[i].equals(objdate)) {
						json.append(objdate);
					}
				}
			} else {
				json.append(objdate.toString());
			}
		} else if (object instanceof Long) {
			Long objdate = (Long) object;
			if (!CheckNull.isNull(fields)) {
				for (int i = 0; i < fields.length; i++) {
					if (fields[i].equals(objdate)) {
						json.append(objdate);
					}
				}
			} else {
				json.append(objdate.toString());
			}
		} else if (object instanceof ArrayList) {
			if (next) {
				json.append(listToJson((ArrayList) object, null, next));
			}
		} else if (object instanceof Set) {
		} else {
			json.append(beanToJson(object, fields, next));
		}
		return json.toString();
	}

	/**
	 * 功能描述:传入任意一个 javabean 对象生成一个指定规格的字符串
	 * 
	 * @param bean
	 *            数据对象
	 * @param fields
	 *            所需字段
	 * @return String
	 */
	public static String beanToJson(Object bean, String[] fields, boolean next) {
		StringBuilder json = new StringBuilder();
		json.append("{");
		PropertyDescriptor[] props = null;
		try {
			props = Introspector.getBeanInfo(bean.getClass(), Object.class).getPropertyDescriptors();
		} catch (IntrospectionException e) {
		}
		if (props != null) {
			for (int i = 0; i < props.length; i++) {
				try {
					String name = objectToJson(props[i].getName(), fields, next);
					String value = objectToJson(props[i].getReadMethod().invoke(bean), null, next);
					Object oo = props[i].getReadMethod().getReturnType().getName();
					if (("java.util.List").equals(oo) && ("\"\"").equals(value)) {
						value = "[]";
					}
					value = value.replaceAll("<br/>", ";");
					if (!CheckNull.isNull(name)) {
						json.append(name);
						json.append(":");
						json.append(value);
						json.append(",");
					}
				} catch (Exception e) {
				}
			}
			json.setCharAt(json.length() - 1, '}');
		} else {
			json.append("}");
		}
		return json.toString();
	}

	/**
	 * 功能描述:通过传入一个列表对象,调用指定方法将列表中的数据生成一个JSON规格指定字符串
	 * 
	 * @param list
	 *            列表对象
	 * @param fields
	 *            所需字段
	 * @return java.lang.String
	 */
	public static String listToJson(List<?> list, String[] fields, boolean next) {
		StringBuilder json = new StringBuilder();
		json.append("[");
		if (list != null && list.size() > 0) {
			for (Object obj : list) {
				json.append(beanToJson(obj, fields, next));
				json.append(",");
			}
			json.setCharAt(json.length() - 1, ']');
		} else {
			json.append("]");
		}
		return json.toString();
	}

	public static String ObjectListToJson(Object obj, String[] fields) {
		StringBuilder json = new StringBuilder();
		json.append("[");

		return json.toString();
	}

	public static String filterStr(Object o) {
		return CheckNull.isNull(o) ? "" : o.toString();
	}
}