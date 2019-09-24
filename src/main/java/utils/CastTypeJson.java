package utils;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import java.util.List;

public class CastTypeJson {
    //将传入的商品小类list转换为josn数组返回
    public static JSONArray getSmallTypeJson(List<String> list){
        JsonConfig cfg = new JsonConfig();
        //防止json数据转换陷入死循环
        cfg.setJsonPropertyFilter(new PropertyFilter()
        {
            public boolean apply(Object source, String name, Object value) {
                switch (name) {
                    case "居家生活":
                        return true;
                    case "美食酒水":
                        return true;
                    case "鞋包服饰":
                        return true;
                    case "个护清洁":
                        return true;
                    case "运动旅行":
                        return true;
                    case "数码家电":
                        return true;
                    default:
                        return false;
                }
            }
        });
        return JSONArray.fromObject(list,cfg);
    }
}
