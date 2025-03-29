
package com.dao;

import java.util.List;

import com.bean.Intern;
public interface InternDAO {
    void addIntern(Intern intern);
    void updateIntern(Intern intern);
    void deleteIntern(int internID);
    Intern getInternById(int internID);
    List<Intern> getAllInterns();
	Intern getInternByName(String name);
	boolean isMobileNumberExists(String phoneNumber);
	List<Intern> getAllInternsByBatchId(int batchID);
	void deletePerformanceByInternName(String name);
	void deleteInternByBatchName(String batchName);
	void deleteUserByName(String name);
	boolean testAvailable(String internName);
	boolean isEmailExists(String email);
	boolean isValidate(String userName, String email, String password);
	Intern getInternByInternMail(String email);
	boolean isInternUserNameExists(String userName);

}

