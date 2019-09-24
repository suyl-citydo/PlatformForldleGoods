package utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: suyl
 * @Date: 2019/4/2 16:08
 * @Descritpion: 生成当前时间
 */
public class TimeUtils {
    public static String getTime(){
        Date date=new Date();
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(date.getTime());
    }
}
