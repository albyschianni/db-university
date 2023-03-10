### Query
#### Group By
1. Contare quanti iscritti ci sono stati ogni anno
```sql
SELECT YEAR(enrolment_date), COUNT(*)
FROM students
GROUP BY YEAR(enrolment_date);
```

2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
```sql
SELECT office_address, COUNT(*)
FROM teachers
GROUP BY office_address;
```

3. Calcolare la media dei voti di ogni appello d'esame
```sql
SELECT exam_id, AVG(vote)
FROM exam_student
GROUP BY exam_id;
```

4. Contare quanti corsi di laurea ci sono per ogni dipartimento
```sql
SELECT department_id, COUNT(*)
FROM degrees
GROUP BY department_id;
```

#### Join
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
```sql
SELECT students.* 
FROM students 
	JOIN degrees 
	ON students.degree_id = degrees.id 
WHERE degrees.name LIKE 'Corso di Laurea in Economia';
```

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
```sql
SELECT * 
FROM departments 
	JOIN degrees 
	ON departments.id = degrees.department_id 
WHERE degrees.level LIKE 'magistrale' 
AND departments.name LIKE 'Dipartimento di Neuroscienze';
```

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
```sql
SELECT courses.* 
FROM teachers
	JOIN course_teacher
		ON teachers.id = course_teacher.teacher_id
	JOIN courses
		ON course_teacher.course_id = courses.id
WHERE teachers.name LIKE "Fulvio";
	AND teachers.surname LIKE "Amato";
```

4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
```sql
SELECT * 
FROM students
	JOIN degrees
	ON students.degree_id = degree.id
	JOIN departments
	ON degrees.department_id = departments.id = degree.id
ORDER BY syudents.surname, students.name;
```

##### BONUS
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
```sql
SELECT * 
FROM degrees
	JOIN courses
		ON degrees.id = courses.degree_id
	JOIN course_teacher
		ON courses.id = course_teacher.course_id
	JOIN teachers
		ON course_teacher.teacher_id = teachers.id

```

6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
```sql
SELECT DISTINCT teachers.* 
FROM departments
	JOIN degrees
		ON departments.id = degrees.department_id
	JOIN courses
		ON degrees.id = courses.degree_id
	JOIN course_teacher
		ON courses.id = course_teacher.course_id
	JOIN teachers
		ON course_teacher.teacher_id = teachers.id
	WHERE departments.name LIKE "Dipartimento di Matematica";
```

7. Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
```sql
SELECT students.*, exam_student.exam_id,COUNT(*), MAX(exam_student.vote) AS 'max_vote'
FROM students
	JOIN exam_student
		ON students.id = exam_student.student_id
	JOIN exams
		ON exam_student.exam_id = exams.id
GROUP BY students.id, exams.course_id
HAVING max_vote >= 18;
```