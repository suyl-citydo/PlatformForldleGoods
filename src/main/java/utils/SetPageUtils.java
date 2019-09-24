package utils;

import domain.PageBean;
import mapper.AdminMapper;
import mapper.OperateMapper;
import mapper.SearCommodityMapper;

import java.util.Map;

/**
 * @Author: suyl
 * @Date: 2019/4/17 21:02
 * @Descritpion: 封装分页
 */
public class SetPageUtils {
    public static Map<String,Object> setPage(PageBean pageBean, AdminMapper adminMapper, OperateMapper operateMapper, SearCommodityMapper searCommodityMapper,int pageCode, int pageSize, Map<String, Object> conMap, Integer flag,String type){
        //封装数据
        pageBean.setPageCode(pageCode);
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = 0;
        if(flag==0){
            totalCount=adminMapper.userCount();
        }else if(flag==1){
            totalCount=adminMapper.commodityCount();
        }else if(flag==2){
            totalCount=adminMapper.orderCount();
        }else if(flag==3){
            totalCount=operateMapper.commodityCount();
        }else if(flag==4&&!type.equals("")){
            totalCount=searCommodityMapper.smallCount(type);
            conMap.put("smallType",type);
        }else if(flag==5&&!type.equals("")){
            totalCount=searCommodityMapper.bigCount(type);
            conMap.put("bigType",type);
        }else if(flag==6){
            totalCount=adminMapper.userConCount(type);
        }else if(flag==7){
            totalCount=adminMapper.commodityConCount(type);
        }else if(flag==8){
            totalCount=adminMapper.orderConCount(type);
        }

        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        double num = Math.ceil(tc/pageSize);
        pageBean.setTotalPage((int) num);
        //设置limit起始位置和终止位置
        conMap.put("start",(pageCode - 1) * pageSize);
        conMap.put("size",pageBean.getPageSize());
        return conMap;
    }
}
