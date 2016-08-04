package com.meatball.linkz.common.util;

import java.util.Hashtable;
public class Constantslib {
	// 民族
	public Hashtable<Integer, String> nations = new Hashtable<Integer, String>();
	// 疾病编码
	public Hashtable<String, String> dieases = new Hashtable<String, String>();
	//婚姻状况
	public Hashtable<Integer, String> maritalStatus = new Hashtable<Integer, String>();
	// 医保类别
	public Hashtable<Integer, String> medicare = new Hashtable<Integer, String>();
	// 文化程度
	public Hashtable<Integer, String> education = new Hashtable<Integer, String>();
	// 职业类别
	public Hashtable<Integer, String> jobs = new Hashtable<Integer, String>();
	private static Constantslib instance;
	private Constantslib() {
		nations.put(1, "汉族");
		nations.put(2, "壮族");
		nations.put(3, "满族");
		nations.put(4, "回族");
		nations.put(5, "苗族");
		nations.put(6, "维吾尔族");
		nations.put(7, "土家族");
		nations.put(8, "彝族");
		nations.put(9, "蒙古族");
		nations.put(10, "藏族");
		nations.put(11, "布依族");
		nations.put(12, "侗族");
		nations.put(13, "瑶族");
		nations.put(14, "朝鲜族");
		nations.put(15, "白族");
		nations.put(16, "哈尼族");
		nations.put(17, "哈萨克族");
		nations.put(18, "黎族");
		nations.put(19, "傣族");
		nations.put(20, "畲族");
		nations.put(21, "僳僳族");
		nations.put(22, "仡佬族");
		nations.put(23, "东乡族");
		nations.put(24, "拉祜族");
		nations.put(25, "水族");
		nations.put(26, "佤族");
		nations.put(27, "纳西族");
		nations.put(28, "羌族");
		nations.put(29, "土族");
		nations.put(30, "仫佬族");
		nations.put(31, "锡伯族");
		nations.put(32, "柯尔克孜族");
		nations.put(33, "达斡尔族");
		nations.put(34, "景颇族");
		nations.put(35, "毛南族");
		nations.put(36, "撒拉族");
		nations.put(37, "布朗族");
		nations.put(38, "塔吉克族");
		nations.put(39, "阿昌族");
		nations.put(40, "普米族");
		nations.put(41, "鄂温克族");
		nations.put(42, "怒族");
		nations.put(43, "京族");
		nations.put(44, "基诺族");
		nations.put(45, "德昂族");
		nations.put(46, "保安族");
		nations.put(47, "俄罗斯族");
		nations.put(48, "裕固族");
		nations.put(49, "乌孜别克族");
		nations.put(50, "门巴族");
		nations.put(51, "鄂伦春族");
		nations.put(52, "独龙族");
		nations.put(53, "塔塔尔族");
		nations.put(54, "赫哲族");
		nations.put(55, "高山族");
		nations.put(56, "珞巴族");

		dieases.put("A18", "结核病");
		dieases.put("B34.4", "人乳头瘤病毒感染");
		dieases.put("C11", "鼻咽癌");
		dieases.put("C15", "食管癌");
		dieases.put("C16", "胃癌");
		dieases.put("C22.0", "肝癌");
		dieases.put("C25", "胰腺癌");
		dieases.put("C34", "肺癌");
		dieases.put("C41", "骨癌");
		dieases.put("C50", "乳腺癌");
		dieases.put("C53", "宫颈癌");
		dieases.put("C54", "子宫癌");
		dieases.put("C56", "卵巢癌");
		dieases.put("C61", "前列腺癌");
		dieases.put("C67", "膀胱癌");
		dieases.put("C73", "甲状腺癌");
		dieases.put("C80", "恶性肿瘤");
		dieases.put("C95.9", "白血病");
		dieases.put("C-JZCA", "结直肠癌");
		dieases.put("C-NL", "脑瘤");
		dieases.put("C-PFA", "皮肤癌");
		dieases.put("E14", "糖尿病");
		dieases.put("E66", "肥胖症");
		dieases.put("E78", "血脂异常");
		dieases.put("E79", "尿酸升高");
		dieases.put("F99", "精神疾病");
		dieases.put("I10", "高血压");
		dieases.put("I10", "高血压病");
		dieases.put("I25.1", "冠心病");
		dieases.put("I50", "心力衰竭");
		dieases.put("I73", "外周血管病");
		dieases.put("I-NZZ", "脑卒中");
		dieases.put("J44.9", "慢性阻塞性肺病");
		dieases.put("J45", "哮喘");
		dieases.put("K31.7", "胃息肉");
		dieases.put("K92", "幽门螺杆菌感染");
		dieases.put("K-CXR", "肠道息肉");
		dieases.put("K-MXDNY-DSZ", "慢性胆囊炎、胆石症");
		dieases.put("K-MXGY-GYH", "慢性肝炎或肝硬化");
		dieases.put("K-MXWY-KY", "慢性胃炎或胃溃疡");
		dieases.put("K-MXYXY", "慢性胰腺炎");
		dieases.put("K-ZFG", "脂肪肝");
		dieases.put("M06.9", "类风湿性关节炎");
		dieases.put("M10.9", "痛风");
		dieases.put("M81.9", "骨质疏松");
		dieases.put("M-FSMY", "风湿免疫性疾病");
		dieases.put("N64.9", "慢性乳腺疾病");
		dieases.put("N-MXSZB", "慢性肾脏疾病");
		dieases.put("N-QLXY-FD", "前列腺炎或肥大");

		dieases.put("JB-QT", "其他");// 其他疾病
		dieases.put("ZL-QT", "其他");// 其他肿瘤

		maritalStatus.put(1, "未婚");
		maritalStatus.put(2, "已婚（含同居）");
		maritalStatus.put(3, "丧偶");
		maritalStatus.put(4, "离异");
		maritalStatus.put(5, "其他");

		medicare.put(1, "城镇职工医保");
		medicare.put(2, "城镇居民医保");
		medicare.put(3, "新农合医保");
		medicare.put(4, "其他");
		medicare.put(5, "无");

		education.put(1, "小学及以下");
		education.put(2, "初中");
		education.put(3, "高中");
		education.put(4, "中专及技校");
		education.put(5, "大学本科/专科");
		education.put(6, "研究生及以上");

		jobs.put(1, "国家公务员");
		jobs.put(2, "专业技术人员");
		jobs.put(3, "职员");
		jobs.put(4, "企业管理人员");
		jobs.put(5, "工人");
		jobs.put(6, "农民");
		jobs.put(7, "学生");
		jobs.put(8, "现役军人");
		jobs.put(9, "自由职业者");
		jobs.put(10, "个体经营者");
		jobs.put(11, "无业人员");
		jobs.put(12, "退（离）休人员");
		jobs.put(13, "其他");
	}
	public static Constantslib getInstance() {
		if (instance == null) {
			instance = new Constantslib();
		}
		return instance;
	}
	/**
	 * 获取民族名称
	 * 
	 * @param code
	 * @return
	 */
	public String getNation(int code) {
		String res = nations.get(code);
		if (res == null) {
			return "";
		}
		return res;
	}
	/**
	 * 获取疾病名称
	 * 
	 * @param code
	 * @return
	 */
	public String getDiease(String code) {
		String res = dieases.get(code);
		if (res == null) {
			return "";
		}
		return res;
	}
	/**
	 * 获取婚姻状况
	 * 
	 * @param code
	 * @return
	 */
	public String getMarital(int code) {
		String res = maritalStatus.get(code);
		if (res == null) {
			return "";
		}
		return res;
	}
	/**
	 * 获取医保类别
	 * 
	 * @param code
	 * @return
	 */
	public String getMedicare(int code) {
		String res = medicare.get(code);;
		if (res == null) {
			return "";
		}
		return res;
	}
	/**
	 * 获取文化程度
	 * 
	 * @param code
	 * @return
	 */
	public String getEducation(int code) {
		String res = education.get(code);
		if (res == null) {
			return "";
		}
		return res;
	}
	/**
	 * 获取职业类别
	 * 
	 * @param code
	 * @return
	 */
	public String getJob(int code) {
		String res = jobs.get(code);
		if (res == null) {
			return "";
		}
		return res;
	}
	/**
	 * 获取疾病 格式:I-NZZ,I25.1,K-MXDNY-DSZ,C56
	 * 
	 * @param code
	 * @return
	 */
	public String getDieases(String code) {
		String tmpCode = code;
		StringBuffer result = new StringBuffer();
		String[] tmpCodes = tmpCode.split(",");
		for (String tmp : tmpCodes){
			String res = dieases.get(tmp);
			if (res != null) {
				result.append(",").append(res);
			}
		}
		if (result.length() > 0) {
			return result.substring(1).toString();
		} else {
			return "";
		}
	}
	/**
	 * 获取家族病史 I10,1;I-NZZ,2;I25.1,3;I73,4;
	 * 
	 * @param code
	 * @return
	 */
	public String getFamilyDieases(String code) {
		String tmpCode = code;
		StringBuilder buff = new StringBuilder();
		String[] tmpCodes = tmpCode.split(";");
		for (String tmp : tmpCodes) {
			String[] vtmps = tmp.split(",");
			String vrelative = "";
			String vt = vtmps[1];
			if ("1".equals(vt)) {
				vrelative = "父亲";
			} else if ("2".equals(vt)) {
				vrelative = "母亲";
			} else if ("3".equals(vt)) {
				vrelative = "兄弟";
			} else if ("4".equals(vt)) {
				vrelative = "姐妹";
			}
			String diease = dieases.get(vtmps[0]);
			if (diease != null) {
				buff.append(diease).append(":").append(vrelative);
			}
		}
		return buff.toString();
	}
	public static void main(String[] args) {
		String str = Constantslib.getInstance().getDieases(
"I-NZZ");
		System.out.println("result:" + str);
	}
}
