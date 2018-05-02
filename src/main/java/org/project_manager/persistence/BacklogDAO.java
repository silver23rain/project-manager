package org.project_manager.persistence;

import org.apache.ibatis.session.SqlSession;
import org.project_manager.domain.BacklogDTO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Repository
public class BacklogDAO {
    @Inject
    SqlSession sqlSession;
    private static final String namespace = "org.project_manager.BackLogMapper";

    public Integer getMaxBacklogNo(int project_id){
        return sqlSession.selectOne(namespace +".getMaxBacklogNo",project_id);
    }

    public void createBacklog (BacklogDTO backlogDTO){
        sqlSession.insert(namespace+".createBacklog",backlogDTO);
    }

    public List<HashMap<String, Object>> getBackLogList (int project_id){
        return sqlSession.selectList(namespace+".getBackLogList",project_id);
    }

    public void includeSprint(HashMap<String,Object> sprintMap) throws Exception{
        sqlSession.update(namespace+".includeSprint",sprintMap);
    }

}
