import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * @Author: WangJiaPeng
 * @Date: 2018/12/25 10:14
 * @Version 1.0
 */
public class TestJedisPool {
    public static void main(String[] args) {
        JedisPool jedisPool = JedisPoolUtil.getJedisPoolInstance();
        Jedis jedis = null;

        try {
            jedis = jedisPool.getResource();
            jedis.set("k18","v183");
            String result =  jedis.get("k18");
            System.out.println(result);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JedisPoolUtil.release(jedisPool,jedis);
        }
    }
}
