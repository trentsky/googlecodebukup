package com.trent.core.cache;

import java.util.concurrent.TimeoutException;

import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemCachedCacheService implements CacheService {

	@Autowired
	MemcachedClient memcachedClient;

	/* (non-Javadoc)
	 * @see com.trent.core.cache.CacheService#set(java.lang.String, T)
	 */
	@Override
	public <T> void  set(String key, T t) {
		try {
			memcachedClient.set(key, 0, t);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
	}

	/* (non-Javadoc)
	 * @see com.trent.core.cache.CacheService#set(java.lang.String, java.lang.Integer, T)
	 */
	@Override
	public <T> void set(String key, Integer exp, T t) {
		if (exp == null) {
			exp = 0;
		}
		try {
			memcachedClient.set(key, exp, t);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
	}

	/* (non-Javadoc)
	 * @see com.trent.core.cache.CacheService#get(java.lang.String)
	 */
	@Override
	public <T> T get(String key) {
		T t = null;
		try {
			t = memcachedClient.get(key);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
		return t;
	}

	/* (non-Javadoc)
	 * @see com.trent.core.cache.CacheService#checkToSet(java.lang.String, T)
	 */
	@Override
	public <T> void checkToSet(String key, T t) {
		T temp = null;
		try {
			temp = memcachedClient.get(key);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
		if (temp == null) {
			set(key, t);
		}
	}

	/* (non-Javadoc)
	 * @see com.trent.core.cache.CacheService#delete(java.lang.String)
	 */
	@Override
	public void delete(String key) {
		try {
			memcachedClient.deleteWithNoReply(key);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
	}

	/* (non-Javadoc)
	 * @see com.trent.core.cache.CacheService#flushAll()
	 */
	@Override
	public void flushAll() {
		try {
			memcachedClient.flushAll();
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
	}
}
