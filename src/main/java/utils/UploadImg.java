package utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Author: suyl
 * @Date: 2019/4/1 16:53
 * @Descritpion: 图片上传
 */
public class UploadImg {
    public static String uploadImg(MultipartFile file, HttpServletRequest request,String newName){
        String desFilePath = "";
        String oriName = "";
        // 1.获取原文件名
        oriName = file.getOriginalFilename();
        // 2.获取原文件图片后缀，以最后的.作为截取(.jpg)
        if(oriName==null){
            request.setAttribute("msg","请添加图片");
        } else {
            String extName = oriName.substring(oriName.lastIndexOf("."));
            // 3.生成自定义的新文件名，这里以UUID.jpg|png|xxx作为格式（可选操作，也可以不自定义新文件名）
            newName = UUID.randomUUID().toString().replace("-","") + extName;
            // 4.获取要保存的路径文件夹
            String realPath =request.getSession().getServletContext().getRealPath("")+"res\\images\\";
            // 5.保存图片
            desFilePath = realPath + newName;
            File desFile = new File(desFilePath);
            try {
                file.transferTo(desFile);
            } catch (IOException | IllegalStateException e) {
                request.setAttribute("msg","图片上传失败");
                e.printStackTrace();
            }
        }
        return newName;
    }
}
