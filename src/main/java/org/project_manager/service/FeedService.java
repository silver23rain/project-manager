package org.project_manager.service;

import org.project_manager.domain.FeedDTO;
import org.project_manager.persistence.FeedDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class FeedService {
	@Inject
	FeedDAO feedDAO;

	public void insertFeed(FeedDTO feedDTO) throws Exception {
		feedDAO.insertFeed(feedDTO);
	}
}
