package kr.spring.study.studygroup.service;

import kr.spring.study.studygroup.dao.StudyGroupMapper;
import kr.spring.study.studygroup.dao.StudyUserMapper;
import kr.spring.study.studygroup.vo.StudyGroupVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class StudyGroupServiceImpl implements StudyGroupService{

    @Autowired
    private StudyGroupMapper studyGroupMapper;

    @Autowired
    private StudyUserMapper studyUserMapper;

    @Override
    public int selectStudy_num() {
        return studyGroupMapper.selectStudy_num();
    }

    @Override
    public List<StudyGroupVO> selectAllStudyGroups(Map<String, Object> map) {
        return studyGroupMapper.selectAllStudyGroups(map);
    }

    @Override
    public void insertStudyGroup(StudyGroupVO studyGroup) {
        studyGroup.setStudy_num(studyGroupMapper.selectStudy_num());
        studyGroupMapper.insertStudyGroup(studyGroup);
        studyGroupMapper.insertStudyUser(studyGroup);
    }

    @Override
    public void updateStudyGroup(StudyGroupVO studyGroup) {
        studyGroupMapper.updateStudyGroup(studyGroup);
    }

    @Override
    public void deleteStudyGroup(Integer study_num) {
        studyGroupMapper.deleteStudyGroup(study_num);
    }

    @Override
    public int selectRowCount(Map<String, Object> map) {
        return studyGroupMapper.selectRowCount(map);
    }

    @Override
    public StudyGroupVO selectStudyGroup(Integer study_num) {
        return studyGroupMapper.selectStudyGroup(study_num);
    }
}
