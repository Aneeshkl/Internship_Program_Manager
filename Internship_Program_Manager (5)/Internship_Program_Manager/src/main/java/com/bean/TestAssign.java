package com.bean;

public class TestAssign {
	private int assignID;
	private int batchID;
	private int testID;
	public TestAssign(int assignID, int batchID, int testID) {
		super();
		this.assignID = assignID;
		this.batchID = batchID;
		this.testID = testID;
	}
	public TestAssign() {
		// TODO Auto-generated constructor stub
	}
	public int getAssignID() {
		return assignID;
	}
	public void setAssignID(int assignID) {
		this.assignID = assignID;
	}
	public int getBatchID() {
		return batchID;
	}
	public void setBatchID(int batchID) {
		this.batchID = batchID;
	}
	public int getTestID() {
		return testID;
	}
	public void setTestID(int testID) {
		this.testID = testID;
	}
	
}
