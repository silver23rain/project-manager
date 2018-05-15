package org.project_manager.service;

import org.project_manager.domain.UserDTO;
import org.project_manager.persistence.UserDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Service
public class UserService {
	@Inject
	UserDAO userDAO;

	public UserDTO checkUser(UserDTO dto){
		return userDAO.checkUser(dto);
	}

	public List<HashMap<String, Object>> getProjectUsers(int project_id){
		return userDAO.getProjectUsers(project_id);
	}

	public List<UserDTO> searchUser (HashMap<String,Object> searchMap) {
		return userDAO.searchUser(searchMap);
	}
}
