package com.bean;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

public class Batch {
    private int batchID;
    @NotBlank(message = "Batch name cannot be blank")
    @UniqueBatchName(message = "Batch name already Exits !!!")
    private String batchName;
    private String category;
    private LocalDate startDate;
    private LocalDate endDate; 
    private String trainerName;
    
    private int intern[];
	private int trainerID;
	private int trainer[];
    public int[] getTrainer() {
		return trainer;
	}

	public void setTrainer(int[] trainer) {
		this.trainer = trainer;
	}

	public int getTrainerID() {
		return trainerID;
	}

	public void setTrainerID(int trainerID) {
		this.trainerID = trainerID;
	}


    public int[] getIntern() {
		return intern;
	}

	public void setIntern(int[] intern) {
		this.intern = intern;
	}

	
    public Batch() {
        // Default constructor
    }

    public Batch(int batchID, String batchName, String category, LocalDate startDate, LocalDate endDate, String trainerName) {
        this.batchID = batchID;
        this.batchName = batchName;
        this.category = category;
        this.startDate = startDate;
        this.endDate = endDate;
        this.trainerName = trainerName;
      
    }

	public int getBatchID() {
		return batchID;
	}

	public void setBatchID(int batchID) {
		this.batchID = batchID;
	}

	public String getBatchName() {
		return batchName;
	}

	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}
    
}


