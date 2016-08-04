package com.meatball.linkz.common.util;
//package com.zxd.common.util;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Queue;
//import java.util.concurrent.ConcurrentLinkedQueue;
//
//import org.apache.log4j.Logger;
//
//
//
//public class SmsSendUtil {
//
//	/**
//	 * 日志
//	 */
//	private static Logger LOGGER = Logger.getLogger(SmsSendUtil.class);
//
//	/**
//	 * 单例
//	 */
//	private final static SmsSendUtil instance = new SmsSendUtil();
//
//	/**
//	 * 短信发送存放队列
//	 */
//	private Queue<SmsSendVo> queue = new ConcurrentLinkedQueue<SmsSendVo>();
//
//	/**
//	 * 线程集合
//	 */
//	private List<AbstractThread> threadList = new ArrayList<AbstractThread>();
//
//	/**
//	 * 创建一个新的实例 SmsSendUtil.
//	 * 
//	 */
//	private SmsSendUtil() {
//		// 入口日志
//		if (LOGGER.isInfoEnabled()) {
//			LOGGER.info("[enter]---->SmsSendUtil.SmsSendUtil()");
//		}
//
//		// 启动短信发送线程
//		SmsSendThread smsSendThread = new SmsSendThread("smsSendThread");
//		smsSendThread.start();
//		threadList.add(smsSendThread);
//
//		// 出口日志
//		if (LOGGER.isInfoEnabled()) {
//			LOGGER.info("[outer]<----SmsSendUtil.SmsSendUtil()");
//		}
//
//	}
//
//	/**
//	 * 获得单例
//	 * 
//	 * @return 单例
//	 */
//	public static SmsSendUtil getInstance() {
//		return instance;
//	}
//
//	/**
//	 * 短信发送线程
//	 * 
//	 * @author victor 2014-4-8
//	 * @since 2.0
//	 */
//	private class SmsSendThread extends AbstractThread {
//
//		/**
//		 * 创建一个新的实例 SmsSendThread.
//		 * 
//		 * @param name
//		 *            线程名称
//		 */
//		public SmsSendThread(String name) {
//			super(name);
//		}
//
//		/**
//		 * 复制线程
//		 * 
//		 * @return 线程
//		 */
//		@Override
//		public AbstractThread copy() {
//			this.setRunFlag(false);
//			SmsSendThread temp = new SmsSendThread(this.getName());
//			temp.setSleepTime(getSleepTime());
//			temp.start();
//			return temp;
//		}
//
//		/**
//		 * 执行方法
//		 * 
//		 */
//		@Override
//		public void execute() {
//			SmsSendVo vo = queue.poll();
//
//			// 如果没有查到，休息1秒，返回
//			if (CheckNull.isNull(vo)) {
//				try {
//					sleep(1000);
//					return;
//				} catch (InterruptedException e) {
//				}
//			}
//
//			// 实时取用户名和密码URL
//			String sendUser = "miot";
//
//			String sendPassword = "miot";
//
//
//			LOGGER.info("sendSmsUrl:=============>" + sendSmsUrl + ",content=" + vo.getContent() + ",mobile="
//					+ vo.getTelephoneNumber());
//
//			try {
//
//				HttpClientUtil.sendPost(sendSmsUrl, new String[] { "sendUser", "sendPassword", "mobile", "content",
//						"ext" }, new Object[] { sendUser, sendPassword, vo.getTelephoneNumber(), vo.getContent(), "" });
//			} catch (Exception e) {
//				LOGGER.error("sendSmsError,sendUser:" + sendUser + ",sendSmsUrl:" + sendSmsUrl + ",mobile:"
//						+ vo.getTelephoneNumber() + ",content:" + vo.getContent());
//			}
//		}
//	}
//
//	/**
//	 * 短信发送VO
//	 * 
//	 * @author victor 2014-11-25
//	 * @since 2.0
//	 */
//	public class SmsSendVo {
//
//		/**
//		 * 手机号码
//		 */
//		private String telephoneNumber;
//
//		/**
//		 * 内容
//		 */
//		private String content;
//
//		/**
//		 * 获得手机号码
//		 * 
//		 * @return 手机号码
//		 */
//		public String getTelephoneNumber() {
//			return telephoneNumber;
//		}
//
//		/**
//		 * 设置手机号码
//		 * 
//		 * @param telephoneNumber
//		 *            手机号码
//		 */
//		public void setTelephoneNumber(String telephoneNumber) {
//			this.telephoneNumber = telephoneNumber;
//		}
//
//		/**
//		 * 获得内容
//		 * 
//		 * @return 内容
//		 */
//		public String getContent() {
//			return content;
//		}
//
//		/**
//		 * 设置内容
//		 * 
//		 * @param content
//		 *            内容
//		 */
//		public void setContent(String content) {
//			this.content = content;
//		}
//
//		/**
//		 * 重写toString方法
//		 * 
//		 * @return 字符串
//		 * @see java.lang.Object#toString()
//		 */
//		@Override
//		public String toString() {
//			return "SmsSendVo [content=" + content + ", telephoneNumber=" + telephoneNumber + "]";
//		}
//
//	}
//
//	/**
//	 * 发送短信
//	 * 
//	 * @param telephoneNumber
//	 *            电话号码
//	 * @param content
//	 *            内容
//	 * 
//	 */
//	public void sendSms(String telephoneNumber, String content) {
//		SmsSendVo vo = new SmsSendVo();
//		vo.setTelephoneNumber(telephoneNumber);
//		vo.setContent(content);
//		queue.add(vo);
//	}
//
//}
