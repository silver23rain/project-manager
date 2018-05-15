package org.project_manager.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project_manager.domain.FeedDTO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class FeedDAO {
	@Inject
	SqlSession sqlSession;
	private static final String namespace = "org.project_manager.FeedMapper";

	public void insertFeed(FeedDTO feedDTO)throws Exception{
		sqlSession.insert(namespace +".addFeed",feedDTO);
	}

	public List<HashMap<String, Object>> getFeedList (String user_id){
		return sqlSession.selectList(namespace +".getFeedList" ,user_id);
	}
}

