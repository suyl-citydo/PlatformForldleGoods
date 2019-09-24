package service.impl;

import domain.Commodity;
import mapper.AddCommodityMapper;
import org.springframework.stereotype.Service;
import service.AddCommodityService;

import javax.annotation.Resource;

@Service(value = "addCommodityService")
public class AddCommodityServiceImpl implements AddCommodityService {

    @Resource
    private AddCommodityMapper addCommodityMapper;
    @Override
    public int addCommodity(Commodity commodity) {
        return addCommodityMapper.addCommodity(commodity);
    }

}
