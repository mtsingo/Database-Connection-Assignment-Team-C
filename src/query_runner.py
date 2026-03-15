from queries import (
    students_by_lecturer_and_course,
    lecturers_by_expertise,
    courses_by_department,
    staff_by_department,
    lecturers_by_research_project
)


def run_query(query_name: str, params: dict):
    """
    Executes one of the predefined database queries based on the query name.

    Args:
        query_name (str): Name of the query selected in the GUI.
        params (dict): Parameters provided by the user for the query.

    Returns:
        tuple: Column headers and rows returned from the query.
    """

    if query_name == "Students in a course taught by a lecturer":
        rows = students_by_lecturer_and_course(
            params.get("LecturerFirstName"),
            params.get("LecturerLastName"),
            params.get("CourseName")
        )
        return ["StudentID", "FirstName", "LastName"], rows

    if query_name == "Lecturers by expertise":
        rows = lecturers_by_expertise(
            params.get("Expertise")
        )
        return ["LecturerID", "FirstName", "LastName"], rows

    if query_name == "Courses by department":
        rows = courses_by_department(
            params.get("Department")
        )
        return ["CourseName"], rows

    if query_name == "Staff by department":
        rows = staff_by_department(
            params.get("Department")
        )
        return ["StaffID", "FirstName", "LastName"], rows

    if query_name == "Lecturers by research project":
        rows = lecturers_by_research_project(
            params.get("ProjectTitle")
        )
        return ["LecturerID", "FirstName", "LastName"], rows

    return ["Info"], [["No results"]]