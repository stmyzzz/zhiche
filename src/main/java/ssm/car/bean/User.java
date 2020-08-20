package ssm.car.bean;


public class User {
	 private Integer uid;

	    private String uname;

	    private String uimg;

	    private String password;

	    private String intro;

	    private String ulike;

	    private String gender;

	    private String phone;

	    private String email;

	    private String adress;
    
    

    public String getUimg() {
			return uimg;
		}

		public void setUimg(String uimg) {
			this.uimg = uimg;
		}

		public String getIntro() {
			return intro;
		}

		public void setIntro(String intro) {
			this.intro = intro;
		}

		public String getUlike() {
			return ulike;
		}

		public void setUlike(String ulike) {
			this.ulike = ulike;
		}

	public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress == null ? null : adress.trim();
    }

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", password="
				+ password + ", gender=" + gender + ", phone=" + phone
				+ ", email=" + email + ", adress=" + adress + "]";
	}
    
}