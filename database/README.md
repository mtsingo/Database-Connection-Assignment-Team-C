Database files for the project.

The queries we decided on:
•⁠  ⁠Find all students enrolled in a specific course taught by a particular lecturer WORKS
•⁠  ⁠Search for lecturers with expertise in a particular area WORKS
•⁠  ⁠List all courses taught by lecturers in a specific department WORKS
•⁠  ⁠Find all staff members employed in a specific department WORKS
•⁠  ⁠⁠find all lecturers who work for a particular research project WORKS

**Following are the tested working SQL queries**:

SELECT lecturer.lecturerID, lecturer.firstName, lecturer.lastName
FROM lecturer
JOIN lecturer_has_areasOfExpertise
  ON lecturer_has_areasOfExpertise.lecturer_lecturerID = lecturer.lecturerID
JOIN areasOfExpertise
  ON areasOfExpertise.areasOfExpertiseID = lecturer_has_areasOfExpertise.areasOfExpertise_areasOfExpertiseID
WHERE areasOfExpertise.expertise = "Databases";

SELECT staff.staffid, staff.firstName, staff.lastName
FROM staff
JOIN department
ON department.departmentID = staff.departmentID
WHERE department.name = "Chemistry";

SELECT lecturer.lecturerID, lecturer.firstName, lecturer.lastName
FROM lecturer
JOIN lecturerInResearchGroup
  ON lecturerInResearchGroup.lecturer_lecturerID = lecturer.lecturerID
JOIN researchProject
  ON researchProject.researchGroupID = lecturerInResearchGroup.researchGroupID
WHERE researchProject.projectTitle = "Quantum Materials Simulation";

SELECT DISTINCT student.studentID, student.firstName, student.lastname
FROM student
JOIN enrollment
ON enrollment.studentID = student.studentID
JOIN teaches
ON teaches.courseID = enrollment.courseID
JOIN lecturer
ON teaches.courseID = lecturer.lecturerID
WHERE lecturer.firstName = "Charles" AND lecturer.lastName = "Evans";

SELECT DISTINCT course.name
FROM course
JOIN teaches
  ON teaches.courseID = course.courseID
JOIN lecturer
  ON lecturer.lecturerID = teaches.lecturerID
JOIN department
  ON lecturer.departmentID = department.departmentID
WHERE department.name = "Biology";
