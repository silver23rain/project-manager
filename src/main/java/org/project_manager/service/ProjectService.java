package org.project_manager.service;

import org.apache.commons.lang3.RandomStringUtils;
import org.project_manager.domain.ProjectDTO;
import org.project_manager.domain.ProjectUserDTO;
import org.project_manager.domain.ResultCode;
import org.project_manager.domain.UserDTO;
import org.project_manager.persistence.ProjectDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Service
public class ProjectService {
	@Inject
	ProjectDAO projectDAO;

	@Transactional
	public ResultCode createProject(String project_name, UserDTO userDTO) throws Exception {
		ProjectDTO projectDTO = new ProjectDTO();
		if (!checkDuplicatedProjectName(project_name, userDTO.getUser_id())) {
			return ResultCode.DUPLICATED_NAME;
		}
		String project_key = project_name.substring(0, project_name.length() < 4 ? project_name.length() : 4).toUpperCase();

		while (!checkDuplicatedProjectKey(project_key, userDTO.getUser_id())) {
			project_key = RandomStringUtils.randomAlphabetic(project_name.length() < 4 ? project_name.length() : 4).toUpperCase();
		}
		projectDTO.setProject_name(project_name);
		projectDTO.setProject_key(project_key);

		projectDAO.createProject(projectDTO);
		insertProjectUser(projectDTO.getProject_id(), userDTO);

		//TODO : project_key 생성

		return ResultCode.SUCCESS;
	}

	private void insertProjectUser(Integer projectId, UserDTO userDTO) throws Exception {
		if (projectId != null) {
			ProjectUserDTO projectUserDTO = new ProjectUserDTO();
			projectUserDTO.setProject_id(projectId);
			projectUserDTO.setUser_id(userDTO.getUser_id());
			projectUserDTO.setProject_position("팀장");
			projectUserDTO.setAuthority("관리자");

			projectDAO.insertProjectUser(projectUserDTO);
		}
	}

	public boolean checkDuplicatedProjectName(String project_name, String user_id) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("project_name", project_name);
		hashMap.put("user_id", user_id);

		if (projectDAO.checkDuplicatedProjectName(hashMap) == 0) {
			return true;
		}
		return false;
	}

	public boolean checkDuplicatedProjectKey(String project_key, String user_id) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("project_key", project_key);
		hashMap.put("user_id", user_id);

		if (projectDAO.checkDuplicatedProjectKey(hashMap) == 0) {
			return true;
		}
		return false;
	}

	public List<HashMap<String,Object>> getProjectList(String user_id){
		return projectDAO.getProjectList(user_id);
	}

}
