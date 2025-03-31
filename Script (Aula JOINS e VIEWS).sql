SELECT * FROM student JOIN takes on student.ID = takes.ID ;

SELECT 
    st.ID,
    st.name,
    COUNT(takes.course_id) AS qtd_cursos
FROM 
    (SELECT * FROM student s WHERE s.dept_name = 'Civil Eng.') st
LEFT OUTER JOIN 
    takes ON st.ID = takes.ID
    GROUP BY 
    st.ID, st.name
	ORDER BY 
    qtd_cursos DESC;

CREATE VIEW civil_eng_students as
SELECT
	st.ID,
	st.name,
	COUNT(takes.course_id) AS qtd_cursos
FROM 
	(SELECT * FROM student s WHERE s.dept_name = 'Civil Eng.' ) st
LEFT OUTER JOIN
	takes ON st.ID = takes.ID
	GROUP BY 
	st.ID, st.name;

SELECT * FROM civil_eng_students
ORDER BY qtd_cursos DESC;

	