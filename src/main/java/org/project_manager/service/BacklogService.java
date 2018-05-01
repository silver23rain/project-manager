package org.project_manager.service;

import org.project_manager.domain.BacklogDTO;
import org.project_manager.persistence.BacklogDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Service
public class BacklogService {
    @Inject
    BacklogDAO backLogDAO;

    public List<HashMap<String, Object>> getBackLogList(int project_id) {
        return backLogDAO.getBackLogList(project_id);
    }

    public void createBacklog(BacklogDTO backlogDTO) throws Exception {
        Integer maxBacklogNo = backLogDAO.getMaxBacklogNo(backlogDTO.getProject_id());
        if (maxBacklogNo == null) {
            backlogDTO.setBl_no(1);
        } else {
            backlogDTO.setBl_no(maxBacklogNo + 1);
        }
        backLogDAO.createBacklog(backlogDTO);

    }

}
