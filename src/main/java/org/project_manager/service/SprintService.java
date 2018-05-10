package org.project_manager.service;

import org.project_manager.domain.SprintDTO;
import org.project_manager.persistence.BacklogDAO;
import org.project_manager.persistence.ProjectDAO;
import org.project_manager.persistence.SprintDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.*;

@Service
public class SprintService {
	@Inject
	SprintDAO sprintDAO;
	@Inject
	ProjectDAO projectDAO;
	@Inject
	BacklogDAO backlogDAO;

	public HashMap<String, Object> getNewSprintTitle(int project_id) {
		HashMap<String, Object> sprintMap;
		sprintMap = sprintDAO.getNewSprintTitle(project_id);
		if(sprintMap == null) {
			sprintMap = new HashMap<>();
			GregorianCalendar gregorianCalendar = new GregorianCalendar();
			sprintMap.put("sprint_no", 1);
			sprintMap.put("sprint_year", gregorianCalendar.get(Calendar.YEAR));
		}
		sprintMap.put("project_name", projectDAO.getProjectName(project_id));
		return sprintMap;
	}

	public void createSprint(SprintDTO sprintDTO) throws Exception {
		sprintDAO.createSprint(sprintDTO);
	}

	public List<HashMap<String, Object>> getSrintNameList(int project_id) {
		List<HashMap<String, Object>> sprintList = sprintDAO.getSprintNameList(project_id);
		return sprintList;
	}

	public void openSprint (SprintDTO sprintDTO){
		sprintDTO.setSprint_status("OPEN");
		sprintDAO.updateSprint(sprintDTO);
	}

	public HashMap<String, Object> getOpenedSprintData (int project_id){
		return sprintDAO.getOpenedSprintData(project_id);
	}
}
