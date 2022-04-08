USE master

go

CREATE DATABASE [University DB Final]

go

USE [University DB Final]

go



CREATE TABLE Dim_Date(

    DateID                  int            IDENTITY(1,1),

    FullDateAlternateKey    date           NULL,

    DayNumberOfWeek         int            NULL,

    DayNameOfWeek           varchar(30)    NULL,

    DayNumberOfMonth        int            NULL,

    DayNumberOfYear         int            NULL,

    MonthName               varchar(30)    NULL,

    MonthNumberofYear       int            NULL,

    CalendarQuarter         varchar(30)    NULL,

    CalendarYear            int            NULL,

    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (DateID)

)



go





IF OBJECT_ID('Dim_Date') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Date >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'

go



/* 

 * TABLE: DimAddress 

 */



CREATE TABLE DimAddress(

    AddressID        int            IDENTITY(1,1),

    Country          varchar(50)    NULL,

    StateProvince    varchar(50)    NULL,

    City             varchar(50)    NULL,

    ZipCode          varchar(50)    NULL,

    CONSTRAINT PK17 PRIMARY KEY NONCLUSTERED (AddressID)

)



go





IF OBJECT_ID('DimAddress') IS NOT NULL

    PRINT '<<< CREATED TABLE DimAddress >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimAddress >>>'

go



/* 

 * TABLE: DimCollege 

 */



CREATE TABLE DimCollege(

    CollegeID       int            IDENTITY(1,1),

    CollegeName     varchar(30)    NOT NULL,

    UniversityID    int            NULL,

    AddressID       int            NULL,

    CONSTRAINT PK2_1_1 PRIMARY KEY NONCLUSTERED (CollegeID)

)



go





IF OBJECT_ID('DimCollege') IS NOT NULL

    PRINT '<<< CREATED TABLE DimCollege >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimCollege >>>'

go



/* 

 * TABLE: DimCourse 

 */



CREATE TABLE DimCourse(

    CourseID              int            IDENTITY(1,1),

    CourseEnrollmentID    int            NOT NULL,

    SemesterID            int            NOT NULL,

    FacultyID             int            NOT NULL,

    ProgramID             int            NOT NULL,

    CourseCode            varchar(10)    NULL,

    CourseName            varchar(80)    NOT NULL,

    CRNCode               varchar(80)    NULL,

    CreditHours           varchar(80)    NULL,

    Prerequisite          varchar(80)    NULL,

    isCoreCourse          char(10)       NOT NULL,

    Lab                   varchar(30)    NOT NULL,

    CampusName            varchar(40)    NULL,

    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (CourseID, CourseEnrollmentID)

)



go





IF OBJECT_ID('DimCourse') IS NOT NULL

    PRINT '<<< CREATED TABLE DimCourse >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimCourse >>>'

go



/* 

 * TABLE: DimCourseEnrollment 

 */



CREATE TABLE DimCourseEnrollment(

    CourseEnrollmentID    int            IDENTITY(1,1),

    EnrollmentStatus      varchar(30)    NULL,

    DropDate              int            NULL,

    EnrollmentDate        int            NULL,

    CONSTRAINT PK10_1 PRIMARY KEY NONCLUSTERED (CourseEnrollmentID)

)



go





IF OBJECT_ID('DimCourseEnrollment') IS NOT NULL

    PRINT '<<< CREATED TABLE DimCourseEnrollment >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimCourseEnrollment >>>'

go



/* 

 * TABLE: DimCourseSection 

 */



CREATE TABLE DimCourseSection(

    SectionID             int            IDENTITY(1,1),

    CourseID              int            NOT NULL,

    CourseEnrollmentID    int            NOT NULL,

    SectionName           varchar(80)    NULL,

    SectionNumber         int            NULL,

    RoomNo                varchar(10)    NULL,

    Building              varchar(10)    NULL,

    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (SectionID)

)



go





IF OBJECT_ID('DimCourseSection') IS NOT NULL

    PRINT '<<< CREATED TABLE DimCourseSection >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimCourseSection >>>'

go



/* 

 * TABLE: DimDept 

 */



CREATE TABLE DimDept(

    DeptID       int            IDENTITY(1,1),

    DeptName     varchar(30)    NULL,

    CollegeID    int            NULL,

    CONSTRAINT PK2_1 PRIMARY KEY NONCLUSTERED (DeptID)

)



go





IF OBJECT_ID('DimDept') IS NOT NULL

    PRINT '<<< CREATED TABLE DimDept >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimDept >>>'

go



/* 

 * TABLE: DimFaculty 

 */



CREATE TABLE DimFaculty(

    FacultyID         int             IDENTITY(1,1),

    FirstName         varchar(40)     NOT NULL,

    LastName          varchar(40)     NOT NULL,

    DOB               int             NULL,

    Gender            char(10)        NOT NULL,

    EmailId           varchar(60)     NOT NULL,

    PhoneNo           bigint          NOT NULL,

    DepartmentName    varchar(100)    NULL,

    isActive          char(10)        NOT NULL,

    DeptID            int             NULL,

    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (FacultyID)

)



go





IF OBJECT_ID('DimFaculty') IS NOT NULL

    PRINT '<<< CREATED TABLE DimFaculty >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimFaculty >>>'

go



/* 

 * TABLE: DimProgram 

 */



CREATE TABLE DimProgram(

    ProgramID      int             IDENTITY(1,1),

    ProgramName    varchar(100)    NULL,

    DegreeLevel    varchar(50)     NULL,

    Major          varchar(100)    NULL,

    DeptID         int             NULL,

    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (ProgramID)

)



go





IF OBJECT_ID('DimProgram') IS NOT NULL

    PRINT '<<< CREATED TABLE DimProgram >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimProgram >>>'

go



/* 

 * TABLE: DimSemester 

 */



CREATE TABLE DimSemester(

    SemesterID    int            IDENTITY(1,1),

    Name          varchar(30)    NULL,

    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (SemesterID)

)



go





IF OBJECT_ID('DimSemester') IS NOT NULL

    PRINT '<<< CREATED TABLE DimSemester >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimSemester >>>'

go



/* 

 * TABLE: DimStudent 

 */



CREATE TABLE DimStudent(

    StudentID         int             IDENTITY(1,1),

    NEUId             int             NOT NULL,

    FirstName         varchar(30)     NOT NULL,

    LastName          varchar(30)     NOT NULL,

    SSNNo             bigint          NULL,

    DOB               int             NULL,

    EmailId           varchar(100)    NOT NULL,

    PhoneNo           bigint          NOT NULL,

    Degree            varchar(100)    NOT NULL,

    Gender            varchar(10)     NULL,

    isActive          char(10)        NULL,

    ProgramID         int             NOT NULL,

    DeptID            int             NOT NULL,

    HomeAddID         int             NULL,

    OffCampusAddID    int             NULL,

    OnCampusAddID     int             NULL,

    CONSTRAINT PK11 PRIMARY KEY NONCLUSTERED (StudentID)

)



go





IF OBJECT_ID('DimStudent') IS NOT NULL

    PRINT '<<< CREATED TABLE DimStudent >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimStudent >>>'

go



/* 

 * TABLE: DimUniversity 

 */



CREATE TABLE DimUniversity(

    UniversityID      int            IDENTITY(1,1),

    UniversityName    varchar(30)    NOT NULL,

    AddressID         int            NULL,

    CONSTRAINT PK2_1_1_1 PRIMARY KEY NONCLUSTERED (UniversityID)

)



go





IF OBJECT_ID('DimUniversity') IS NOT NULL

    PRINT '<<< CREATED TABLE DimUniversity >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE DimUniversity >>>'

go



/* 

 * TABLE: Fact_Grades 

 */



CREATE TABLE Fact_Grades(

    GradesID              int         IDENTITY(1,1),

    StudentID             int         NOT NULL,

    SemesterID            int         NOT NULL,

    DateID                int         NOT NULL,

    CourseID              int         NOT NULL,

    CourseEnrollmentID    int         NOT NULL,

    MaxGrade              float       NULL,

    MinGrade              float       NULL,

    GPAHours              float       NULL,

    GPA                   float       NULL,

    Grade                 char(10)    NULL,

    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (GradesID)

)



go





IF OBJECT_ID('Fact_Grades') IS NOT NULL

    PRINT '<<< CREATED TABLE Fact_Grades >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Fact_Grades >>>'

go



/* 

 * TABLE: FactStudentAttendance 

 */



CREATE TABLE FactStudentAttendance(

    StudentID             int         NOT NULL,

    FacultyID             int         NOT NULL,

    CourseID              int         NOT NULL,

    CourseEnrollmentID    int         NOT NULL,

    AttendanceDateID      int         NULL,

    isPresent             char(10)    NOT NULL

)



go





IF OBJECT_ID('FactStudentAttendance') IS NOT NULL

    PRINT '<<< CREATED TABLE FactStudentAttendance >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE FactStudentAttendance >>>'

go



/* 

 * VIEW: vw_DimAttendanceDate 

 */



CREATE VIEW vw_DimAttendanceDate  AS

SELECT Di.DateID AttendanceDateID, Di.FullDateAlternateKey FullDateAlternateKey, Di.DayNumberOfWeek DayNumberOfWeek, Di.DayNameOfWeek DayNameOfWeek, Di.DayNumberOfMonth DayNumberOfMonth, Di.DayNumberOfYear DayNumberOfYear, Di.MonthName MonthName, Di.MonthNumberofYear MonthNumberofYear, Di.CalendarQuarter CalendarQuarter, Di.CalendarYear CalendarYear

FROM Dim_Date Di

go



IF OBJECT_ID('vw_DimAttendanceDate') IS NOT NULL

    PRINT '<<< CREATED VIEW vw_DimAttendanceDate >>>'

ELSE

    PRINT '<<< FAILED CREATING VIEW vw_DimAttendanceDate >>>'

go



/* 

 * VIEW: vw_DimDOBDate 

 */



CREATE VIEW vw_DimDOBDate  AS

SELECT Di.DateID DOB, Di.FullDateAlternateKey, Di.DayNumberOfWeek, Di.DayNameOfWeek, Di.DayNumberOfMonth, Di.DayNumberOfYear, Di.MonthName, Di.MonthNumberofYear, Di.CalendarQuarter, Di.CalendarYear

FROM Dim_Date Di

go



IF OBJECT_ID('vw_DimDOBDate') IS NOT NULL

    PRINT '<<< CREATED VIEW vw_DimDOBDate >>>'

ELSE

    PRINT '<<< FAILED CREATING VIEW vw_DimDOBDate >>>'

go



/* 

 * VIEW: vw_DimDropDate 

 */



CREATE VIEW vw_DimDropDate  AS

SELECT Di.DateID DropDate, Di.FullDateAlternateKey FullDateAlternateKey, Di.DayNumberOfWeek DayNumberOfWeek, Di.DayNameOfWeek DayNameOfWeek, Di.DayNumberOfMonth DayNumberOfMonth, Di.DayNumberOfYear DayNumberOfYear, Di.MonthName MonthName, Di.varch varch, Di.MonthNumberofYear MonthNumberofYear, Di.CalendarQuarter CalendarQuarter, Di.CalendarYear CalendarYear

FROM Dim_Date Di

go



IF OBJECT_ID('vw_DimDropDate') IS NOT NULL

    PRINT '<<< CREATED VIEW vw_DimDropDate >>>'

ELSE

    PRINT '<<< FAILED CREATING VIEW vw_DimDropDate >>>'

go



/* 

 * VIEW: vw_DimEnrollmentDate 

 */



CREATE VIEW vw_DimEnrollmentDate  AS

SELECT Di.DateID EnrollmentDate, Di.FullDateAlternateKey FullDateAlternateKey, Di.DayNumberOfWeek DayNumberOfWeek, Di.DayNameOfWeek DayNameOfWeek, Di.DayNumberOfMonth DayNumberOfMonth, Di.DayNumberOfYear DayNumberOfYear, Di.WeekNumberOfYear WeekNumberOfYear, Di.MonthName MonthName, Di.MonthNumberofYear MonthNumberofYear, Di.CalendarQuarter CalendarQuarter, Di.CalendarYear CalendarYear

FROM Dim_Date Di

go



IF OBJECT_ID('vw_DimEnrollmentDate') IS NOT NULL

    PRINT '<<< CREATED VIEW vw_DimEnrollmentDate >>>'

ELSE

    PRINT '<<< FAILED CREATING VIEW vw_DimEnrollmentDate >>>'

go



/* 

 * VIEW: vw_DimHomeTownAddress 

 */



CREATE VIEW vw_DimHomeTownAddress  AS

SELECT Di.AddressID HomeAddID, Di.Country, Di.StateProvince, Di.City, Di.ZipCode

FROM DimAddress Di

go



IF OBJECT_ID('vw_DimHomeTownAddress') IS NOT NULL

    PRINT '<<< CREATED VIEW vw_DimHomeTownAddress >>>'

ELSE

    PRINT '<<< FAILED CREATING VIEW vw_DimHomeTownAddress >>>'

go



/* 

 * VIEW: vw_DimOffCampusAddress 

 */



CREATE VIEW vw_DimOffCampusAddress  AS

SELECT Di.AddressID OffCampusAddID, Di.Country Country, Di.StateProvince StateProvince, Di.City City, Di.ZipCode ZipCode

FROM DimAddress Di

go



IF OBJECT_ID('vw_DimOffCampusAddress') IS NOT NULL

    PRINT '<<< CREATED VIEW vw_DimOffCampusAddress >>>'

ELSE

    PRINT '<<< FAILED CREATING VIEW vw_DimOffCampusAddress >>>'

go



/* 

 * VIEW: vw_DimOnCampusAddress 

 */



CREATE VIEW vw_DimOnCampusAddress  AS

SELECT Di.AddressID OnCampusAddID, Di.Country, Di.StateProvince, Di.City, Di.ZipCode

FROM DimAddress Di

go



IF OBJECT_ID('vw_DimOnCampusAddress') IS NOT NULL

    PRINT '<<< CREATED VIEW vw_DimOnCampusAddress >>>'

ELSE

    PRINT '<<< FAILED CREATING VIEW vw_DimOnCampusAddress >>>'

go



/* 

 * TABLE: DimCollege 

 */



ALTER TABLE DimCollege ADD CONSTRAINT RefDimUniversity42 

    FOREIGN KEY (UniversityID)

    REFERENCES DimUniversity(UniversityID)

go



ALTER TABLE DimCollege ADD CONSTRAINT RefDimAddress52 

    FOREIGN KEY (AddressID)

    REFERENCES DimAddress(AddressID)

go





/* 

 * TABLE: DimCourse 

 */



ALTER TABLE DimCourse ADD CONSTRAINT RefDimProgram6 

    FOREIGN KEY (ProgramID)

    REFERENCES DimProgram(ProgramID)

go



ALTER TABLE DimCourse ADD CONSTRAINT RefDimSemester7 

    FOREIGN KEY (SemesterID)

    REFERENCES DimSemester(SemesterID)

go



ALTER TABLE DimCourse ADD CONSTRAINT RefDimFaculty21 

    FOREIGN KEY (FacultyID)

    REFERENCES DimFaculty(FacultyID)

go



ALTER TABLE DimCourse ADD CONSTRAINT RefDimCourseEnrollment22 

    FOREIGN KEY (CourseEnrollmentID)

    REFERENCES DimCourseEnrollment(CourseEnrollmentID)

go





/* 

 * TABLE: DimCourseEnrollment 

 */



ALTER TABLE DimCourseEnrollment ADD CONSTRAINT RefDim_Date76 

    FOREIGN KEY (EnrollmentDate)

    REFERENCES Dim_Date(DateID)

go



ALTER TABLE DimCourseEnrollment ADD CONSTRAINT RefDim_Date78 

    FOREIGN KEY (DropDate)

    REFERENCES Dim_Date(DateID)

go





/* 

 * TABLE: DimCourseSection 

 */



ALTER TABLE DimCourseSection ADD CONSTRAINT RefDimCourse9 

    FOREIGN KEY (CourseID, CourseEnrollmentID)

    REFERENCES DimCourse(CourseID, CourseEnrollmentID)

go





/* 

 * TABLE: DimDept 

 */



ALTER TABLE DimDept ADD CONSTRAINT RefDimCollege43 

    FOREIGN KEY (CollegeID)

    REFERENCES DimCollege(CollegeID)

go





/* 

 * TABLE: DimFaculty 

 */



ALTER TABLE DimFaculty ADD CONSTRAINT RefDimDept56 

    FOREIGN KEY (DeptID)

    REFERENCES DimDept(DeptID)

go



ALTER TABLE DimFaculty ADD CONSTRAINT RefDim_Date12 

    FOREIGN KEY (DOB)

    REFERENCES Dim_Date(DateID)

go





/* 

 * TABLE: DimProgram 

 */



ALTER TABLE DimProgram ADD CONSTRAINT RefDimDept55 

    FOREIGN KEY (DeptID)

    REFERENCES DimDept(DeptID)

go





/* 

 * TABLE: DimStudent 

 */



ALTER TABLE DimStudent ADD CONSTRAINT RefDimDept54 

    FOREIGN KEY (DeptID)

    REFERENCES DimDept(DeptID)

go



ALTER TABLE DimStudent ADD CONSTRAINT RefDimAddress68 

    FOREIGN KEY (OnCampusAddID)

    REFERENCES DimAddress(AddressID)

go



ALTER TABLE DimStudent ADD CONSTRAINT RefDimAddress69 

    FOREIGN KEY (OffCampusAddID)

    REFERENCES DimAddress(AddressID)

go



ALTER TABLE DimStudent ADD CONSTRAINT RefDimAddress70 

    FOREIGN KEY (HomeAddID)

    REFERENCES DimAddress(AddressID)

go



ALTER TABLE DimStudent ADD CONSTRAINT RefDim_Date17 

    FOREIGN KEY (DOB)

    REFERENCES Dim_Date(DateID)

go



ALTER TABLE DimStudent ADD CONSTRAINT RefDimProgram23 

    FOREIGN KEY (ProgramID)

    REFERENCES DimProgram(ProgramID)

go





/* 

 * TABLE: DimUniversity 

 */



ALTER TABLE DimUniversity ADD CONSTRAINT RefDimAddress51 

    FOREIGN KEY (AddressID)

    REFERENCES DimAddress(AddressID)

go





/* 

 * TABLE: Fact_Grades 

 */



ALTER TABLE Fact_Grades ADD CONSTRAINT RefDimStudent10 

    FOREIGN KEY (StudentID)

    REFERENCES DimStudent(StudentID)

go



ALTER TABLE Fact_Grades ADD CONSTRAINT RefDimSemester11 

    FOREIGN KEY (SemesterID)

    REFERENCES DimSemester(SemesterID)

go



ALTER TABLE Fact_Grades ADD CONSTRAINT RefDim_Date24 

    FOREIGN KEY (DateID)

    REFERENCES Dim_Date(DateID)

go



ALTER TABLE Fact_Grades ADD CONSTRAINT RefDimCourse25 

    FOREIGN KEY (CourseID, CourseEnrollmentID)

    REFERENCES DimCourse(CourseID, CourseEnrollmentID)

go



ALTER TABLE Fact_Grades ADD CONSTRAINT RefDimCourseEnrollment82 

    FOREIGN KEY (CourseEnrollmentID)

    REFERENCES DimCourseEnrollment(CourseEnrollmentID)

go





/* 

 * TABLE: FactStudentAttendance 

 */



ALTER TABLE FactStudentAttendance ADD CONSTRAINT RefDimStudent1 

    FOREIGN KEY (StudentID)

    REFERENCES DimStudent(StudentID)

go



ALTER TABLE FactStudentAttendance ADD CONSTRAINT RefDimFaculty4 

    FOREIGN KEY (FacultyID)

    REFERENCES DimFaculty(FacultyID)

go



ALTER TABLE FactStudentAttendance ADD CONSTRAINT RefDimCourse5 

    FOREIGN KEY (CourseID, CourseEnrollmentID)

    REFERENCES DimCourse(CourseID, CourseEnrollmentID)

go



ALTER TABLE FactStudentAttendance ADD CONSTRAINT RefDim_Date79 

    FOREIGN KEY (AttendanceDateID)

    REFERENCES Dim_Date(DateID)

go





