package singleton;

/**
 * @Author: WangJiaPeng
 * @Date: 2018/12/26 17:11
 * @Version 1.0
 */
public class Singleton {
    private final static Singleton INSTANCE = new Singleton();

    private Singleton(){}

    public static Singleton getInstance(){
        return INSTANCE;
    }
}
