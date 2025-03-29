package com.dao;

import java.util.List;

import com.bean.Performance;
import com.bean.Trainer;

public interface TrainerDAO {
    void addTrainer(Trainer trainer);
    void updateTrainer(Trainer trainer);
    Trainer getTrainerById(int trainerID);
    List<Trainer> getAllTrainers();
    void deleteTrainer(int trainerID);
	List<Performance> getAllPerformance();
	boolean isTrainerNameExists(String trainerName);
	boolean isEmailExists(String email);
	void deleteTrainerByTrainerName(String trainerName);
	public boolean isValidate(String trainerName, String email, String password);
	boolean isUserNameExists(String userName);
	Trainer getTrainerByEmail(String email);



}
