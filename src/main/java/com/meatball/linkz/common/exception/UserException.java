package com.meatball.linkz.common.exception;

public class UserException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 错误信息配置
	 */
//	private final Properties pro = ConstantsProperties.getProperties();
	/**
	 * 错误码
	 */
	private String errCode = "";
	/**
	 * 错误描述
	 */
	private String errMsg = "";
    /**
     * 异常发生时间
     */
    private long date = System.currentTimeMillis();

    public long getDate() {
        return date;
    }

    @SuppressWarnings("all")
    public UserException(String errCode,String...objs){
    	this.errCode = errCode;
//    	this.errMsg = MessageFormat.format(pro.getProperty(errCode), objs);
    }
    
    public String getErrCode(){
    	return this.errCode;
    }
    
    public String getErrMsg(){
    	return this.errMsg;
    }
    
}
