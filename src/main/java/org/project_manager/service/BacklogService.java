package org.project_manager.service;

import org.project_manager.domain.BacklogDTO;
import org.project_manager.domain.UserDTO;
import org.project_manager.persistence.BacklogDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Service
public class BacklogService {
	@Inject
	BacklogDAO backLogDAO;

	@Inject
	AuthorityService authorityService;

	public List<HashMap<String, Object>> getBackLogList(HttpServletRequest request, Integer project_id) {
		UserDTO userDTO = authorityService.getUser(request);
		HashMap<String, Object> hashMap = new HashMap<>();
		if(project_id == null) {
			hashMap.put("user_id", userDTO.getUser_id());
		}else{
			hashMap.put("project_id", project_id);
		}

		return backLogDAO.getBackLogList(hashMap);
	}

	public void createBacklog(BacklogDTO backlogDTO) throws Exception {
		Integer maxBacklogNo = backLogDAO.getMaxBacklogNo(backlogDTO.getProject_id());
		if(maxBacklogNo == null) {
			backlogDTO.setBl_no(1);
		} else {
			backlogDTO.setBl_no(maxBacklogNo + 1);
		}
		backLogDAO.createBacklog(backlogDTO);

	}

	public void updateBacklog(BacklogDTO backlogDTO) throws Exception {
		backLogDAO.updateBacklog(backlogDTO);
	}

	public List<HashMap<String, Object>> includeSprintBacklogList(int project_id) {
		return backLogDAO.includeSprintBacklogList(project_id);
	}

	public List<HashMap<Integer, String>> getBacklogStatus() {
		return backLogDAO.getBacklogStatus();
	}

	public void updateStatus(BacklogDTO backlogDTO) {
		backlogDTO.setStatus_id(1);
		backLogDAO.updateStatus(backlogDTO);
	}

	public HashMap<String, Object> getBacklogDetail(Integer project_id, Integer bl_no) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("project_id", project_id);
		hashMap.put("bl_no", bl_no);
		return backLogDAO.getBacklogDetail(hashMap);
	}

}
