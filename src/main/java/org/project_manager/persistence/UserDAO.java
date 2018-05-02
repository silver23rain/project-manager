package org.project_manager.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project_manager.domain.UserDTO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
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
}
