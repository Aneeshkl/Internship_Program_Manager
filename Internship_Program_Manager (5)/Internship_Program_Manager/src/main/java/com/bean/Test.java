package com.bean;

public class Test {
    private int testID;
    private String tag;
    private int numOfQuestions;
   
    public Test() {
        super();
    }
    public Test(int testId, String tag,int numOfQuestions) {
        super();
        this.testID = testId;
        this.tag = tag;
        this.numOfQuestions = numOfQuestions;
 
    }
    public int getTestId() {
        return testID;
    }
    public void setTestId(int testId) {
        this.testID = testId;
    }
    public String getTag() {
        return tag;
    }
    public void setTag(String tag) {
        this.tag = tag;
    }
    public int getNumOfQuestions() {
        return numOfQuestions;
    }
    public void setNumOfQuestions(int numOfQuestions) {
        this.numOfQuestions = numOfQuestions;
    }
   
    
}
