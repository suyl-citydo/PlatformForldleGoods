package mapper;

import domain.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface SearCommodityMapper {
    List<Commodity> findSmallCommodity(Map<String, Object> setPage);

    List<Commodity> findByConPage(@Param("cprice") Integer cprice,@Param("isCollection") Integer isCollection,@Param("startTime") String startTime,@Param("endTime") String endTime);

    List<Commodity> searchCommodity(String title);

    int smallCount(@Param("smallType") String type);

    List<Commodity> findBigCommodity(Map<String, Object> setPage);

    int bigCount(@Param("bigType") String type);
}
