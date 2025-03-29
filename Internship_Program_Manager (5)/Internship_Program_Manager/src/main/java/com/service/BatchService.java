package com.service;

import java.util.List;

import com.bean.Batch;
import com.bean.Intern;

import com.bean.Performance;
import com.bean.Trainer;

public interface BatchService {
    void createBatch(Batch batch);
    void updateBatch(Batch batch);
    void deleteBatch(int batchId);
    List<Batch> getAllBatches();
    Batch getBatchById(int batchId);
    List<Intern> getInternsByBatchId(int batchId);
	List<Trainer> getAllTrainerWithoutBatchID();
	Batch addBatch(Batch batch);
	List<Intern> getBatchByName(String batchName);
	Performance getPerformanceByInternName(String name);
	Batch getBatchByTrainerName(String name);
	void deleteBatchByTrainerName(String trainerName);
	void deleteBatchByBatchID(int batchID);
	List<Batch> getAllBatchByTrainerName(String name);
   
}
