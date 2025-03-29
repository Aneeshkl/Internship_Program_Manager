package com.dao;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.Intern;
import com.bean.Performance;

import java.util.List;
@Repository("InternDAO")
public class InternDAOImpl implements InternDAO {
    private JdbcTemplate jdbcTemplate;

    public InternDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    private static final int COST_FACTOR = 12;
    public static boolean verifyPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }

    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(COST_FACTOR));
    }

    @Override
    public boolean isValidate(String userName,String email, String password) {
        try {
            String sql = "SELECT password FROM intern WHERE email = ? and userName=?";
            String hashedPassword = jdbcTemplate.queryForObject(sql, String.class, email,userName);
            return hashedPassword != null && verifyPassword(password, hashedPassword);
        } catch (EmptyResultDataAccessException e) {
        return false;
    }
    }
    
    
    @Override
    public void addIntern(Intern intern) {
        String sql = "INSERT INTO intern (internID, name, college, course, dob, gender, address, phoneNumber, shortDescription, internDuration, batchID, batchName, password,email,userName) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        String hashedPassword = BCrypt.hashpw(intern.getPassword(), BCrypt.gensalt(COST_FACTOR));
        jdbcTemplate.update(sql, intern.getInternID(), intern.getName(), intern.getCollege(),
                intern.getCourse(), intern.getDob(), intern.getGender(), intern.getAddress(),
                intern.getPhoneNumber(), intern.getShortDescription(), intern.getInternDuration(),intern.getBatchID(),intern.getBatchName(), hashedPassword,intern.getEmail(),intern.getUserName());
     }
    @Override
    public void updateIntern(Intern intern) {
        try {
        String sql = "UPDATE intern SET name = ?, college = ?,course= ?,dob= ?,gender = ?, address = ?, phoneNumber = ?, shortDescription = ?,internDuration= ?,password=?,email=?,userName=?WHERE internID = ?";
        String hashedPassword = BCrypt.hashpw(intern.getPassword(), BCrypt.gensalt(COST_FACTOR));
        jdbcTemplate.update(sql, intern.getName(), intern.getCollege(), intern.getCourse(),intern.getDob(),intern.getGender(),intern.getAddress(),intern.getPhoneNumber(),intern.getShortDescription(),intern.getInternDuration(),hashedPassword,intern.getEmail(),intern.getUserName(),intern.getInternID());
        System.out.println(intern.getShortDescription());
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteIntern(int internID) {
        String sql = "DELETE FROM intern WHERE internID = ?";
        jdbcTemplate.update(sql, internID);
    }

    @Override
    public Intern getInternById(int internID) {
        try {
        String sql = "SELECT * FROM intern WHERE internID = ?";
        
        return jdbcTemplate.queryForObject(sql, new Object[]{internID}, BeanPropertyRowMapper.newInstance(Intern.class));
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return null;
        
    }

    @Override
    public List<Intern> getAllInterns() {
        String sql = "SELECT * FROM intern";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Intern.class));
    }

	@Override
	public Intern getInternByName(String name) {
		try {
	        String sql = "SELECT * FROM intern WHERE name = ?";
	        return jdbcTemplate.queryForObject(sql, new Object[]{name}, BeanPropertyRowMapper.newInstance(Intern.class));
	        }
	        catch(Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	}

	@Override
	public boolean isMobileNumberExists(String phoneNumber) {
		String sql = "SELECT COUNT(*) FROM intern where phoneNumber=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,phoneNumber);
		return count>0;
	}

	@Override
	public List<Intern> getAllInternsByBatchId(int batchID) {
	    String sql = "SELECT * FROM intern WHERE batchID = ?";
	    return jdbcTemplate.query(sql, new Object[]{batchID}, BeanPropertyRowMapper.newInstance(Intern.class));
	}

	@Override
	public void deletePerformanceByInternName(String name) {
		   String sql = "DELETE FROM performance WHERE internName = ?";
	        jdbcTemplate.update(sql, name);
	}

	@Override
	public void deleteInternByBatchName(String batchName) {
		 String sql = "DELETE FROM intern WHERE batchName = ?";
	        jdbcTemplate.update(sql, batchName);
		
	}
	@Override
	public void deleteUserByName(String name) {
		System.out.print("Trainer Name"+name+" check");
		 String sql = "DELETE FROM user WHERE username = ?";
	        jdbcTemplate.update(sql, name);
	}
	
	public boolean testAvailable(String internName) {
		String sql = "SELECT COUNT(*) FROM performance WHERE internName=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,internName);
		return count>0;
	}
	@Override
	public boolean isEmailExists(String email) {
		String sql = "SELECT COUNT(*) FROM intern WHERE email=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,email);
		return count>0;
	}
	
	@Override
    public Intern getInternByInternMail(String email) {
        String sql = "SELECT * FROM intern WHERE email = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Intern.class), email);
        } catch (Exception e) {
            // Handle exceptions (e.g., return null or throw a custom exception)
            return null; // Default value for error or non-existing email
        }
    }

	@Override
	public boolean isInternUserNameExists(String userName) {
		String sql = "SELECT COUNT(*) FROM intern WHERE userName=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,userName);
		return count>0;
	
	
}
}
