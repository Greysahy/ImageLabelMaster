package pojo;

public class Image {
    int imageId;
    int taskId;
    String imagePath;
    String label = null;

    String label1 = null;
    String label2 = null;
    String label3 = null;
    String label4 = null;
    String label5 = null;
    String label6 = null;
    String label7 = null;


    public Image(int imageId, int taskId, String imagePath, String label1,String label2,String label3,String label4,String label5,String label6,String label7) {
        this.imageId = imageId;
        this.taskId = taskId;
        this.imagePath = imagePath;
        this.label1 = label1;
        this.label2 = label2;
        this.label3 = label3;
        this.label4 = label4;
        this.label5 = label5;
        this.label6 = label6;
        this.label7 = label7;

    }

    public Image(int imageId, int taskId, String imagePath, String label) {
        this.imageId = imageId;
        this.taskId = taskId;
        this.imagePath = imagePath;
        this.label = label;
    }



    public Image(int imageId, int taskId, String imagePath) {
        this.imageId = imageId;
        this.taskId = taskId;
        this.imagePath = imagePath;
    }

    public Image(int taskId, String imagePath) {
        this.taskId = taskId;
        this.imagePath = imagePath;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getLabel() {
        return label;
    }
    public String getLabel1() {
        return label1;
    }
    public String getLabel2() {
        return label2;
    }
    public String getLabel3() {
        return label3;
    }
    public String getLabel4() {
        return label4;
    }
    public String getLabel5() {
        return label5;
    }
    public String getLabel6() {
        return label6;
    }
    public String getLabel7() {
        return label7;
    }


    public void setLabel(String label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageId=" + imageId +
                ", taskId=" + taskId +
                ", imagePath='" + imagePath + '\'' +
                ", label='" + label + '\'' +
                '}';
    }
}
