-- Questão 1 Crie uma relação a partir da união das tabelas student e takes --
SELECT * FROM student JOIN takes on student.ID = takes.ID ;

--Questão 2. Contar a quantidade de cursos realizados pelos alunos do departamento de Civil Eng. --
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
--Ordenar de maneira descendente a quantidade de cursos associada aos alunos. --
	ORDER BY 
    qtd_cursos DESC;

-- Questão 3. Criar uma view chamada 'civil_eng_students' a partir da relação construída na Questão 2. --
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

--Acessando a View--
SELECT * FROM civil_eng_students
ORDER BY qtd_cursos DESC;

	
