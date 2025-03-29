package com.dao;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.User;
@Repository
public class UserDaoImpl implements UserDao
{
        @Autowired
        private JdbcTemplate jdbcTemplate;
        
        private static final int COST_FACTOR=12;
        public static boolean verifyPassword(String password, String hashedPassword) {
            return BCrypt.checkpw(password, hashedPassword);
        }


        public static String hashPassword(String password) {
            return BCrypt.hashpw(password, BCrypt.gensalt(COST_FACTOR));
        }
       
        @Override
        public User authenticate(String username, String password,String email) {
            try {
                String sql = "select * from user where username=?  AND email=? ";
                List<User> users = jdbcTemplate.query(sql, new Object[]{username,email}, BeanPropertyRowMapper.newInstance(User.class));
                if (!users.isEmpty()) {
                    User user = users.get(0);
                    if (verifyPassword(password, user.getPassword())) {
                        return user;
                    } 
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return null;
        }




        @Override
        public void createUser(int userID, String username, String password,String email) {
            
        }

         @Override
            public User registration(String username, String password,String email) {
                try {
                    String sql = "INSERT INTO user (username, password,email) VALUES (?, ?,?)";
                    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(COST_FACTOR));

                    int result = jdbcTemplate.update(sql, username, hashedPassword,email);

                    if (result > 0) {
                        return new User(result,username, hashedPassword,email);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }


		@Override
		public void deleteUserByTrainerName(String trainerName) {
			
			 String sql = "DELETE FROM user WHERE username = ?";

		        jdbcTemplate.update(sql, trainerName);
		}
		@Override
		public void deleteUserByInternName(String internName) {
			
			 String sql = "DELETE FROM user WHERE username = ?";

		        jdbcTemplate.update(sql, internName);
		}
		@Override
		public boolean isEmailExists(String email) {
			String sql = "SELECT COUNT(*) FROM user WHERE email=?";
			int count = jdbcTemplate.queryForObject(sql, Integer.class,email);
			return count>0;
		}

}
        
         
    
