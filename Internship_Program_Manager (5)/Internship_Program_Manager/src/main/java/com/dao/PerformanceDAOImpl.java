package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.bean.Performance;

@Repository
public class PerformanceDAOImpl implements PerformanceDAO{
	
	@Autowired
    private JdbcTemplate jdbcTemplate;

	@Override
	public void savePerformance(String sc, String rank, String name, String email, String tag) {
		String sql = "INSERT INTO performance(score, `rank`, name, email, tag) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, sc,rank,name,email,tag);
	}

	@Override
	public boolean scoreexist(String email, String tag) {
		String sql = "SELECT COUNT(*) FROM performance WHERE email=? and tag=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,email,tag);
		return count>0;
	}

	@Override
	public void deletePerformancebytestid(String email, String tag) {
		String sql = "DELETE from performance where email=? and tag=?";
        jdbcTemplate.update(sql,email,tag);
	}

	public List<Performance> getPerformanceByTag(String tag) {
        String sql = "SELECT * FROM performance WHERE tag = ?";
        return jdbcTemplate.query(sql, new Object[]{tag}, new PerformanceRowMapper());
    }

    private static class PerformanceRowMapper implements RowMapper<Performance> {
        @Override
        public Performance mapRow(ResultSet rs, int rowNum) throws SQLException {
            Performance performance = new Performance();
            performance.setPerformanceID(rs.getInt("performanceID"));
            performance.setName(rs.getString("name"));
            performance.setScore(rs.getString("score"));
            performance.setRank(rs.getString("rank"));
            performance.setEmail(rs.getString("email"));
            performance.setTag(rs.getString("tag"));
            return performance;
        }
    }

    public List<Performance> getPerformanceByEmail(String email) {
        String sql = "SELECT * FROM performance WHERE email = ?";
        return jdbcTemplate.query(sql, new Object[]{email}, new PerformancRowMapper());
    }

    private static class PerformancRowMapper implements RowMapper<Performance> {
        @Override
        public Performance mapRow(ResultSet rs, int rowNum) throws SQLException {
            Performance performance = new Performance();
            performance.setPerformanceID(rs.getInt("performanceID"));
            performance.setName(rs.getString("name"));
            performance.setScore(rs.getString("score"));
            performance.setRank(rs.getString("rank"));
            performance.setEmail(rs.getString("email"));
            performance.setTag(rs.getString("tag"));
            return performance;
        }
    }
	
}
