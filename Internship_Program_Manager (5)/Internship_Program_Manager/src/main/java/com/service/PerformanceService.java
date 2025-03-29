package com.service;

import java.util.List;

import com.bean.Performance;

public interface PerformanceService {

	void savePerformance(String sc, String rank, String name, String email, String tag);

	boolean scoreexist(String email, String tag);

	void deletePerformancebytestid(String email, String tag);

	List<Performance> getPerformanceByTag(String tag);

	void generatePdf(List<Performance> performances, String pdfFilePath);

	List<Performance> getPerformanceByEmail(String email);

}
