package domain;


import java.util.Objects;

public class OrderDetails {

  private String id;
  private String orderId;
  private String cid;
  private String curl;
  private String cname;
  private String cemail;
  private String sellPhone;
  private String buyEmail;
  private String buyName;
  private String buyPhone;
  private Integer cnum;
  private double cprice;
  private double ctotalPrice;
  private String cdesc;
  private String time;

  public OrderDetails() {
  }

  public OrderDetails(String id, String orderId, String cid, String curl, String cname, String cemail, String sellPhone, String buyEmail, String buyName, String buyPhone, Integer cnum, double cprice, double ctotalPrice, String cdesc, String time) {
    this.id = id;
    this.orderId = orderId;
    this.cid = cid;
    this.curl = curl;
    this.cname = cname;
    this.cemail = cemail;
    this.sellPhone = sellPhone;
    this.buyEmail = buyEmail;
    this.buyName = buyName;
    this.buyPhone = buyPhone;
    this.cnum = cnum;
    this.cprice = cprice;
    this.ctotalPrice = ctotalPrice;
    this.cdesc = cdesc;
    this.time = time;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }


  public String getOrderId() {
    return orderId;
  }

  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }


  public String getCid() {
    return cid;
  }

  public void setCid(String cid) {
    this.cid = cid;
  }


  public String getCurl() {
    return curl;
  }

  public void setCurl(String curl) {
    this.curl = curl;
  }


  public String getCname() {
    return cname;
  }

  public void setCname(String cname) {
    this.cname = cname;
  }


  public String getCemail() {
    return cemail;
  }

  public void setCemail(String cemail) {
    this.cemail = cemail;
  }


  public String getSellPhone() {
    return sellPhone;
  }

  public void setSellPhone(String sellPhone) {
    this.sellPhone = sellPhone;
  }


  public String getBuyEmail() {
    return buyEmail;
  }

  public void setBuyEmail(String buyEmail) {
    this.buyEmail = buyEmail;
  }


  public String getBuyName() {
    return buyName;
  }

  public void setBuyName(String buyName) {
    this.buyName = buyName;
  }


  public String getBuyPhone() {
    return buyPhone;
  }

  public void setBuyPhone(String buyPhone) {
    this.buyPhone = buyPhone;
  }


  public Integer getCnum() {
    return cnum;
  }

  public void setCnum(Integer cnum) {
    this.cnum = cnum;
  }


  public double getCprice() {
    return cprice;
  }

  public void setCprice(double cprice) {
    this.cprice = cprice;
  }


  public double getCtotalPrice() {
    return ctotalPrice;
  }

  public void setCtotalPrice(double ctotalPrice) {
    this.ctotalPrice = ctotalPrice;
  }


  public String getCdesc() {
    return cdesc;
  }

  public void setCdesc(String cdesc) {
    this.cdesc = cdesc;
  }


  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }

  @Override
  public String toString() {
    return "OrderDetails{" +
            "id='" + id + '\'' +
            ", orderId='" + orderId + '\'' +
            ", cid='" + cid + '\'' +
            ", curl='" + curl + '\'' +
            ", cname='" + cname + '\'' +
            ", cemail='" + cemail + '\'' +
            ", sellPhone=" + sellPhone +
            ", buyEmail='" + buyEmail + '\'' +
            ", buyName='" + buyName + '\'' +
            ", buyPhone=" + buyPhone +
            ", cnum=" + cnum +
            ", cprice=" + cprice +
            ", ctotalPrice=" + ctotalPrice +
            ", cdesc='" + cdesc + '\'' +
            ", time='" + time + '\'' +
            '}';
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    OrderDetails that = (OrderDetails) o;
    return Double.compare(that.cprice, cprice) == 0 &&
            Double.compare(that.ctotalPrice, ctotalPrice) == 0 &&
            Objects.equals(id, that.id) &&
            Objects.equals(orderId, that.orderId) &&
            Objects.equals(cid, that.cid) &&
            Objects.equals(curl, that.curl) &&
            Objects.equals(cname, that.cname) &&
            Objects.equals(cemail, that.cemail) &&
            Objects.equals(sellPhone, that.sellPhone) &&
            Objects.equals(buyEmail, that.buyEmail) &&
            Objects.equals(buyName, that.buyName) &&
            Objects.equals(buyPhone, that.buyPhone) &&
            Objects.equals(cnum, that.cnum) &&
            Objects.equals(cdesc, that.cdesc) &&
            Objects.equals(time, that.time);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, orderId, cid, curl, cname, cemail, sellPhone, buyEmail, buyName, buyPhone, cnum, cprice, ctotalPrice, cdesc, time);
  }
}
