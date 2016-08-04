package com.meatball.linkz.common.http;

import com.meatball.linkz.common.SimpleConfigurationParser;

public class HttpGetConnection extends HttpConnection {

	@Override
	public String[] beforeDoConnection(String doctorId) {
		String method = "GET";
		String address = SimpleConfigurationParser.getInstance().getProperties().getString("weatherAddress");
		String json = "";
		
		String[] ret = new String[3];
		ret[0] = method;
		ret[1] = address + "/p/user/get/team/customer/list?role_id=" +doctorId.trim();
		ret[2] = json;
		return ret;
	}

}
