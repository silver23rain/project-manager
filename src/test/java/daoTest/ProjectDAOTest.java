package daoTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.project_manager.domain.ProjectDTO;
import org.project_manager.domain.ProjectUserDTO;
import org.project_manager.persistence.ProjectDAO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class ProjectDAOTest {

	@Inject
	ProjectDAO projectDAO;

	@Test
	public void checkDuplicatedProjectNameTest(){
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("user_id","eunbi");
		hashMap.put("project_name","test");

		int cnt = projectDAO.checkDuplicatedProjectName(hashMap);
		System.out.println(cnt);
	}

	@Test
	public void checkDuplicatedProjectKEYTest(){
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("user_id","test1");
		hashMap.put("project_key","TEST");

		int cnt = projectDAO.checkDuplicatedProjectKey(hashMap);
		System.out.println(cnt);
	}

	@Test
	public void getProjectListTest(){
		List<HashMap<String, Object>> list = projectDAO.getProjectList("test1");
		for (HashMap<String,Object> hashMap : list) {
			System.out.println(hashMap);
		}
	}

}
