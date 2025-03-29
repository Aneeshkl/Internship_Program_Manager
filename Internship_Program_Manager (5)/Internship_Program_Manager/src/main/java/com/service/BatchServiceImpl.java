package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Batch;
import com.bean.Intern;
import com.bean.Performance;
import com.bean.Trainer;
import com.dao.BatchDAO;

@Service
public class BatchServiceImpl implements BatchService {

	@Autowired
    private  BatchDAO batchDAO;

   

    @Override
    public void createBatch(Batch batch) {

		batchDAO.createBatch(batch);
    }

    @Override
    public void updateBatch(Batch batch) {
        batchDAO.updateBatch(batch);
    }

    @Override
    public void deleteBatch(int batchId) {
        batchDAO.deleteBatch(batchId);
    }

    @Override
    public List<Batch> getAllBatches() {
        return batchDAO.getAllBatches();
    }

    @Override
    public Batch getBatchById(int batchId) {
        return batchDAO.getBatchById(batchId);
    }

    @Override
    public List<Intern> getInternsByBatchId(int batchId) {
        return batchDAO.getInternsByBatchId(batchId);
    }


	@Override
	public List<Trainer> getAllTrainerWithoutBatchID() {
		List<Trainer> trainerList=batchDAO.getAllTrainerWithoutBatchID();
		if(trainerList!=null) {
			return trainerList;
		}
		return null;
	}

	@Override
	public Batch addBatch(Batch batch) {
		Batch resultbatch= batchDAO.addBatch(batch);
		return resultbatch;
	}

	@Override
	public List<Intern> getBatchByName(String batchName) {
		 return batchDAO.getBatchByName(batchName);
	}

	@Override
	public Performance getPerformanceByInternName(String name) {
		try {
		return batchDAO.getPerformanceByInternName(name);
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
		
	}

	@Override
	public Batch getBatchByTrainerName(String name) {
		try {
		return batchDAO.getBatchByTrainerName(name);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	@Override
	public List<Batch> getAllBatchByTrainerName(String name) {
		try {
		return batchDAO.getAllBatchByTrainerName(name);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@Override
	public void deleteBatchByBatchID(int batchID) {
		try {
			 batchDAO.deleteBatchByBatchID(batchID);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void deleteBatchByTrainerName(String trainerName) {
			batchDAO.deleteBatchByTrainerName(trainerName);
		}	
}
