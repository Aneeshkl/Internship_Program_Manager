// TestAssignServiceImpl.java
package com.service;

import com.bean.TestAssign;
import com.dao.TestAssignDAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TestAssignServiceImpl implements TestAssignService {

    @Autowired
    private TestAssignDAO testAssignDAO;

    @Override
    @Transactional
    public void assignTestToBatch(TestAssign testAssign) {
        testAssignDAO.assignTestToBatch(testAssign);
    }
    
    @Override
    public List<TestAssign> getTestAssignByBatchId(int batchId) {
        return testAssignDAO.getTestAssignByBatchId(batchId);
    }
}
