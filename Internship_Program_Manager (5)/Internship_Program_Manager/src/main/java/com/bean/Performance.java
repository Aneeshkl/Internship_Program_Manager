package com.bean;

public class Performance {
	private int performanceID;
	private String score;
	private String rank;
	private String name;
	private String email;
	private String tag;
	public Performance() {
		super();
	}
	public Performance(int performanceID, String score, String rank, String name, String email, String tag) {
		super();
		this.performanceID = performanceID;
		this.score = score;
		this.rank = rank;
		this.name = name;
		this.email = email;
		this.tag = tag;
	}
	public int getPerformanceID() {
		return performanceID;
	}
	public void setPerformanceID(int performanceID) {
		this.performanceID = performanceID;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
}


