package com.dao;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.Performance;
import com.bean.Trainer;

import java.util.List;

@Repository("testAssignDAO")
public class TrainerDAOImpl implements TrainerDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
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
            String sql = "SELECT password FROM trainer WHERE Email = ? and userName=?";
            String hashedPassword = jdbcTemplate.queryForObject(sql, String.class, email,userName);
            return hashedPassword != null && verifyPassword(password, hashedPassword);
        } catch (EmptyResultDataAccessException e) {
        return false;
    }
    }

    @Override
    public void addTrainer(Trainer trainer) {
        String sql = "INSERT INTO trainer (trainerID, trainerName,Email,Password,userName) VALUES (?,?,?,?,?)";
        System.out.println(trainer.getPassword()+ trainer.getEmail()+ trainer.getUserName());
        String hashedPassword = BCrypt.hashpw(trainer.getPassword(), BCrypt.gensalt(COST_FACTOR));
        jdbcTemplate.update(sql, trainer.getTrainerID(), trainer.getTrainerName(),trainer.getEmail(),hashedPassword,trainer.getUserName());
    }

    @Override
    public void updateTrainer(Trainer trainer) {
        String sql = "UPDATE trainer SET trainerName = ?,Email=?,Password=?,userName=? WHERE trainerID = ?";
        System.out.println(trainer.getPassword());
        String hashedPassword = BCrypt.hashpw(trainer.getPassword(), BCrypt.gensalt(COST_FACTOR));
        jdbcTemplate.update(sql, trainer.getTrainerName(),trainer.getEmail(),hashedPassword,trainer.getUserName(),trainer.getTrainerID());
    }

    @Override
    public Trainer getTrainerById(int trainerID) {
        String sql = "SELECT * FROM trainer WHERE trainerID = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{trainerID}, new BeanPropertyRowMapper<>(Trainer.class));
    }

    @Override
    public List<Trainer> getAllTrainers() {
        String sql = "SELECT trainerID, trainerName,Email FROM trainer";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Trainer.class));
    }

    @Override
    public void deleteTrainer(int trainerID) {
        String sql = "DELETE FROM trainer WHERE trainerID = ?";
        jdbcTemplate.update(sql, trainerID);
    }

	@Override
	public List<Performance> getAllPerformance() {
		 String sql = "SELECT * FROM performance";
	        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Performance.class));
	}

	

	@Override
	public boolean isEmailExists(String Email) {
		String sql = "SELECT COUNT(*) FROM trainer WHERE Email=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,Email);
		return count>0;
	}

	@Override
	public boolean isTrainerNameExists(String trainerName) {
		String sql = "SELECT COUNT(*) FROM trainer WHERE trainerName=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,trainerName);
		return count>0;
	}

	@Override
	public void deleteTrainerByTrainerName(String trainerName) {
		  String sql = "DELETE FROM trainer WHERE trainerName = ?";
	        jdbcTemplate.update(sql, trainerName);
		
	}


	
	@Override
	public boolean isUserNameExists(String userName) {
		String sql = "SELECT COUNT(*) FROM trainer WHERE userName=?";
		int count = jdbcTemplate.queryForObject(sql, Integer.class,userName);
		return count>0;
	
	
	
	
}

	@Override
	public Trainer getTrainerByEmail(String email) {
		String sql = "SELECT * FROM trainer WHERE Email = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{email}, new BeanPropertyRowMapper<>(Trainer.class));
	}
}
