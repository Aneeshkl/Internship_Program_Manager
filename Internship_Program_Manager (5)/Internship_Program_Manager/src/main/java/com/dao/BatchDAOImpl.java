package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.bean.Batch;
import com.bean.Intern;
import com.bean.Performance;
import com.bean.Trainer;


@Repository
public class BatchDAOImpl implements BatchDAO {

    private  JdbcTemplate jdbcTemplate;

    @Autowired
    public BatchDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void createBatch(Batch batch) {
        String sql = "INSERT INTO batch (batchID, batchName, category, startDate, endDate, trainerName) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql, batch.getBatchID(), batch.getBatchName(), batch.getCategory(),
                             batch.getStartDate(), batch.getEndDate(), batch.getTrainerName());
    }

    @Override
    public void updateBatch(Batch batch) {
        String sql = "UPDATE batch SET batchName = ?, category = ?, startDate = ?, " +
                     "endDate = ?, trainerName = ? WHERE batchID = ?";

        jdbcTemplate.update(sql, batch.getBatchName(), batch.getCategory(), batch.getStartDate(),
                             batch.getEndDate(), batch.getTrainerName(), batch.getBatchID());
    }

    @Override
    public void deleteBatch(int batchID) {
        String sql = "DELETE FROM batch WHERE batchID = ?";

        jdbcTemplate.update(sql, batchID);
    }

    @Override
    public List<Batch> getAllBatches() {
        String sql = "SELECT * FROM batch";
        System.out.println(sql);
        return jdbcTemplate.query(sql, (rs, rowNum) -> mapBatch(rs));
    }

    @Override
    public Batch getBatchById(int batchID) {
        String sql = "SELECT * FROM batch WHERE batchID = ?";
        System.out.println(sql);
        return jdbcTemplate.queryForObject(sql, new Object[]{batchID}, (rs, rowNum) -> mapBatch(rs));
    }

    @Override
    public List<Intern> getInternsByBatchId(int batchID) {
        String sql = "SELECT * FROM intern WHERE batchID = ?";
        return jdbcTemplate.query(sql, new Object[]{batchID}, (rs, rowNum) -> mapIntern(rs));
    }
    private Intern mapIntern(ResultSet rs) throws SQLException {
        Intern intern = new Intern();
        intern.setInternID(rs.getInt("internID"));
        intern.setName(rs.getString("internName"));
        return intern;
    }
    private Batch mapBatch(ResultSet rs) throws SQLException {
        Batch batch = new Batch();
        batch.setBatchID(rs.getInt("batchID"));
        batch.setBatchName(rs.getString("batchName"));
        batch.setCategory(rs.getString("category"));
        batch.setStartDate(rs.getDate("startDate").toLocalDate());
        batch.setEndDate(rs.getDate("endDate").toLocalDate());
        batch.setTrainerName(rs.getString("trainerName"));
               return batch;
    }
	@Override
	public List<Trainer> getAllTrainerWithoutBatchID() {
		
		 String sql = "SELECT * FROM trainer";
	     return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Trainer.class));
	}

	@Override
	public Batch addBatch(Batch batch) {
	    String sql = "INSERT INTO batch (batchName, category, startDate, endDate, trainerName) " +
	            "VALUES (?, ?, ?, ?, ?)";

	    KeyHolder keyHolder = new GeneratedKeyHolder();

	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(sql, new String[]{"batchID"});
	        ps.setString(1, batch.getBatchName());
	        ps.setString(2, batch.getCategory());
	        ps.setDate(3, java.sql.Date.valueOf(batch.getStartDate()));
	        ps.setDate(4, java.sql.Date.valueOf(batch.getEndDate()));
	        ps.setString(5, batch.getTrainerName());
	       
	        return ps;
	    }, keyHolder);

	    Number generatedBatchID = keyHolder.getKey();
	    if (generatedBatchID != null) {
	        int generatedBatchIDInt = generatedBatchID.intValue();
	        batch.setBatchID(generatedBatchIDInt);
		    System.out.println(generatedBatchID+ " "+generatedBatchIDInt);
	    } else {
	       
	        throw new IllegalStateException("BatchID was not generated");
	    }
	    
	    return batch;
	}
	
	@Override

	 public List<Intern> getBatchByName(String batchName) {
        try {
            String sql = "SELECT i.* FROM intern i JOIN batch b ON i.batchID = b.batchID WHERE b.batchName = ? ";
            return jdbcTemplate.query(sql, new Object[]{batchName}, new BeanPropertyRowMapper<>(Intern.class));
        } catch (Exception e) {
            System.err.println("Error executing query: " + e.getMessage());
            e.printStackTrace();
            return Collections.emptyList(); // Return an empty list in case of an error
        }
    }

	@Override
	  public Performance getPerformanceByInternName(String name) {
        String sql = "SELECT * FROM performance WHERE internName = ?";
  
        Performance p = jdbcTemplate.queryForObject(sql, new Object[]{name},  BeanPropertyRowMapper.newInstance(Performance.class));
        
        return p;
    }

	@Override
	public Batch getBatchByTrainerName(String name) {
		
		 String sql = "SELECT * FROM batch WHERE trainerName = ?";
	        System.out.println(sql);
	        return jdbcTemplate.queryForObject(sql, new Object[]{name}, (rs, rowNum) -> mapBatch(rs));
	}
	@Override
	public List<Batch> getAllBatchByTrainerName(String name) {
		
		 String sql = "SELECT * FROM batch WHERE trainerName = ?";
	        System.out.println(sql);
	       
	        return jdbcTemplate.query(sql, new Object[]{name},BeanPropertyRowMapper.newInstance(Batch.class));
	}

	@Override
	public boolean isBatchNameExists(String batchName) {
		String sql = "SELECT COUNT(*) FROM batch WHERE batchName=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,batchName);
		return count>0;
	
	}

	@Override
	public void deleteBatchByTrainerName(String trainerName) {
		   String sql = "DELETE FROM batch WHERE trainerName = ?";

	        jdbcTemplate.update(sql, trainerName);
		
	}
	@Override
	public void deleteBatchByBatchID(int batchID) {
		   String sql = "DELETE FROM batch WHERE batchID = ?";

	        jdbcTemplate.update(sql, batchID);
		
	}

	}