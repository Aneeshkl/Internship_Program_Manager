package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.bean.Question;
import com.bean.Test;
@Repository("testDAO")
public class TestDAOImpl implements TestDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    

    @Override
    public List<Test> getAllTests() {
        String sql = "SELECT testID, tag, numOfQuestions FROM test";
        return jdbcTemplate.query(sql, (rs, rowNum) -> mapRowToTest(rs));
    }
    private Test mapRowToTest(ResultSet rs) throws SQLException {
        Test test = new Test();
        test.setTestId(rs.getInt("testID"));
        test.setTag(rs.getString("tag"));
        test.setNumOfQuestions(rs.getInt("numOfQuestions"));
        return test;
    }
    
    @Override
    public int addTest(Test test) {
        String sql = "INSERT INTO test (tag, numOfQuestions) VALUES (?, ?)";
        KeyHolder keyHolder = new GeneratedKeyHolder();

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, new String[]{"testID"});
            ps.setString(1, test.getTag());
            ps.setInt(2, test.getNumOfQuestions());
            return ps;
        }, keyHolder);

        return keyHolder.getKey().intValue();
    }
    
    @Override
    public Test getTestById(int testId) {
        String query = "SELECT * FROM test WHERE testID = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{testId}, (resultSet, rowNum) -> {
            Test test = new Test();
            test.setTestId(resultSet.getInt("testid"));
            test.setTag(resultSet.getString("tag"));
            test.setNumOfQuestions(resultSet.getInt("numOfQuestions"));
            return test;
        });
    }
    
    @Override
    public void addQuestion(Question question) {
        String sql = "INSERT INTO questions (testID, question, option1, option2, option3, option4, correctAnswer) VALUES (?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql, question.getTestID(), question.getQuestion(),
                question.getOption1(), question.getOption2(), question.getOption3(), question.getOption4(),
                question.getCorrectAnswer());
    }
    
    @Override
    public List<Question> getQuestionsByTestId(int testId) {
        String query = "SELECT * FROM questions WHERE testID = ?";
        return jdbcTemplate.query(query, new Object[]{testId}, (resultSet, i) -> {
            Question question = new Question();
            question.setTestID(resultSet.getInt("testID"));
            question.setQuestionID(resultSet.getInt("questionID"));
            question.setQuestion(resultSet.getString("question"));
            question.setOption1(resultSet.getString("option1"));
            question.setOption2(resultSet.getString("option2"));
            question.setOption3(resultSet.getString("option3"));
            question.setOption4(resultSet.getString("option4"));
            question.setCorrectAnswer(resultSet.getString("correctAnswer"));
            return question;
        });
    }
    
    @Override
    public Map<String, String> getCorrectAnswersByTestId(int testId) {
        String sql = "SELECT questionID, correctAnswer FROM questions WHERE testID = ?";
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql, testId);

        Map<String, String> correctAnswers = new HashMap<>();

        for (Map<String, Object> row : rows) {
            String questionId = String.valueOf(row.get("questionID"));
            String correctAnswer = (String) row.get("correctAnswer");
            correctAnswers.put(questionId, correctAnswer);
        }

        return correctAnswers;
    }
    
    @Override
    public int calculateAndStoreScore(Map<String, String> correctAnswers, Map<String, String[]> internAnswers) {
        int score = 0;
        for (Map.Entry<String, String[]> entry : internAnswers.entrySet()) {
            String questionId = entry.getKey();
            StringBuilder numericPart = new StringBuilder();

            for (char c : questionId.toCharArray()) {
                if (Character.isDigit(c)) {
                    numericPart.append(c);
                }
            }

            questionId = numericPart.toString();
            String[] selectedOptions = entry.getValue();
            String correctAnswer = correctAnswers.get(questionId);
            if (correctAnswer != null && Arrays.equals(selectedOptions, correctAnswer.split(","))) {
                score++; // Increase score if the answer is correct
            }
        }

        return score;
    }
}