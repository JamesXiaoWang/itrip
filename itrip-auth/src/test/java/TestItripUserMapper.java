import cn.itrip.auth.service.UserService;
import cn.itrip.auth.service.UserServiceImpl;
import cn.itrip.beans.pojo.ItripUser;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Author: WangJiaPeng
 * @Date: 2018/12/5 10:38
 * @Version 1.0
 */
public class TestItripUserMapper {
  /* @Test
    public void getRegister() throws Exception{
        UserService service = new UserServiceImpl();
        ApplicationContext ctx=new
                ClassPathXmlApplicationContext("applicationContext.xml");

        UserService userService= (UserService) ctx.getBean("useService");
        ItripUser itripUser = new ItripUser();
        itripUser.setUserCode("aaa2@qq.com");
        itripUser.setUserName("bbbb");
        itripUser.setUserPassword("123123123");
        itripUser.setUserType(0);
        userService.itriptxCreateUser(itripUser);
    }*/
}
