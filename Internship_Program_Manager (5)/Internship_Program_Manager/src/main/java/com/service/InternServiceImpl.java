package com.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Intern;
import com.bean.Performance;
import com.dao.InternDAO;

@Service
public class InternServiceImpl implements InternService {
     @Autowired
    private InternDAO internDAO;
  
    
    @Override
    public void addIntern(Intern intern) {
        internDAO.addIntern(intern);
    }

    @Override
    public void updateIntern(Intern intern) {
        
        internDAO.updateIntern(intern);
    }

    @Override
    public void deleteIntern(int internID) {
       
        internDAO.deleteIntern(internID);
    }

    @Override
    public Intern getInternById(int internId) {
    
        return internDAO.getInternById(internId);
    }

    @Override
    public List<Intern> getAllInterns() {
       
        return internDAO.getAllInterns();
    }

	@Override
	public Intern getInternByName(String name) {
		// TODO Auto-generated method stub
		return internDAO.getInternByName(name);
	}

	@Override
	public List<Intern> getAllInternsByBatchId(int batchID) {
		try {
		// TODO Auto-generated method stub
		 return internDAO.getAllInternsByBatchId(batchID);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

	@Override
	public void deletePerformanceByInternName(String name) {
		try {
			 internDAO.deletePerformanceByInternName(name);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

	@Override
	public void deleteInternByBatchName(String batchName) {

			 internDAO.deleteInternByBatchName(batchName);
				
	}

	@Override
	public void deleteUserByName(String name) {
		try {
			 internDAO.deleteUserByName(name);
		}catch (Exception e) {			
			System.out.println(e.getMessage());
		}
		
	}

	
	@Override
	public boolean testAvailable(String internName) {
		return internDAO.testAvailable(internName);
	}

	@Override
	public boolean isValidate(String userName, String email, String password) {
		// TODO Auto-generated method stub
		return internDAO.isValidate(userName, email, password);
	}
	
	@Override
    public Intern getInternByInternMail(String email) {
        return internDAO.getInternByInternMail(email);
    }

	
}


