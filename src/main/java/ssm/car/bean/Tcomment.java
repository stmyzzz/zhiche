package ssm.car.bean;

public class Tcomment {
    private Integer tid;

    private Integer uid;

    private String tcname;

    private String tcdate;

    private String tccontent;

    private String tcimg;

    private String tcintro;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getTcname() {
        return tcname;
    }

    public void setTcname(String tcname) {
        this.tcname = tcname == null ? null : tcname.trim();
    }

    public String getTcdate() {
        return tcdate;
    }

    public void setTcdate(String tcdate) {
        this.tcdate = tcdate == null ? null : tcdate.trim();
    }

    public String getTccontent() {
        return tccontent;
    }

    public void setTccontent(String tccontent) {
        this.tccontent = tccontent == null ? null : tccontent.trim();
    }

    public String getTcimg() {
        return tcimg;
    }

    public void setTcimg(String tcimg) {
        this.tcimg = tcimg == null ? null : tcimg.trim();
    }

    public String getTcintro() {
        return tcintro;
    }

    public void setTcintro(String tcintro) {
        this.tcintro = tcintro == null ? null : tcintro.trim();
    }
}