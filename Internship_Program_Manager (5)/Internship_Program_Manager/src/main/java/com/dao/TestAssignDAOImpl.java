// TestAssignDAOImpl.java
package com.dao;

import com.bean.TestAssign;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TestAssignDAOImpl implements TestAssignDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void assignTestToBatch(TestAssign testAssign) {
        String sql = "INSERT INTO testassign (batchID, testID) VALUES (?, ?)";
        jdbcTemplate.update(sql, testAssign.getBatchID(), testAssign.getTestID());
    }
    
    @Override
    public List<TestAssign> getTestAssignByBatchId(int batchId) {
        String sql = "SELECT * FROM testassign WHERE batchID = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(TestAssign.class), batchId);
    }
}
