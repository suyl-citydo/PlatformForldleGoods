package domain;

import java.util.Objects;

/**
 * @Author: suyl
 * @Date: 2019/3/27 19:36
 * @Descritpion: 购物车实体类
 */
public class Shopcart {
    private String id;
    private String cid;
    private String email;
    private String cname;
    private String address;
    private String cdescribes;
    private double cprice;
    private Integer cnum;
    private String curl;
    private String time;

    public Shopcart() {
    }

    public Shopcart(String id, String cid, String email, String cname, String address, String cdescribes, double cprice, Integer cnum, String curl, String time) {
        this.id = id;
        this.cid = cid;
        this.email = email;
        this.cname = cname;
        this.address = address;
        this.cdescribes = cdescribes;
        this.cprice = cprice;
        this.cnum = cnum;
        this.curl = curl;
        this.time = time;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCdescribes() {
        return cdescribes;
    }

    public void setCdescribes(String cdescribes) {
        this.cdescribes = cdescribes;
    }

    public double getCprice() {
        return cprice;
    }

    public void setCprice(double cprice) {
        this.cprice = cprice;
    }

    public Integer getCnum() {
        return cnum;
    }

    public void setCnum(Integer cnum) {
        this.cnum = cnum;
    }

    public String getCurl() {
        return curl;
    }

    public void setCurl(String curl) {
        this.curl = curl;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Shopcart{" +
                "id='" + id + '\'' +
                ", cid='" + cid + '\'' +
                ", email='" + email + '\'' +
                ", cname='" + cname + '\'' +
                ", address=" + address +
                ", cdescribes='" + cdescribes + '\'' +
                ", cprice=" + cprice +
                ", cnum=" + cnum +
                ", curl='" + curl + '\'' +
                ", time='" + time + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Shopcart shopcart = (Shopcart) o;
        return Double.compare(shopcart.cprice, cprice) == 0 &&
                Objects.equals(id, shopcart.id) &&
                Objects.equals(cid, shopcart.cid) &&
                Objects.equals(email, shopcart.email) &&
                Objects.equals(cname, shopcart.cname) &&
                Objects.equals(address, shopcart.address) &&
                Objects.equals(cdescribes, shopcart.cdescribes) &&
                Objects.equals(cnum, shopcart.cnum) &&
                Objects.equals(curl, shopcart.curl) &&
                Objects.equals(time, shopcart.time);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, cid, email, cname, address, cdescribes, cprice, cnum, curl, time);
    }
}
