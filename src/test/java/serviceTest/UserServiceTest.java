package serviceTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project_manager.domain.UserDTO;
import org.project_manager.service.UserService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class UserServiceTest {

	@Inject
	UserService userService;

	@Test
	public void checkUserTest(){
		UserDTO loginUser = new UserDTO();
		loginUser.setUser_id("eunbi");
		loginUser.setUser_password("eunbi1234");
		UserDTO userDTO = userService.checkUser(loginUser);

		if(userDTO != null){
			System.out.println("loginUser : " + userDTO.toString());
		}else{
			System.out.println("해당사용자가 없습니다.");
		}
	}
}
