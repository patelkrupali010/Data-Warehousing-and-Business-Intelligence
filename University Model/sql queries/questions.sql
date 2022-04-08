
--1.

select
p.ProgramName,
CASE
When c.isCoreCourse = 'NO' THEN 'Elective Course' ELSE 'Core Course' end AS 'Course Type',
c.CourseName 'Course Name',
c.Prerequisite 'Prerequisite Course'
from DimCourse c JOIN DimProgram p
ON c.ProgramID = p.ProgramID

-- 2
SELECT
s.NEUId 'Student ID',
(s.FirstName+' '+s.LastName) 'Student Name',
(c.[CourseName] +' , '+ cs.[SectionName]) 'classes',
f.[Grade] 'Grade'
FROM FactGrades f
JOIN DimStudent s ON f.[StudentID] = s.[StudentID]
JOIN DimCourse c
ON f.[CourseID] = c.[CourseID]
JOIN [DimCourseSection] cs
ON f.[CourseID] = cs.[CourseID]

--3
select distinct
startDate.FullDateAlternateKey as 'Start Date',dropDate.FullDateAlternateKey as 'Drop Date', sem.Name as 'Semester', c.CourseName
from DimCourse c
join DimCourseEnrollment e on c.CourseEnrollmentID=e.CourseEnrollmentID
join DimDate startDate on e.EnrollmentDate=startDate.DateID
join DimDate dropDate on e.DropDate=dropDate.DateID 
join DimSemester sem on c.SemesterID=sem.SemesterID


--4
select c.CourseName as 'Course Name', (f.FirstName +' '+f.LastName) as 'Faculty Name' ,
sec.SectionName 'Section',
sem.Name as 'Semester'
from DimCourseEnrollment e
join DimCourse c on e.CourseEnrollmentID = c.CourseEnrollmentID
join DimSemester sem on sem.SemesterID = c.SemesterID
join DimFaculty f on f.FacultyID = c.FacultyID
join DimCourseSection sec on c.CourseID = sec.CourseID;

--5
select c.CourseName as 'Course Name',
sec.SectionName 'Section',
sem.Name as 'Semester'
from DimCourseEnrollment e
join DimCourse c on e.CourseEnrollmentID = c.CourseEnrollmentID
join DimSemester sem on sem.SemesterID = c.SemesterID
join DimCourseSection sec on c.CourseID = sec.CourseID;

--6
select distinct
sem.Name as 'Semester'
,STRING_AGG(CONCAT(f.FirstName, ' ', f.LastName) ,' , ') as 'Faculty Name' , p.ProgramName,
c.CourseName 'Course Name'
from DimCourse c
join DimFaculty f on c.FacultyID = f.FacultyID
join DimCourseEnrollment e on e.CourseEnrollmentID = c.CourseEnrollmentID
join DimSemester sem on c.SemesterID = sem.SemesterID
inner join DimProgram p on p.ProgramID = c.ProgramID
group by sem.Name, p.ProgramName, c.CourseName;

--7
SELECT
s.FirstName+' '+s.LastName 'Student Name',
ISNULL(p.ProgramName,'Not Enrolled') as 'Program',
s.EmailId,
oa.City+' '+oa.StateProvince+', '+oa.Country 'Off Campus Address',
ca.City+' '+ca.StateProvince+', '+ca.Country 'On Campus Address',
ha.City+' '+ha.StateProvince+', '+ha.Country 'HomeTownAddress Address',
s.PhoneNo,
d.FullDateAlternateKey 'Date Of Birth'
FROM DimStudent s JOIN DimProgram p ON
s.ProgramID = p.ProgramID
JOIN DimDate d ON s.DOB = d.DateID
JOIN vw_DimOffCampusAddress oa ON oa.OffCampusAddID = s.OffCampusAddID
JOIN vw_DimOnCampusAddress ca ON ca.OnCampusAddID = s.OnCampusAddID
JOIN vw_DimHomeTownAddress ha ON ha.HomeAddID = s.HomeAddID;