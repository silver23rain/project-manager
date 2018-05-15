package org.project_manager.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project_manager.domain.UserDTO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class UserDAO {

	@Inject
	private SqlSession sqlSession ;
	private static final String namespace= "org.project_manager.UserMapper";

	public List<UserDTO> getUserList(){
		return sqlSession.selectList(namespace+".getUserList");
	}

	public UserDTO checkUser(UserDTO userDTO){
		return sqlSession.selectOne(namespace +".checkUser",userDTO);
	}

	public List<HashMap<String, Object>> getProjectUsers (int project_id) {
		return sqlSession.selectList(namespace+".getProjectUsers", project_id);
	}

	public List<UserDTO> searchUser (HashMap<String,Object> searchMap){
		return sqlSession.selectList(namespace+".searchUser", searchMap);
	}

}
