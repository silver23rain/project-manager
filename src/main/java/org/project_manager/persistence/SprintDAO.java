package org.project_manager.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project_manager.domain.SprintDTO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class SprintDAO {
	@Inject
	private SqlSession sqlSession ;
	private static final String namespace= "org.project_manager.SprintMapper";

	public HashMap<String, Object> getNewSprintTitle(int project_id){
		return sqlSession.selectOne(namespace+".getNewSprintTitle",project_id);
	}

	public void createSprint(SprintDTO sprintDTO) throws Exception{
		sqlSession.insert(namespace+".createSprint", sprintDTO);
	}

	public List<HashMap<String,Object>> getSprintNameList(int project_id){
		return sqlSession.selectList(namespace+".getSprintNameList",project_id);
	}

	public void updateSprint (SprintDTO sprintDTO){
		sqlSession.update(namespace +".updateSprint" ,sprintDTO);
	}
}
