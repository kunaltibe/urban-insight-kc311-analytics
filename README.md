# Urban Insight: Kansas City 311 Analytics

This project presents an end-to-end data engineering and analytics pipeline built on the Kansas City 311 Call Center Service Request dataset (2007–2021). It demonstrates data profiling, staging, and the creation of interactive dashboards using Tableau and Power BI.

---

## Scope of Work

1. **Visualization Creation:**  
   Develop interactive visualizations using Tableau and Power BI to answer key business questions.

2. **Data Profiling:**  
   Use Alteryx to perform data profiling, identify inconsistencies (missing values, duplicates, incorrect formats, etc.), and document observations.

3. **Data Staging:**  
   Load the raw dataset into SQL (MySQL, Azure SQL, or SQL Server) to enable ad-hoc analysis through SQL queries and visualizations.

---

## Business Questions Addressed

- **Service Requests Over Time:**  
  What are the trends in service requests from 2018 to 2021 on an annual and monthly basis?

- **Source Analysis:**  
  How are service requests distributed by their source?

- **Departmental Volume:**  
  Which departments receive the most service requests?

- **Response Time Performance:**  
  What are the top 10 cases with the fastest response times, categorized by request type and category?

- **Geographical Visualization:**  
  Which areas raised the most service requests?

- **Workload Comparison:**  
  How does the workload vary among different departments and work groups?

- **Response Time Analysis:**  
  What patterns or outliers exist in the response times of different departments?

- **Status Composition:**  
  How has the composition of service request statuses (open, closed, in progress) changed over time?

- **Time to Closure:**  
  Which categories have consistently longer closure times?

- **Workload Efficiency:**  
  What is the relationship between the number of service requests and efficiency (days to close)?

---

## Tech Stack

- **Alteryx:** Data profiling and ETL workflow
- **SQL (MySQL/Azure SQL/SQL Server):** Data staging and ad-hoc analysis
- **Power BI:** Business intelligence dashboard creation
- **Tableau:** Interactive data visualization
- **Git & GitHub:** Version control and collaboration

---

## Dataset Information

- **Source:** [311 Kansas City 2007–2021 Open Data](https://data.kcmo.org/311/311-Call-Center-Service-Requests-2007-March-2021/7at3-sxhp/about_data)
- **File:** `311_CallCenterServiceRequests_KansasCity_2007-March2021.tsv.zip` (zipped to meet GitHub’s file size limit)
- **Contents:** 311 Call Center service request records from 2007 to March 2021
- **Format:** TSV (after unzipping)

---

## How to Use This Project

1. **Clone the repository.**
   - git clone https://github.com/kunaltibe/urban-insight-kc311-analytics.git
2. **Data Preparation:**  
   - Unzip the dataset in the `Data/` folder to extract the TSV file.
3. **Data Profiling & ETL:**  
   - Open the Alteryx workflow (`.yxmd` file) to view how the dataset was profiled and loaded into the database.
4. **Staging:**  
   - Execute the SQL scripts in your chosen database platform to create the staging table and views.
5. **Visual Analysis:**  
   - Open the Power BI (`.pbix`) and Tableau (`.twb`/`.twbr`) files to explore the dashboards and gain insights.
6. **Analysis & Reporting:**  
   - Refer to the README notes and document observations and inferences as needed.

---

## Deliverables

- **Alteryx Workflow:** Data profiling and ETL process file.
- **SQL Scripts:** SQL queries used for data staging and view creation.
- **Power BI & Tableau Dashboards:** Interactive dashboards for visualizing business insights.
- **Dataset Documentation:** Zipped dataset with instructions in the `Data/README.md`.
- **Project Insights:** A comprehensive document (presented separately via Canvas) detailing the findings and business insights derived from the analysis.

---

## Author

**Kunal Tibe**  
Aspiring Data Engineer & Analytics Professional  
[LinkedIn](https://www.linkedin.com/in/kunal-tibe) | [GitHub](https://github.com/kunaltibe)

---

## License

This project is provided for academic and portfolio purposes. The dataset belongs to the Kansas City Open Data Portal.
