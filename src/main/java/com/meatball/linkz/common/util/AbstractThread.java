package com.meatball.linkz.common.util;

public abstract class AbstractThread extends Thread {

	/**
	 * @Fields runCount : 运行次数
	 */
	private int runCount = 1;

	/**
	 * @Fields sleepTime : 休眠时间
	 */
	private int sleepTime = 0;

	/**
	 * @Fields runFlag : 运行标识
	 */
	private boolean runFlag = true;

	public boolean isRunFlag() {
		return runFlag;
	}

	public void setRunFlag(boolean runFlag) {
		this.runFlag = runFlag;
	}

	public AbstractThread(String name) {
		super(name);
		this.runCount = 1;
	}

	public int getRunCount() {
		return runCount;
	}

	public void setRunCount(int runCount) {
		this.runCount = runCount;
	}

	public int getSleepTime() {
		return sleepTime;
	}

	public void setSleepTime(int sleepTime) {
		this.sleepTime = sleepTime;
	}

	/**
	 * 
	 * run
	 * 
	 */
	@Override
	public void run() {
		while (runFlag) {
			// 如果是休眠0毫秒，会有执行时间。所以只有大于0毫秒才扫行休眠
			if (sleepTime > 0) {
				try {
					this.sleep(sleepTime);
				} catch (InterruptedException e) {
				}
			}

			runCount++;
			execute();
		}

	}

	public abstract void execute();

	// 用来删除当前线程，new一个新的线程
	public abstract AbstractThread copy();

}