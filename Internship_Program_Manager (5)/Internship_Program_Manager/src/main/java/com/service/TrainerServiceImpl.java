package com.service;

import org.springframework.stereotype.Service;

import com.bean.Performance;
import com.bean.Trainer;
import com.dao.TrainerDAO;

import java.util.List;

@Service
public class TrainerServiceImpl implements TrainerService {
    private TrainerDAO trainerDAO;

    public TrainerServiceImpl(TrainerDAO trainerDAO) {
        this.trainerDAO = trainerDAO;
    }

    @Override
    public void addTrainer(Trainer trainer) {
        trainerDAO.addTrainer(trainer);
    }

    @Override
    public void updateTrainer(Trainer trainer) {
        trainerDAO.updateTrainer(trainer);
    }

    @Override
    public Trainer getTrainerById(int trainerID) {
        return trainerDAO.getTrainerById(trainerID);
    }

    @Override
    public List<Trainer> getAllTrainers() {
        return trainerDAO.getAllTrainers();
    }

    @Override
    public void deleteTrainer(int trainerID) {
    	try {
        trainerDAO.deleteTrainer(trainerID);
    	}
    	catch(Exception e) {
    		System.out.println(e.getMessage());
    	}
    }

	@Override
	public List<Performance> getAllPerformance() {
		// TODO Auto-generated method stubget
		 return trainerDAO.getAllPerformance();
	}

	
	@Override
	public void deleteTrainerByTrainerName(String trainerName) {
		try {
		// TODO Auto-generated method stub
		trainerDAO.deleteTrainerByTrainerName(trainerName);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public boolean isValidate(String userName, String email, String password) {
		// TODO Auto-generated method stub
		return trainerDAO.isValidate(userName,email,password);
	}

	@Override
	public Trainer getTrainerByEmail(String email) {
		// TODO Auto-generated method stub
		return trainerDAO.getTrainerByEmail(email);
	}
}
