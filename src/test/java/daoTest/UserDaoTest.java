package daoTest;

import com.sun.org.apache.xpath.internal.SourceTree;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.project_manager.domain.UserDTO;
import org.project_manager.persistence.UserDAO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import javax.jws.soap.SOAPBinding;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class UserDaoTest {

	@Inject
	UserDAO userDAO;

	@Test
	public void getUserList(){
		List<UserDTO> userDTOList = userDAO.getUserList();

		System.out.println("==========================================");
		for (UserDTO dto: userDTOList) {
			System.out.println(dto);
		}
		System.out.println("==========================================");
	}

	@Test
	public void checkUserTest(){
		UserDTO loginUser = new UserDTO();
		loginUser.setUser_id("eunbi");
		loginUser.setUser_password("eunbi1234");
		UserDTO userDTO = userDAO.checkUser(loginUser);

		if(userDTO != null){
			System.out.println("loginUser : " + userDTO.toString());
		}else{
			System.out.println("해당사용자가 없습니다.");
		}
	}
}
