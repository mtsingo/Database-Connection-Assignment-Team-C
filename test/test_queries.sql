USE college_db_EMA;
SELECT * FROM student;
SELECT * FROM enrollment;
SELECT s.studentID, s.firstName, s.lastName
FROM student s
JOIN enrollment e ON s.studentID = e.studentID;
SELECT s.studentID, s.firstName, s.lastName, e.courseID, t.lecturerID
FROM student s
JOIN enrollment e ON s.studentID = e.studentID
JOIN teaches t ON e.courseID = t.courseID
WHERE t.lecturerID = 1;
SELECT l.firstName, l.lastName, a.expertise
FROM lecturer l
JOIN lecturer_has_areasOfExpertise la 
ON l.lecturerID = la.lecturer_lecturerID
JOIN areasOfExpertise a 
ON la.areasOfExpertise_areasOfExpertiseID = a.areasOfExpertiseID;
USE college_db_EMA;

-- Query 1: Students taught by a lecturer
SELECT s.studentID, s.firstName, s.lastName, e.courseID, t.lecturerID
FROM student s
JOIN enrollment e ON s.studentID = e.studentID
JOIN teaches t ON e.courseID = t.courseID
WHERE t.lecturerID = 1;

-- Query 2: Lecturers and expertise
SELECT l.firstName, l.lastName, a.expertise
FROM lecturer l
JOIN lecturer_has_areasOfExpertise la 
ON l.lecturerID = la.lecturer_lecturerID
JOIN areasOfExpertise a 
ON la.areasOfExpertise_areasOfExpertiseID = a.areasOfExpertiseID;

-- Query 3: Courses by department
SELECT c.name, l.departmentID
FROM course c
JOIN teaches t ON c.courseID = t.courseID
JOIN lecturer l ON t.lecturerID = l.lecturerID;

-- Query 4: Staff by department
SELECT firstName, lastName, jobTitle, departmentID
FROM staff;

-- Query 5: Lecturers by research project
SELECT l.firstName, l.lastName, rp.projectTitle
FROM lecturer l
JOIN lecturerInResearchGroup lg 
ON l.lecturerID = lg.lecturer_lecturerID
JOIN researchProject rp 
ON lg.researchGroupID = rp.researchGroupID;

-- Negative testing (EXPECTED TO FAIL)
INSERT INTO student (studentID) VALUES (1);
INSERT INTO enrollment (studentID, courseID) VALUES (999, 999);

-- Validation: students with multiple courses
SELECT studentID, COUNT(*) 
FROM enrollment
GROUP BY studentID
HAVING COUNT(*) > 1;