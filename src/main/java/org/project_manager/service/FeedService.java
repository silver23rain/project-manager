package org.project_manager.service;

import org.project_manager.domain.FeedDTO;
import org.project_manager.persistence.FeedDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Service
public class FeedService {
	@Inject
	FeedDAO feedDAO;

	public void insertFeed(FeedDTO feedDTO) throws Exception {
		feedDAO.insertFeed(feedDTO);
	}

	public List<HashMap<String, Object>> getFeedList (String user_id){
		return feedDAO.getFeedList(user_id);
	}
}
