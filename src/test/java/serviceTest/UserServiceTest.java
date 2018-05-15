package serviceTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project_manager.domain.UserDTO;
import org.project_manager.service.UserService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class UserServiceTest {

	@Inject
	UserService userService;

	@Test
	public void checkUserTest() {
		UserDTO loginUser = new UserDTO();
		loginUser.setUser_id("eunbi");
		loginUser.setUser_password("eunbi1234");
		UserDTO userDTO = userService.checkUser(loginUser);

		if(userDTO != null) {
			System.out.println("loginUser : " + userDTO.toString());
		} else {
			System.out.println("해당사용자가 없습니다.");
		}
	}

	@Test
	public void getTime() {
		System.out.println(new Date().toGMTString());
		System.out.println(new Date().getTimezoneOffset());

		java.util.TimeZone tz = java.util.TimeZone.getDefault();
		System.out.println("Timezone offset from UTC reported as " +
				(tz.getRawOffset() / 1000 / 60) + " minutes");
		if(tz.getRawOffset() % (15 * 60 * 1000) != 0) {
			System.out.println("Warning: not a multiple of quarter-hours");
		}
		System.out.println(new java.util.Date());
		System.out.println(tz);

		TimeZone tz2;
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss (z Z)");

		System.out.println();
		tz2 = TimeZone.getTimeZone("Asia/Seoul");
		df.setTimeZone(tz2);
		System.out.format("%s%n%s%n%n", tz2.getDisplayName(), df.format(date));
	}
}
