package daoTest;

import com.sun.org.apache.xpath.internal.SourceTree;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.project_manager.domain.UserDTO;
import org.project_manager.persistence.UserDAO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
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
}
