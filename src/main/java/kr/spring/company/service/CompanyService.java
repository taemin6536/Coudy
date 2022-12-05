package kr.spring.company.service;

import kr.spring.company.vo.*;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    public List<CompanyVO> selectList(Map<String,Object> map);
    public int selectListCount();

    public void insertCompany(CompanyVO companyVO);
    public CompanyVO selectCompany(Integer com_num);
    public void updateHit(Integer com_num);

    void insertScrap(CompanyScrapVO companyScrapVO);
    Integer selectScrapCount(Integer com_num,Integer mem_num);
    public void deleteScrap(Integer scrap_num);

    CompanyScrapVO selectScrap(Integer com_num, Integer mem_num);

    public void insertResume(CompanyResumeVO companyResumeVO);
    public CompanyResumeVO selectResume(Integer resume_num);
    public List<CompanyResumeVO> resumeList(Integer mem_num);
    public List<MyResumeDTO> myResumeList(Integer mem_num);
    public List<MyScrapDTO> selectMyScrap(Integer mem_num);
}
