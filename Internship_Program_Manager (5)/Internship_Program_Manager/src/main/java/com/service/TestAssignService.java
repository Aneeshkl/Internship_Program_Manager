// TestAssignService.java
package com.service;

import java.util.List;

import com.bean.TestAssign;

public interface TestAssignService {
    void assignTestToBatch(TestAssign testAssign);
    List<TestAssign> getTestAssignByBatchId(int batchId);
    
}
