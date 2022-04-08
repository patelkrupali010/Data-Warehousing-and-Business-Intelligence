USE [University DB Final]
GO


BULK INSERT dbo.Dim_Date
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\date_dimension.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

GO

BULK INSERT dbo.DimAddress
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\addr.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

GO

BULK INSERT dbo.DimUniversity
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\uni.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

GO

BULK INSERT dbo.DimCollege
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\college.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

GO


BULK INSERT dbo.DimDept
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\dept.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

GO



BULK INSERT dbo.DimProgram
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\program.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT dbo.DimStudent
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\student.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT dbo.DimSemester
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\sem.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT dbo.DimCourseEnrollment
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\courseEnrollment.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT dbo.DimCourse
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\course.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT dbo.DimCourseSection
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\section.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT dbo.Fact_Grades
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\grades.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT dbo.FactStudentAttendance
FROM 'C:\Users\krupa\Desktop\DWBI\Team Assignment 1\University Model\attendance.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)