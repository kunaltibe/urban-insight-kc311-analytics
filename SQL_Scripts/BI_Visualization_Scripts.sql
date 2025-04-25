CREATE DATABASE DAMG7370
USE DAMG7370

SELECT * FROM CallCenterServiceRequests

SELECT COUNT(*) AS ROW_COUNT
FROM CallCenterServiceRequests

-- Q1. Service Requests Over Time:
-- What is the overall trend in Service Requests over the years 2018-2021?
-- How have Service Requests changed on a monthly basis?

GO
CREATE VIEW ViewServiceRequestsOverTime AS 
SELECT YEAR("CREATION_DATE") AS "Year", MONTH("CREATION_DATE") AS "Month", COUNT("CASE ID") AS "Total Service Requests"
FROM [CallCenterServiceRequests]
WHERE "CREATION_DATE" BETWEEN '2018-01-01' AND '2021-12-31'
GROUP BY YEAR("CREATION_DATE"), MONTH("CREATION_DATE");
GO
SELECT * FROM ViewServiceRequestsOverTime ORDER BY [Year],[Month];
GO

-- Q2. Volume of service requests received from different sources:
-- What is the overall trend in Service Requests over Sources?

CREATE VIEW ViewVolumeOverSources AS
SELECT "SOURCE", YEAR("CREATION_DATE") AS "Year",COUNT("CASE ID") AS "Total Service Requests"
FROM [CallCenterServiceRequests]
GROUP BY "SOURCE",YEAR("CREATION_DATE")
GO
SELECT * FROM ViewVolumeOverSources ORDER BY [SOURCE] , [Year];
GO

-- Q3. Volume of service requests received by Department:
-- What is the overall trend in Service Requests received by Departments?

CREATE VIEW ViewVolumeByDepartment AS
SELECT "DEPARTMENT", YEAR("CREATION_DATE") AS "Year", COUNT("CASE ID") AS "Total Service Requests"
FROM [CallCenterServiceRequests]
GROUP BY "DEPARTMENT",YEAR("CREATION_DATE");
GO
SELECT * FROM ViewVolumeByDepartment ORDER BY [DEPARTMENT], [Year];
GO

-- Q4. Top 10 Performance Metrics (Response Time) per CATEGORY and Type of Request:
-- What are the top 10 cases whose response time was fastest? Categorize it with Category1 and Type of Request?

CREATE VIEW ViewTop10PerformanceMetrics AS
SELECT  "CASE ID", "CATEGORY1", "TYPE", MIN("DAYS TO CLOSE") AS "Fastest Response Time"
FROM [CallCenterServiceRequests]
WHERE "DAYS TO CLOSE" >= 0
GROUP BY "CATEGORY1", "TYPE", "CASE ID";
GO
SELECT TOP 10 * FROM ViewTop10PerformanceMetrics ORDER BY "Fastest Response Time" ASC;
GO

-- Q5. Geographical Visualization:
-- What are the Top 10 areas where most number of request were raised?

CREATE VIEW ViewTop10GeographicalVisualization AS
SELECT  "ZIP CODE", COUNT("CASE ID") AS "Total Service Requests"
FROM [CallCenterServiceRequests]
GROUP BY "ZIP CODE"
GO
SELECT TOP 10 * FROM ViewTop10GeographicalVisualization ORDER BY [Total Service Requests] DESC

-- Q6. Departmental Workload Comparison:
-- How does the workload vary among different departments and work groups?

GO
CREATE VIEW ViewDepartmentalWorkload AS
SELECT "DEPARTMENT", "WORK GROUP", COUNT("CASE ID") AS "Total Service Requests"
FROM [CallCenterServiceRequests]
GROUP BY "DEPARTMENT", "WORK GROUP";
GO
SELECT * FROM ViewDepartmentalWorkload ORDER BY [DEPARTMENT]
GO

-- Q7. Response Time Analysis:
-- Visualize the distribution of response times for each department. Are there any outliers or patterns in response times?

CREATE VIEW ViewResponseTimeAnalysis AS
SELECT "DEPARTMENT", AVG("DAYS TO CLOSE") as "AVG_RESPONSETIME", MIN("DAYS TO CLOSE") AS "MIN_RESPONSETIME", MAX("DAYS TO CLOSE") AS "MAX_RESPONSETIME",
COUNT("CASE ID") AS "Total Service Requests"
FROM [CallCenterServiceRequests]
GROUP BY "DEPARTMENT";
GO
SELECT * FROM ViewResponseTimeAnalysis ORDER BY [DEPARTMENT]
GO

-- Q8. Service Request Status Composition:
-- Create a visualization to show the composition of service request statuses (open, closed, in progress). How has this composition changed over the years 2018-2021?

CREATE VIEW ViewStatusComposition AS
SELECT YEAR("CREATION_DATE") AS "YEAR", STATUS, COUNT("CASE ID") AS "Total Service Requests"
FROM [CallCenterServiceRequests]
WHERE "CREATION_DATE" BETWEEN '2018-01-01' AND '2021-12-31' AND [STATUS] IN ('ASSIG', 'OPEN','RESOL')
GROUP BY YEAR("CREATION_DATE"), STATUS;
GO
SELECT * FROM ViewStatusComposition ORDER BY [YEAR], [STATUS];
GO

-- Q9. Time to Closure Analysis:
-- Visualize the average days to close service requests for each category1. Are there categories with consistently longer closure times?

CREATE VIEW ViewTimeToClosure AS
SELECT TOP 10 CATEGORY1, AVG("DAYS TO CLOSE") AS AVG_DaysToClose
FROM [CallCenterServiceRequests]
GROUP BY CATEGORY1
GO
SELECT * FROM ViewTimeToClosure ORDER BY AVG_DaysToClose DESC;
GO

-- Q10. Workload Efficiency:
-- Create a visualization to show the relationship between workload (number of service requests) and efficiency (days to close) for each department?

CREATE VIEW ViewWorkloadEfficiency AS
SELECT "DEPARTMENT", COUNT("CASE ID") AS "Total Service Requests", AVG("DAYS TO CLOSE") AS AVG_DaysToClose
FROM [CallCenterServiceRequests]
GROUP BY DEPARTMENT;
GO
SELECT * FROM ViewWorkloadEfficiency