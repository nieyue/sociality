package com.nieyue.util;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


/**
 * HashMap单例
 * @author 聂跃
 * @date 2018年3月9日
 */
public class SingletonHashMap {
	
    private SingletonHashMap() {}

    private static class SingletonInstance {
        private static final Map<String,Object> INSTANCE = new ConcurrentHashMap<String,Object>();
    }

    public static Map<String,Object> getInstance() {
        return SingletonInstance.INSTANCE;
    }
    
    public static void main(String[] args) {
		Map<String,Object> a=  SingletonHashMap.getInstance();
		Map<String,Object> b=  SingletonHashMap.getInstance();
		a.put("accountId"+1000, 1000);
		b.put("accountId"+1000, 1000);
		b.put("accountId"+1001, 1001);
		b.put("accountId"+1002, "");
		b.put("accountId"+1003, null);
		System.out.println(a.get("accountId"+1003));
		System.out.println(a);
		System.out.println(b);
		System.out.println(a==b);
		System.out.println(a.equals(b));
	}
}