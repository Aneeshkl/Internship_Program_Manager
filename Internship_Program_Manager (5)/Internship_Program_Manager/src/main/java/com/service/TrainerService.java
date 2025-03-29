package com.service;

import java.util.List;

import com.bean.Performance;
import com.bean.Trainer;

public interface TrainerService {
    void addTrainer(Trainer trainer);
    void updateTrainer(Trainer trainer);
    Trainer getTrainerById(int trainerID);
    List<Trainer> getAllTrainers();
    void deleteTrainer(int trainerID);
	List<Performance> getAllPerformance();
	void deleteTrainerByTrainerName(String trainerName);
	boolean isValidate(String userName, String email, String password);
	Trainer getTrainerByEmail(String email);
}