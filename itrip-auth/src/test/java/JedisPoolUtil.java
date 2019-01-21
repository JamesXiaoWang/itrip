import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @Author: WangJiaPeng
 * @Date: 2018/12/25 9:39
 * @Version 1.0
 */
public class JedisPoolUtil {
    private static volatile JedisPool jedisPool = null;//被volatile修饰的变量不会被本地线程缓存，对该变量的读写都是直接操作共享内存。

    private JedisPoolUtil(){}

    public static JedisPool getJedisPoolInstance()
    {
        if (null == jedisPool){
            if (null == jedisPool)
            {
                synchronized (JedisPoolUtil.class) {
                    JedisPoolConfig poolConfig = new JedisPoolConfig();
                    poolConfig.setMaxActive(1000);  //最大活跃
                    poolConfig.setMaxIdle(32);      //最大空闲
                    poolConfig.setMaxWait(100 * 1000);//设置最大等待时间
                    poolConfig.setTestOnBorrow(true);

                    jedisPool = new JedisPool(poolConfig, "127.0.0.1");
                }
            }
        }
        return jedisPool;
    }

    public static void release(JedisPool jedisPool, Jedis jedis)
    {
        if (null != jedis)
        {
            jedisPool.returnResourceObject(jedis);
        }
    }
}
