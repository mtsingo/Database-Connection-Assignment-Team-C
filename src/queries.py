from db import get_connection


def run_query(sql, params=None):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(sql, params or ())
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return rows


def students_by_lecturer_and_course(first_name, last_name, course_name):
    sql = """
    SELECT DISTINCT s.studentID, s.firstName, s.lastName
    FROM student s
    JOIN enrollment e
        ON e.studentID = s.studentID
    JOIN teaches t
        ON t.courseID = e.courseID
    JOIN lecturer l
        ON t.lecturerID = l.lecturerID
    JOIN course c
        ON c.courseID = e.courseID
    WHERE l.firstName = %s
      AND l.lastName = %s
      AND c.name = %s
    """
    return run_query(sql, (first_name, last_name, course_name))


def lecturers_by_expertise(expertise):
    sql = """
    SELECT l.lecturerID, l.firstName, l.lastName
    FROM lecturer l
    JOIN lecturer_has_areasOfExpertise la
        ON la.lecturer_lecturerID = l.lecturerID
    JOIN areasOfExpertise a
        ON a.areasOfExpertiseID = la.areasOfExpertise_areasOfExpertiseID
    WHERE a.expertise = %s
    """
    return run_query(sql, (expertise,))


def courses_by_department(department_name):
    sql = """
    SELECT DISTINCT c.name
    FROM course c
    JOIN teaches t
        ON t.courseID = c.courseID
    JOIN lecturer l
        ON l.lecturerID = t.lecturerID
    JOIN department d
        ON l.departmentID = d.departmentID
    WHERE d.name = %s
    """
    return run_query(sql, (department_name,))


def staff_by_department(department_name):
    sql = """
    SELECT s.staffID, s.firstName, s.lastName
    FROM staff s
    JOIN department d
        ON d.departmentID = s.departmentID
    WHERE d.name = %s
    """
    return run_query(sql, (department_name,))


def lecturers_by_research_project(project_title):
    sql = """
    SELECT l.lecturerID, l.firstName, l.lastName
    FROM lecturer l
    JOIN lecturerInResearchGroup lg
        ON lg.lecturer_lecturerID = l.lecturerID
    JOIN researchProject rp
        ON rp.researchGroupID = lg.researchGroupID
    WHERE rp.projectTitle = %s
    """
    return run_query(sql, (project_title,))