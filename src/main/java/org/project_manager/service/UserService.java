package org.project_manager.service;

import org.project_manager.domain.UserDTO;
import org.project_manager.persistence.UserDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserService {
	@Inject
	UserDAO userDAO;

	public UserDTO checkUser(UserDTO dto){
		return userDAO.checkUser(dto);
	}
}
