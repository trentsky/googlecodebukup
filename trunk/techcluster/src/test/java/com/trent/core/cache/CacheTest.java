package com.trent.core.cache;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.MemcachedClientBuilder;
import net.rubyeye.xmemcached.XMemcachedClientBuilder;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.rubyeye.xmemcached.utils.AddrUtil;

import org.junit.Test;

public class CacheTest {
	
	@Test
	public void testXmemcached(){
		MemcachedClientBuilder builder = new XMemcachedClientBuilder(AddrUtil
				.getAddresses("localhost:11211"));
		MemcachedClient memcachedClient;
		try {
			memcachedClient = builder.build();
			memcachedClient.set("hello", 0, "Hello,xmemcached");
			String value = memcachedClient.get("hello");
			System.out.println("hello=" + value);
			memcachedClient.delete("hello");
			value = memcachedClient.get("hello");
			System.out.println("hello=" + value);
			
			memcachedClient.shutdown();
		} catch (MemcachedException e) {
			System.err.println("MemcachedClient operation fail");
			e.printStackTrace();
		} catch (TimeoutException e) {
			System.err.println("MemcachedClient operation timeout");
			e.printStackTrace();
		} catch (InterruptedException e) { 
			// ignore
		} catch (IOException e) { 
			// ignore
		}
	}
}
