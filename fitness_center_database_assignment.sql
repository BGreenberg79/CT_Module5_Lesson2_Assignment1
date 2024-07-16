CREATE DATABASE fitness_center_database_assignment;

CREATE TABLE Members (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE WorkoutSessions (
    session_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(id),
    session_date DATE NOT NULL,
    session_time VARCHAR(50) NOT NULL,
    activity VARCHAR(255)
);
/* Made some slight changes to tables when copying over assignments.
I made some categories that I felt were essential as NOT NULL and I also made sure both tables' primary keys were set to be auto-incrementing.

Task 1: SQL Data Insertion
*/
INSERT INTO Members (name, age)
VALUES ('Jane Doe', 35),
('John Smith', 52),
('Matt Jones', 45),
('Sarah Williams', 26);

INSERT INTO WorkoutSessions (member_id, session_date, session_time, activity)
VALUES (1, '2024-03-31', '08:00 AM', 'Spin Cycling'),
(3, '2024-02-25', '06:00 PM', 'Bench Press and Chest Day'),
(4, '2024-06-15', '07:00 AM', 'Agility Drills'),
(2, '2024-07-01', '08:00 PM', 'Basketball'),
(4, '2024-06-20', '07:30 PM', 'Boxing'),
(3, '2024-05-03', '04:00 PM', 'Squats and Leg Day');

-- Used Syntax of INSERT INTO table_name (column_names) VALUES (data for columns) to insert values into our two tables

-- Task 2 SQL Data Update
SELECT * FROM WorkoutSessions;
SELECT * FROM Members;

UPDATE WorkoutSessions
SET session_time = '08:00 PM'
WHERE member_id = 1 AND session_id = 1;

/* Used syntax of UPDATE table_name SET column_name = value WHERE conditions to
appropriately adjust Jane Doe's (member_id = 1) workout session time from 8:00 AM in the morning
to 8:00 PM at night */

-- Task 3 SQL Data Deletion
SELECT * FROM WorkoutSessions;
SELECT * FROM Members;

DELETE FROM WorkoutSessions 
WHERE member_id = 2;
DELETE FROM Members
WHERE id = 2;

/* To be able to cancel John Smith's gym membership I first had to remove his workout session history as member_id is a foreign key in WorkoutSessions table that references the Members table
To do this I used the syntax DELETE FROM table_name WHERE condition, and I used this same syntax a second time on the Members table once its first instance was executed.
After executing both Deletion statements John Smith (member id = 2) was removed from both tables and his membership was canceled.
I did not need to SET SQL_SAFE_UPDATES = 0 and back to 1 because both deletion statements involved a condition based on keys (a foreign key for WorkoutSessions and a primary key for Members)*/
