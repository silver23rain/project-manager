package org.project_manager.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project_manager.domain.ProjectDTO;
import org.project_manager.domain.ProjectUserDTO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class ProjectDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "org.project_manager.ProjectMapper";

	public List<HashMap<String ,Object>> getProjectList(String user_id){
		return sqlSession.selectList(namespace+".getProjectList" , user_id);
	}

	public void createProject(ProjectDTO projectDTO) throws Exception {
		sqlSession.insert(namespace + ".createProject", projectDTO);
	}

	public void insertProjectUser(ProjectUserDTO projectUserDTO) throws Exception {
		sqlSession.insert(namespace + ".insertProjectUser", projectUserDTO);
	}

	public int checkDuplicatedProjectName(HashMap<String, Object> objectHashMap) {
		return sqlSession.selectOne(namespace + ".checkDuplicatedProjectName", objectHashMap);
	}

	public int checkDuplicatedProjectKey(HashMap<String, Object> objectHashMap) {
		return sqlSession.selectOne(namespace + ".checkDuplicatedProjectKEY", objectHashMap);
	}

}
