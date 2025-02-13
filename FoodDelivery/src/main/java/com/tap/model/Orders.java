package com.tap.model;

public class Orders {
	
	private int orderid;
	private int userid;
	private int Restautid;
	private float totalamount;
	private String status;
	private String paymentmode;
	
	
	
	public Orders() {
		super();
	}

	public Orders(int orderid, int userid, int restautid, float totalamount, String status, String paymentmode) {
		super();
		this.orderid = orderid;
		this.userid = userid;
		Restautid = restautid;
		this.totalamount = totalamount;
		this.status = status;
		this.paymentmode = paymentmode;
	}

	public Orders(int userid, int restautid, float totalamount, String status, String paymentmode) {
		super();
		this.userid = userid;
		Restautid = restautid;
		this.totalamount = totalamount;
		this.status = status;
		this.paymentmode = paymentmode;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getRestautid() {
		return Restautid;
	}

	public void setRestautid(int restautid) {
		Restautid = restautid;
	}

	public float getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(float totalamount) {
		this.totalamount = totalamount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentmode() {
		return paymentmode;
	}

	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	
   @Override	
	public String toString() {
		
		return orderid+" "+userid+" "+Restautid+" "+totalamount+" "+status+" "+paymentmode;
	}


}
