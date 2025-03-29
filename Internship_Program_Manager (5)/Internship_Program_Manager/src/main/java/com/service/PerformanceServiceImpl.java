package com.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Performance;
import com.dao.PerformanceDAO;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	
	@Autowired
	    private PerformanceDAO performanceDAO;
	  
	@Override
	public void savePerformance(String sc, String rank, String name, String email, String tag) {
		performanceDAO.savePerformance(sc,rank,name,email,tag);
		
	}

	@Override
	public boolean scoreexist(String email, String tag) {
		return performanceDAO.scoreexist(email,tag);
	}

	@Override
	public void deletePerformancebytestid(String email, String tag) {
		performanceDAO.deletePerformancebytestid(email,tag);
	}

	@Override
	public List<Performance> getPerformanceByTag(String tag) {
		return performanceDAO.getPerformanceByTag(tag);
	}
	
	@Override
	public void generatePdf(List<Performance> performances, String pdfFilePath) {
	    Document document = new Document();
	    try {
	        PdfWriter.getInstance(document, new FileOutputStream(pdfFilePath));
	        document.open();

	        // Add content to the document based on performance data
	        PdfPTable table = new PdfPTable(5); // Adjust the number of columns based on your data
	        table.setWidthPercentage(100);

	        // Set relative widths for each column (adjust as needed)
	        float[] columnWidths = { 1.5f, 3f, 3f, 2f, 2f }; // S.No, Name, Email, Score, Rank
	        table.setWidths(columnWidths);
	        
	        Paragraph title = new Paragraph("Test Report", new com.itextpdf.text.Font(com.itextpdf.text.Font.FontFamily.HELVETICA, 18, com.itextpdf.text.Font.BOLD));
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph(" "));
	        // Add table headers
	        table.addCell("S.No");
	        table.addCell("Name");
	        table.addCell("Email");
	        table.addCell("Score");
	        table.addCell("Rank");

	        // Add performance data to the table
	        int serialNumber = 1;
	        for (Performance performance : performances) {
	            table.addCell(String.valueOf(serialNumber++));
	            table.addCell(String.valueOf(performance.getName()));
	            table.addCell(String.valueOf(performance.getEmail()));
	            table.addCell(String.valueOf(performance.getScore()));
	            table.addCell(performance.getRank());
	        }

	        document.add(table);
	    } catch (DocumentException | FileNotFoundException e) {
	        e.printStackTrace(); // Handle exceptions appropriately
	    } finally {
	        if (document != null) {
	            document.close();
	        }
	    }
	}

	@Override
	public List<Performance> getPerformanceByEmail(String email) {
		// TODO Auto-generated method stub
		return performanceDAO.getPerformanceByEmail(email);
	}


}
