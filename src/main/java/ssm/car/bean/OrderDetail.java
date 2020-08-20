package ssm.car.bean;

public class OrderDetail {
    private Integer id;

    private Integer orderId;

    private Integer carId;

    private Integer carNum;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getcarId() {
        return carId;
    }

    public void setcarId(Integer carId) {
        this.carId = carId;
    }

    public Integer getcarNum() {
        return carNum;
    }

    public void setcarNum(Integer carNum) {
        this.carNum = carNum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}