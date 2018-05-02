package org.project_manager.service;

import org.project_manager.domain.SprintDTO;
import org.project_manager.persistence.ProjectDAO;
import org.project_manager.persistence.SprintDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class SprintService {
	@Inject
	SprintDAO sprintDAO;
	@Inject
	ProjectDAO projectDAO;

	public HashMap<String, Object> getNewSprintTitle(int project_id) {
		HashMap<String, Object> sprintMap;
		sprintMap = sprintDAO.getNewSprintTitle(project_id);
		if(sprintMap == null) {
			sprintMap = new HashMap<>();
			GregorianCalendar gregorianCalendar = new GregorianCalendar();
			sprintMap.put("sprint_no", 1);
			sprintMap.put("sprint_year", gregorianCalendar.get(Calendar.YEAR));
		}
		Date dataYear = (Date) sprintMap.get("sprint_year");
		sprintMap.put("sprint_year",new SimpleDateFormat("yyyy").format(dataYear));
		sprintMap.put("project_name", projectDAO.getProjectName(project_id));
		return sprintMap;
	}

	public void createSprint (SprintDTO sprintDTO) throws Exception {
		sprintDAO.createSprint(sprintDTO);
	}

	public List<HashMap<String,Object>> getSprintList(int project_id){
		List<HashMap<String,Object>> sprintList = sprintDAO.getSprintList(project_id);
		for(HashMap <String,Object> hashMap:sprintList) {
			Date dataYear = (Date) hashMap.get("sprint_year");
			hashMap.put("sprint_year",new SimpleDateFormat("yyyy").format(dataYear));
		}
		return sprintList;
	}
}
