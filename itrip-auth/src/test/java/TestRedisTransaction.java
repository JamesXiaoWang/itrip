import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

/**
 * @Author: WangJiaPeng
 * @Date: 2018/12/23 16:39
 * @Version 1.0
 */
public class TestRedisTransaction {
    public boolean transMethod() throws InterruptedException {
        Jedis jedis = new Jedis("127.0.0.1",6379);
        int balance;//可用余额
        int debt;//欠额
        int amtToSubtract = 10;//实刷额度

        jedis.watch("balance");
        Thread.sleep(7000);
        balance = Integer.parseInt(jedis.get("balance"));
        if (balance < amtToSubtract){
            jedis.unwatch();
            System.out.println("modify");
            return  false;
        }else{
            System.out.println("*****************transaction");
            Transaction transaction = jedis.multi();
            transaction.decrBy("balance",amtToSubtract);
            transaction.incrBy("debt",amtToSubtract);
            transaction.exec();
            balance = Integer.parseInt(jedis.get("balance"));
            debt = Integer.parseInt(jedis.get("debt"));

            System.out.println("**********" + balance);
            System.out.println("**********" + debt);
            return  true;
        }
    }

    public static void main(String[] args) throws InterruptedException {
        TestRedisTransaction testRedisTransaction = new TestRedisTransaction();
        boolean retValue = testRedisTransaction.transMethod();
        System.out.println("main retValue---------------" + retValue);
    }
}
