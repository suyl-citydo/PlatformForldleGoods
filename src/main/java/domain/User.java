package domain;

import java.util.Objects;

public class User {
    private String id;
    private String email;
    private String name;
    private String password;
    private String head;
    private String phone;
    private String sex;
    private Integer age;
    private String province;
    private String city;
    private String county;
    private Double balance;
    private String introduce;

    public User() {
        super();
    }

    public User(String id, String email, String name, String password, String head, String phone, String sex, Integer age, String province, String city, String county, Double balance, String introduce) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.password = password;
        this.head = head;
        this.phone = phone;
        this.sex = sex;
        this.age = age;
        this.province = province;
        this.city = city;
        this.county = county;
        this.balance = balance;
        this.introduce = introduce;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(id, user.id) &&
                Objects.equals(email, user.email) &&
                Objects.equals(name, user.name) &&
                Objects.equals(password, user.password) &&
                Objects.equals(head, user.head) &&
                Objects.equals(phone, user.phone) &&
                Objects.equals(sex, user.sex) &&
                Objects.equals(age, user.age) &&
                Objects.equals(province, user.province) &&
                Objects.equals(city, user.city) &&
                Objects.equals(county, user.county) &&
                Objects.equals(balance, user.balance) &&
                Objects.equals(introduce, user.introduce);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, name, password, head, phone, sex, age, province, city, county, balance, introduce);
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", head='" + head + '\'' +
                ", phone=" + phone +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", county='" + county + '\'' +
                ", balance=" + balance +
                ", introduce='" + introduce + '\'' +
                '}';
    }
}
