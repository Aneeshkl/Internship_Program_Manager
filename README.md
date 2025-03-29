# 👉 Internship Program Manager
_A Java MVC-based application for managing internship programs efficiently._

## 📚 Overview
The **Internship Program Manager** is a **Java MVC** application designed to manage various aspects of an internship program. It allows administrators to handle batches, trainers, interns, and the Learning & Development (LD) team, ensuring smooth program execution.

## 🚀 Features

### 🔹 User Roles & Functionalities

👤 **Admin:**  
✅ Create, update, and delete **batches**.  
✅ Add and manage **trainers**.  
✅ Assign **interns** to batches.  
✅ Oversee the **Learning & Development (LD) team**.  
✅ Monitor internship progress.  

👥 **Users (Interns & Trainers):**  
✅ Interns can view batch details and progress.  
✅ Trainers can manage assigned batches and interns.  

## 🛠️ Tech Stack

🔹 **Backend:** Java (Spring MVC)  
🔹 **Frontend:** JSP, HTML, CSS, Bootstrap  
🔹 **Database:** MySQL  
🔹 **Tools:** IntelliJ IDEA, Postman (for API testing), GitHub  

## 📂 Project Structure
```
Internship-Program-Manager/
️│── src/main/java/com/project/
️│   ├── bean/        # Java Beans (Entities and Models)
️│   ├── config/      # Configuration Files
️│   ├── controller/  # Request Handling
️│   ├── dao/         # Data Access Layer
️│   ├── gp/          # General Purpose Utilities
️│   └── service/     # Business Logic
️│── src/main/webapp/  # Frontend (JSP, CSS, JS)
️│── pom.xml           # Maven Dependencies
️│── README.md         # Documentation
```

## 🛠️ Setup & Installation

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-username/Internship-Program-Manager.git
cd Internship-Program-Manager
```

### 2️⃣ Import into IntelliJ IDEA
- Open **IntelliJ IDEA** → Click **"Open Project"** → Select the folder.  
- Ensure all **Maven dependencies** are loaded properly.  

### 3️⃣ Configure Database
- Create a MySQL database:
  ```sql
  CREATE DATABASE internship_manager;
  ```
- Update **application.properties** with your database credentials.

### 4️⃣ Run the Project
- Start the application using IntelliJ IDEA.
- Access the web application at:
  ```
  http://localhost:8080
  ```

## 📊 Database Schema

| Table Name  | Description |
|-------------|------------|
| `batch` | Stores internship batch details |
| `trainer` | Stores trainer details |
| `intern` | Stores intern details |
| `ld_team` | Stores Learning & Development team details |
| `users` | Stores login credentials of interns/trainers/admin |



## 📩 Contact & Contributions
🔹 If you’d like to contribute or have questions, feel free to open an **Issue** or a **Pull Request**.



---

💪 **Thank you for using the Internship Program Manager!** 🚀

