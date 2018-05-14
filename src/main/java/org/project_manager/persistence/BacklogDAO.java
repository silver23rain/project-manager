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

    public List<HashMap<String, Object>> getBackLogList (HashMap<String,Object> hashMap){
        return sqlSession.selectList(namespace+".getBackLogList",hashMap);
    }

    public void updateBacklog(BacklogDTO backlogDTO) throws Exception{
        sqlSession.update(namespace+".updateBacklog",backlogDTO);
    }

    public List<HashMap<String,Object>> includeSprintBacklogList (int project_id) {
        return sqlSession.selectList(namespace + ".includeSprintBacklogList", project_id);
    }

    public List<HashMap<Integer,String>> getBacklogStatus (){
        return sqlSession.selectList(namespace+".getBacklogStatus");
    }

    public void updateStatus(BacklogDTO backlogDTO){
        sqlSession.update(namespace+".updateStatus", backlogDTO);
    }

    public HashMap<String, Object> getBacklogDetail(HashMap<String,Object> hashMap){
        return sqlSession.selectOne(namespace+".backlogDetail",hashMap);
    }
}
