package com.meatball.linkz.common.util;
//package com.zxd.common.util;
//
//import java.io.ByteArrayInputStream;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.ObjectInputStream;
//import java.io.ObjectOutputStream;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Set;
//
//import redis.clients.jedis.Jedis;
//import redis.clients.jedis.JedisPool;
//import redis.clients.jedis.JedisPoolConfig;
//
//
//public class RedisManager {
//
//	protected static JedisPool pool = null;
//
//	static String auth = "a7DCxgGDQhYUjaUDAoMd";
//
//	static {
//		JedisPoolConfig config = new JedisPoolConfig();
//		config.setMaxActive(5000);
//		config.setMaxIdle(20);
//		config.setMaxWait(1000l);
//		// 58.83.186.88
//		// pool = new JedisPool(config, "58.83.184.197", 6788, 10000);
//		pool = new JedisPool(config, "218.241.151.247", 6379, 10000);
//	}
//
//	public RedisManager() {
//		// TODO Auto-generated constructor stub
//
//	}
//	
//	public static void setValue(int index_db,String key,String value,int seconds){
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		jedis.setex(key, seconds, value);
//
//		pool.returnResource(jedis);
//	}
//	
//
//	public static void setHSvalue(int index_db, String key, String value) {
//		// 使用时：
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		jedis.set(key, value);
//
//		pool.returnResource(jedis);
//	}
//
//	public static void setListValue(int index_db, String key, String value) {
//		// 使用时：
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		jedis.lpush(key, value);
//
//		pool.returnResource(jedis);
//	}
//
//	public static List<String> getList(int index_db, String key) {
//		// 使用时：
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		List<String> l = jedis.lrange(key, 0, -1);
//
//		pool.returnResource(jedis);
//
//		return l;
//
//	}
//
//	public static void setHSvalueWithTimeout(int index_db, String key, String value, int timeout_sec) {
//		// 使用时：
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		jedis.setex(key, timeout_sec, value);
//
//		pool.returnResource(jedis);
//	}
//
//	public static String getHSvalue(int index_db, String key) {
//		// 使用时：
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		String value = jedis.get(key);
//		pool.returnResource(jedis);
//		return value;
//
//	}
//
//	public static void clearDB(int index_db) {
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		jedis.flushDB();
//
//		pool.returnResource(jedis);
//	}
//
//	public static boolean containsKey(int index_db, String key) {
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//		boolean b = jedis.exists(key);
//		pool.returnResource(jedis);
//		return b;
//	}
//
//	public static void setHSObj(int index_db, String key, Object obj) throws IOException, ClassNotFoundException {
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//
//		jedis.select(index_db);
//
//		// 下面是对对象进行存储的测试代码
//		ByteArrayOutputStream bos = new ByteArrayOutputStream();
//		ObjectOutputStream oos = new ObjectOutputStream(bos);
//
//		// Person person = new Person("dingfeng", 32);
//
//		oos.writeObject(obj);
//
//		byte[] byteArray = bos.toByteArray();
//		oos.close();
//		bos.close();
//
//		String setObjectRet = jedis.set(key.getBytes(), byteArray);
//		System.out.println(" set object return \t" + setObjectRet);
//
//		pool.returnResource(jedis);
//	}
//	
//	
//	public static long delHSObj(int index_db, String key) {		
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//		jedis.select(index_db);
//		long count = 0;
//		try {			
//			count = jedis.del(key.getBytes());
//			
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		pool.returnResource(jedis);
//		return count;
//	}
//
//	public static Object getHSObj(int index_db, String key) {
//		Object obj = null;
//		Jedis jedis = pool.getResource();
//		jedis.auth(auth);
//		jedis.select(index_db);
//
//		try {
//			byte[] bs = jedis.get(key.getBytes());
//			if(bs != null){
//				ByteArrayInputStream bis = new ByteArrayInputStream(bs);
//				ObjectInputStream inputStream = new ObjectInputStream(bis);
//				obj = inputStream.readObject();
//				inputStream.close();
//				bis.close();
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		pool.returnResource(jedis);
//		return obj;
//	}
//	
//	
//	public static User getUserInfo(String user_id){
//		
//		User user = (User) RedisManager.getHSObj(0, user_id);
//		
//		return user;
//	}
//
//	@SuppressWarnings("deprecation")
//	public static void main(String[] args) {
//
//		try {
////			List<User> list = new ArrayList<User>();
////			User user = new User();
////			user.setUsername("alpha");
////			user.setAge(35);
////			list.add(user);
////			user = new User();
////			user.setUsername("alpha2");
////			user.setAge(20);
////			list.add(user);
////
////			setHSObj(1, "dingfeng1", user);
////			
////			setHSObj(1, "userlist", list);
////			User readObject = (User) getHSObj(1, "dingfeng1");
//			
//			//readObject.setDiseases("aaaaaaaaa");
//			
//			
//			
////			MonitorAbnormal ma = new MonitorAbnormal();
////			ma.setUserPhoto("aaaaa");
////			ma.setUsername("刘玉建");
////			ma.setSex(1);
////			ma.setAge(25);
////			Role r = new Role();
////			r.setId(20);
////			r.setName("305VIP用户");
////			Set<Role> roles = new HashSet<Role>();
////			roles.add(r);
////			ma.setRoles(roles);
////			ma.setAlarmTime(new Date());
////			
////			
////			ArrayList<BloodPressureUnusual>  BloodPressList = new ArrayList<BloodPressureUnusual>();
////			
////			BloodPressureUnusual bpu = new BloodPressureUnusual();
////			bpu.setMeasurementDate(new Date());
////			bpu.setSystolic("150");
////			bpu.setDiastolic("98");
////			bpu.setHeartrate("90");
////			BloodPressList.add(bpu);
////			BloodPressureUnusual bpu1 = new BloodPressureUnusual();
////			bpu1.setMeasurementDate(new Date());
////			bpu1.setSystolic("155");
////			bpu1.setDiastolic("93");
////			bpu1.setHeartrate("92");
////			BloodPressList.add(bpu1);
////			ma.setBloodPressList(BloodPressList);
////			
////			
////			ArrayList<BloodGlucoseUnusual>  BloodGlucoList = new ArrayList<BloodGlucoseUnusual>();
////			BloodGlucoseUnusual bgu = new BloodGlucoseUnusual();
////			bgu.setGluType(1);
////			bgu.setGlu(5.8);
////			bgu.setMeasurementDate(new Date());
////			BloodGlucoList.add(bgu);
////			
////			BloodGlucoseUnusual bgu1 = new BloodGlucoseUnusual();
////			bgu1.setGluType(2);
////			bgu1.setGlu(3.8);
////			bgu1.setMeasurementDate(new Date());
////			BloodGlucoList.add(bgu1);
////			ma.setBloodGlucoList(BloodGlucoList);
////			
////			
////			
////			MonitorAbnormal ma1 = new MonitorAbnormal();
////			ma1.setUserPhoto("aaaaa");
////			ma1.setUsername("刘玉建");
////			ma1.setSex(1);
////			ma1.setAge(25);
////			Role r1 = new Role();
////			r1.setId(20);
////			r1.setName("305VIP用户");
////			Set<Role> roles1 = new HashSet<Role>();
////			roles1.add(r1);
////			ma1.setRoles(roles1);
////			ma1.setAlarmTime(new Date());
////			
////			
////			ArrayList<BloodPressureUnusual>  BloodPressList1 = new ArrayList<BloodPressureUnusual>();
////			
////			BloodPressureUnusual bpu2 = new BloodPressureUnusual();
////			bpu2.setMeasurementDate(new Date());
////			bpu2.setSystolic("150");
////			bpu2.setDiastolic("98");
////			bpu2.setHeartrate("90");
////			BloodPressList1.add(bpu2);
////			BloodPressureUnusual bpu3 = new BloodPressureUnusual();
////			bpu2.setMeasurementDate(new Date());
////			bpu2.setSystolic("155");
////			bpu2.setDiastolic("93");
////			bpu2.setHeartrate("92");
////			BloodPressList1.add(bpu2);
////			ma1.setBloodPressList(BloodPressList1);
////			
////			
////			ArrayList<BloodGlucoseUnusual>  BloodGlucoList1 = new ArrayList<BloodGlucoseUnusual>();
////			BloodGlucoseUnusual bgu2 = new BloodGlucoseUnusual();
////			bgu2.setGluType(1);
////			bgu2.setGlu(5.8);
////			bgu2.setMeasurementDate(new Date());
////			BloodGlucoList1.add(bgu2);
////			
////			BloodGlucoseUnusual bgu3 = new BloodGlucoseUnusual();
////			bgu3.setGluType(2);
////			bgu3.setGlu(3.8);
////			bgu3.setMeasurementDate(new Date());
////			BloodGlucoList1.add(bgu3);
////			ma1.setBloodGlucoList(BloodGlucoList1);
//			
//			
//			
////			setHSObj(1, "C00038000000044", ma);
////			
////			//医生   王征云   D00038000000043
////			
////			MonitorAbnormal readObject = (MonitorAbnormal) getHSObj(1, "C00038000000042");//丁峰
////			
//	//		MonitorAbnormal readObject1 = (MonitorAbnormal) getHSObj(1, "C00038000000044");//刘玉建
//			
////			
////			ArrayList<MonitorAbnormal> MAL = new ArrayList<MonitorAbnormal>();
////			MAL.add(ma);
////			MAL.add(ma1);
////			
////			
////			setHSObj(1, "D00038000000043", MAL);
////			
////			
////			
////			//医生   王征云   D00038000000043
////			ArrayList<MonitorAbnormal> readObject = (ArrayList<MonitorAbnormal>)getHSObj(1, "D00038000000043");
////			
////			System.out.println(" read object \t" + readObject.size());
////			
////			System.out.println(" read object \t" + readObject1.getUsername());
////			System.out.println(" read object \t" + readObject1.getBloodPressList().size());
//			
//		//clearDB(1);
//			
//		
//		
//		//DateFormat.parse(String s).
//
////		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
////		
////			User user = new User();
////			user.setBirthday(format.parse("1986-06-06 12:00:00"));
////			user.setUserid("C00038000000043");
////			user.setUsername("王征云");
////			user.setSex(1);
////			Role r = new Role();
////			r.setId(21);
////			r.setName("305健康管理师");
////			Set<Role> roles = new HashSet<Role>();
////			roles.add(r);
////			user.setRoles(roles);
//////			
//////			
////			setHSObj(0, "C00038000000043", user);  //D00038000000043
//			
//			//clearDB(0);
//			
//			User user = (User) getHSObj(0, "C00048000000061");//丁峰
//			//user.setPersonalNumber(867);
//			//RedisManager.setHSObj(0, "C00038000000042", user);
//			System.out.println("user"+user.getUsername()+"  "+ user.getHeight());
//			
//			MonitorAbnormal readObject = (MonitorAbnormal)RedisManager.getHSObj(1, "C00038000000044");
//			System.out.println("readObject"+readObject.getUsername()+" "+readObject.getBloodGlucoList().size());
////			readObject.setUsername("丁峰");
////			RedisManager.setHSObj(1, "C00038000000042", readObject);
//			
////			list = (List<User>) getHSObj(1, "userlist");
////			
////			for (User u : list) {
////				System.out.println(u);
////			}
//
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println("over!!!!");
//
//	}
//
//}
