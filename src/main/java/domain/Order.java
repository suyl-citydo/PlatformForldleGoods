package domain;


import java.util.Objects;

public class Order {

  private String id;
  private String buyEmail;
  private String buyName;
  private String buyPhone;
  private double totalPrice;
  private Integer totalNum;
  private String address;
  private Integer status;
  private String time;

  public Order() {

  }

  public Order(String id, String buyEmail, String buyName, String buyPhone, double totalPrice, Integer totalNum, String address, Integer status, String time) {
    this.id = id;
    this.buyEmail = buyEmail;
    this.buyName = buyName;
    this.buyPhone = buyPhone;
    this.totalPrice = totalPrice;
    this.totalNum = totalNum;
    this.address = address;
    this.status = status;
    this.time = time;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
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


  public double getTotalPrice() {
    return totalPrice;
  }

  public void setTotalPrice(double totalPrice) {
    this.totalPrice = totalPrice;
  }


  public long getTotalNum() {
    return totalNum;
  }

  public void setTotalNum(Integer totalNum) {
    this.totalNum = totalNum;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public long getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }


  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }

  @Override
  public String toString() {
    return "Order{" +
            "id='" + id + '\'' +
            ", buyEmail='" + buyEmail + '\'' +
            ", buyName='" + buyName + '\'' +
            ", buyPhone='" + buyPhone + '\'' +
            ", totalPrice=" + totalPrice +
            ", totalNum=" + totalNum +
            ", address='" + address + '\'' +
            ", status=" + status +
            ", time='" + time + '\'' +
            '}';
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Order order = (Order) o;
    return Double.compare(order.totalPrice, totalPrice) == 0 &&
            Objects.equals(id, order.id) &&
            Objects.equals(buyEmail, order.buyEmail) &&
            Objects.equals(buyName, order.buyName) &&
            Objects.equals(buyPhone, order.buyPhone) &&
            Objects.equals(totalNum, order.totalNum) &&
            Objects.equals(address, order.address) &&
            Objects.equals(status, order.status) &&
            Objects.equals(time, order.time);
  }

  @Override
  public int hashCode() {
    return Objects.hash(id, buyEmail, buyName, buyPhone, totalPrice, totalNum, address, status, time);
  }
}
