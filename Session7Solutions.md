## Databasstruktur

Se diagrammet [Session7Solution.png](Session7Solution.png) för den övergripande databasstrukturen.

## Constraints

### Samtliga tabeller med "PersonalIdentityNumber"
- Check: ISNUMERIC(PersonalIdentityNumber)

### Samtliga tabeller med "Salary"
- Check: Salary > 0

### Course
- Check: Points > 0
- Check: Start < [End]

### CourseInstructor
- Primary Key: CourseID, InstructorID (för att ha samma handledare på samma kurs
  högst en gång)

### Examination
- Check: Type IN ('assignment', 'test')

### StudentExamination
- Primary Key: StudentID, ExaminationID (för att ha samma student på samma
  examination högst en gång)
- Check: Grade IN ('IG', 'G', 'VG')
- Check: Points >= 0

### Session
- Check: Hour >= 0 AND Hour <= 23
- Unique: RoomID, Date, Hour (för att undvika dubbelbokningar)

## SQL-uttryck

1. Namn på samtliga kurser och vilka lärare som undervisar i dem.

```
SELECT
    Teacher.FirstName + ' ' + Teacher.LastName,
    Course.Name
FROM Teacher
JOIN Course ON Teacher.ID = Course.TeacherID
```

Exempelresultat:

    Severus Snape | Defence Against the Dark Arts

2. Namn på samtliga kurser och vilka handledare som handleder i dem.

```
SELECT
    Instructor.FirstName + ' ' + Instructor.LastName,
    Course.Name
FROM Instructor
JOIN CourseInstructor ON Instructor.ID = CourseInstructor.InstructorID
JOIN Course ON CourseInstructor.CourseID = Course.ID
```

Exempelresultat:

    Minerva McGonagall | Defence Against the Dark Arts

3. Namn på samtliga studenter samt kursnamn, betyg, poäng och typ på samtliga
   examinationer som de har gjort.

```
SELECT
    Student.FirstName + ' ' + Student.LastName,
    Course.Name,
    Examination.Type,
    StudentExamination.Points,
    StudentExamination.Grade
FROM Student
JOIN StudentExamination ON Student.ID = StudentExamination.StudentID
JOIN Examination ON StudentExamination.ExaminationID = Examination.ID
JOIN Course ON Examination.CourseID = Course.ID
```

Exempelresultat:

    Harry Potter | Defence Against the Dark Arts | test | 50 | VG

4. Namn på samtliga studenter samt vilka lärosalar de har lektioner i och vilka
   kurser som de läser i dessa lärosalar.

```
SELECT
    Student.FirstName + ' ' + Student.LastName,
    Course.Name,
    Room.Name
FROM Student
JOIN Curriculum ON Student.CurriculumID = Curriculum.ID
JOIN Course ON Curriculum.ID = Course.CurriculumID
JOIN Session ON Course.ID = Session.CourseID
JOIN Room ON Session.RoomID = Room.ID
```

Exempelresultat:

    Harry Potter | Defence Against the Dark Arts | 3C
