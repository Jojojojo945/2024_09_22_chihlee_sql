CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(10),
    age smallint
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id smallint REFERENCES students(student_id),
    course_name VARCHAR(20),
    grade VARCHAR(5)
);

INSERT INTO students (name, age) VALUES
    ('張小明', 20),
    ('李美華', 19),
    ('王大寶', 21),
    ('陳雅婷', 20),
    ('林志偉', 22);