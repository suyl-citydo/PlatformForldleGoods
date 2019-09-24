package service.impl;

import domain.Commodity;
import domain.PageBean;
import mapper.AdminMapper;
import mapper.OperateMapper;
import mapper.SearCommodityMapper;
import org.springframework.stereotype.Service;
import service.SearCommodityService;
import utils.SetPageUtils;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(value = "searCommodityService")
public class SearCommodityServiceImpl implements SearCommodityService {
    @Resource
    private SearCommodityMapper searCommodityMapper;
    @Resource
    private AdminMapper adminMapper;
    @Resource
    private OperateMapper operateMapper;


    @Override
    public List<Commodity> findByConPage(Integer cprice, Integer isCollection, String startTime, String endTime) {
        return searCommodityMapper.findByConPage(cprice,isCollection,startTime,endTime);
    }

    @Override
    public List<Commodity> searchCommodity(String title) {
        return searCommodityMapper.searchCommodity(title);
    }

    @Override
    public PageBean<Commodity> findSmallCommodity(int pageCode, int pageSize, Map<String, Object> conMap, String smallType) {
        PageBean<Commodity> pageBean = new PageBean<Commodity>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper,searCommodityMapper,pageCode, pageSize, conMap,4,smallType);
        List<Commodity>  commodityList= searCommodityMapper.findSmallCommodity(setPage);
        pageBean.setBeanList(commodityList);
        return pageBean;
    }

    @Override
    public PageBean<Commodity> findBigCommodity(int pageCode, int pageSize, Map<String, Object> conMap, String bigType) {
        PageBean<Commodity> pageBean = new PageBean<Commodity>();
        Map<String,Object> setPage = SetPageUtils.setPage(pageBean, adminMapper,operateMapper,searCommodityMapper,pageCode, pageSize, conMap,5,bigType);
        List<Commodity>  commodityList= searCommodityMapper.findBigCommodity(setPage);
        pageBean.setBeanList(commodityList);
        return pageBean;
    }
}
