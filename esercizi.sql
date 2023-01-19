1. Selezionare tutti gli studenti nati nel 1990 (160)
```sql
SELECT * 
FROM students 
WHERE date_of_birth >= '1990-01-01' 
AND date_of_birth <= '1990-12-31';
```

2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
```sql
SELECT * 
FROM courses 
WHERE cfu >'10';
```

3. Selezionare tutti gli studenti che hanno più di 30 anni
```sql

```

4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
```sql
SELECT * 
FROM courses 
WHERE period = 'I semestre' 
AND year = '1';
```

5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
```sql
SELECT * 
FROM exams 
WHERE hour >= '14:00:00' 
AND date = '2020-06-20';
```

6. Selezionare tutti i corsi di laurea magistrale (38)
```sql
SELECT * 
FROM degrees 
WHERE name 
LIKE '%Magistrale%';
```

7. Da quanti dipartimenti è composta l'università? (12)
```sql
SELECT* 
FROM departments;
```

8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
```sql
SELECT * 
FROM teachers 
WHERE phone IS NULL;
```
