package web.AdminRelated;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ImageScanner {

    // 获取目录中的图片文件名
    public static List<String> getImagesInDirectory(String directoryPath) {
        List<String> imageFiles = new ArrayList<>();
        File directory = new File(directoryPath);
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile() && isImageFile(file.getName())) {
                    imageFiles.add(file.getName());
                }
            }
        }
        return imageFiles;
    }

    // 判断文件是否是图片文件
    public static boolean isImageFile(String fileName) {
        String[] imageExtensions = {".jpg", ".jpeg", ".png", ".gif", ".bmp"}; // 常见的图片格式
        for (String extension : imageExtensions) {
            if (fileName.toLowerCase().endsWith(extension)) {
                return true;
            }
        }
        return false;
    }

}
