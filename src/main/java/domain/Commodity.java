package domain;

import java.util.Objects;

public class Commodity {
    private String id; //商品id
    private String email; //所属用户
    private String cname; //商品名称
    private Double cprice; //商品价格
    private int cnum;  //商品数量
    private String url;  //图片地址
    private String describes;  //商品描述
    private String bigType; //商品大类
    private String smallType;  //商品小类
    private int flag;  //是否删除,1删除，0没有
    private int isNew;  //是否新品
    private int isCollection;  //是否收藏
    private int isSellOut;  //是否卖出
    private int salesVolume;   //销量
    private String time;  //发布时间
    private Double remarks; //活动价

    public Commodity() {
    }

    public Commodity(String id, String email, String cname, Double cprice, int cnum, String url, String describes, String bigType, String smallType, int flag, int isNew, int isCollection, int isSellOut, int salesVolume, String time, Double remarks) {
        this.id = id;
        this.email = email;
        this.cname = cname;
        this.cprice = cprice;
        this.cnum = cnum;
        this.url = url;
        this.describes = describes;
        this.bigType = bigType;
        this.smallType = smallType;
        this.flag = flag;
        this.isNew = isNew;
        this.isCollection = isCollection;
        this.isSellOut = isSellOut;
        this.salesVolume = salesVolume;
        this.time = time;
        this.remarks = remarks;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public Double getCprice() {
        return cprice;
    }

    public void setCprice(Double cprice) {
        this.cprice = cprice;
    }

    public int getCnum() {
        return cnum;
    }

    public void setCnum(int cnum) {
        this.cnum = cnum;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getBigType() {
        return bigType;
    }

    public void setBigType(String bigType) {
        this.bigType = bigType;
    }

    public String getSmallType() {
        return smallType;
    }

    public void setSmallType(String smallType) {
        this.smallType = smallType;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public int getIsNew() {
        return isNew;
    }

    public void setIsNew(int isNew) {
        this.isNew = isNew;
    }

    public int getIsCollection() {
        return isCollection;
    }

    public void setIsCollection(int isCollection) {
        this.isCollection = isCollection;
    }

    public int getIsSellOut() {
        return isSellOut;
    }

    public void setIsSellOut(int isSellOut) {
        this.isSellOut = isSellOut;
    }

    public int getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(int salesVolume) {
        this.salesVolume = salesVolume;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Double getRemarks() {
        return remarks;
    }

    public void setRemarks(Double remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", cname='" + cname + '\'' +
                ", cprice=" + cprice +
                ", cnum=" + cnum +
                ", url='" + url + '\'' +
                ", describes='" + describes + '\'' +
                ", bigType='" + bigType + '\'' +
                ", smallType='" + smallType + '\'' +
                ", flag=" + flag +
                ", isNew=" + isNew +
                ", isCollection=" + isCollection +
                ", isSellOut=" + isSellOut +
                ", salesVolume=" + salesVolume +
                ", time='" + time + '\'' +
                ", remarks=" + remarks +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Commodity commodity = (Commodity) o;
        return cnum == commodity.cnum &&
                flag == commodity.flag &&
                isNew == commodity.isNew &&
                isCollection == commodity.isCollection &&
                isSellOut == commodity.isSellOut &&
                salesVolume == commodity.salesVolume &&
                Objects.equals(id, commodity.id) &&
                Objects.equals(email, commodity.email) &&
                Objects.equals(cname, commodity.cname) &&
                Objects.equals(cprice, commodity.cprice) &&
                Objects.equals(url, commodity.url) &&
                Objects.equals(describes, commodity.describes) &&
                Objects.equals(bigType, commodity.bigType) &&
                Objects.equals(smallType, commodity.smallType) &&
                Objects.equals(time, commodity.time) &&
                Objects.equals(remarks, commodity.remarks);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, cname, cprice, cnum, url, describes, bigType, smallType, flag, isNew, isCollection, isSellOut, salesVolume, time, remarks);
    }
}