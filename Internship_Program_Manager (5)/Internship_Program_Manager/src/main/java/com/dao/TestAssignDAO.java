// TestAssignDAO.java
package com.dao;

import java.util.List;

import com.bean.TestAssign;

public interface TestAssignDAO {
    void assignTestToBatch(TestAssign testAssign);
    List<TestAssign> getTestAssignByBatchId(int batchId);
}
