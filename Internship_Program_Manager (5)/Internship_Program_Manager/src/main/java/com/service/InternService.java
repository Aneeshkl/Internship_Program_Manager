package com.service;

import java.util.List;

import com.bean.Intern;
import com.bean.Performance;
public interface InternService {
    void addIntern(Intern intern);
    void updateIntern(Intern intern);
    void deleteIntern(int internID);
    Intern getInternById(int internID);
    List<Intern> getAllInterns();
	Intern getInternByName(String name);
	List<Intern> getAllInternsByBatchId(int batchID);
	void deletePerformanceByInternName(String name);
	void deleteInternByBatchName(String batchName);
	void deleteUserByName(String name);
	public boolean testAvailable(String internName);
	public boolean isValidate(String userName,String email, String password);
	Intern getInternByInternMail(String email);
	
	
	
}
