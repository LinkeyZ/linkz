package com.meatball.linkz.common.genaral;

import java.util.HashMap;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.annotate.JsonPropertyOrder;

@JsonIgnoreProperties(ignoreUnknown=true)
@JsonPropertyOrder(value={"status","error_code","msg","data"})
public class JsonResult {
	private int status;
	@JsonProperty(value="error_code")
	private String errorCode;
	private String msg;
	private Object data;

	public JsonResult() {
		super();
	}
	
	/**
	 * 正常状态
	 * @param data
	 */
	public JsonResult(Object data){
		this.status = 0;
		this.errorCode = "0";
		this.msg = "success";
		this.data = data;
	}
	public JsonResult(String name,Object value){
		this.status = 0;
		this.errorCode = "0";
		this.msg = "success";
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		resultMap.put(name,value);
		this.data = resultMap;
	}
	
	public JsonResult(int status, String errorCode, String msg, Object data) {
		super();
		this.status = status;
		this.errorCode = errorCode;
		this.msg = msg;
		this.data = data;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

}
