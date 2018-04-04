package org.project_manager.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class ProjectDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace= "org.project_manager.ProjectMapper";


}
