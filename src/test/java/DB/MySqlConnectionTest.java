package DB;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import javax.sql.DataSource;
import java.sql.Connection;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml" })
public class MySqlConnectionTest {

	@Inject
	private DataSource dataSource;

	@Test
	public void testConnection() throws Exception {
		try (Connection con = dataSource.getConnection()){
			System.out.println("-----------------------------------");
			System.out.println("Connection : " + con);
			System.out.println("----------------------------------");
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
