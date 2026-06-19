-- 1. Create structural course table (Requirement R07/R62)
CREATE TABLE IF NOT EXISTS courses (
    course_id VARCHAR(2) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 2. Create core domain question table (Requirement R08/R63/R64/R65)
CREATE TABLE IF NOT EXISTS questions (
    question_id VARCHAR(5) PRIMARY KEY, -- 3-digit Question ID + 2-digit Course ID
    text TEXT NOT NULL,
    instructions TEXT,
    difficulty ENUM('EASY', 'MEDIUM', 'HARD') NOT NULL,
    topic VARCHAR(100) NOT NULL,
    course_id VARCHAR(2),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 3. Create question options table with exactly 1 correct option (Requirement R05/R119)
CREATE TABLE IF NOT EXISTS question_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_id VARCHAR(5),
    answer_text TEXT NOT NULL,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(question_id) ON DELETE CASCADE
);

-- Populate Course mappings
INSERT INTO courses (course_id, name) VALUES 
('11', 'Introduction to Computer Science'),
('22', 'Discrete Mathematics');

-- Insert 6 compliant question records [cite: 609, 610]
INSERT INTO questions (question_id, text, instructions, difficulty, topic, course_id) VALUES
('00111', 'What is the time complexity of searching in a perfectly balanced Binary Search Tree (BST)?', 'Choose the single most accurate asymptotic upper bound.', 'MEDIUM', 'Data Structures', '11'),
('00211', 'Which of the following data structures operates strictly on a Last-In, First-Out (LIFO) basis?', 'Select the correct foundational abstract data type.', 'EASY', 'Data Structures', '11'),
('00311', 'What occurs when a Java subclass defines a method with the exact same signature as a method in its superclass?', 'Assume standard object-oriented programming behavior.', 'MEDIUM', 'Object-Oriented Programming', '11'),
('00122', 'Let A and B be finite sets. If |A| = 4 and |B| = 3, how many unique relations can be defined from set A to set B?', 'Apply foundational set theory definitions.', 'HARD', 'Set Theory', '22'),
('00222', 'In graph theory, a tree is defined as an undirected graph that satisfies which of the following properties?', 'Select the definitive structural criteria.', 'EASY', 'Graph Theory', '22'),
('00322', 'Which of the following propositions is logically equivalent to the conditional statement p -> q?', 'Apply standard logical equivalences.', 'MEDIUM', 'Propositional Logic', '22');

-- Populate answers per question
INSERT INTO question_answers (question_id, answer_text, is_correct) VALUES
('00111', 'O(1)', FALSE), ('00111', 'O(log n)', TRUE), ('00111', 'O(n)', FALSE), ('00111', 'O(n log n)', FALSE),
('00211', 'Queue', FALSE), ('00211', 'Stack', TRUE), ('00211', 'Singly Linked List', FALSE), ('00211', 'Binary Tree', FALSE),
('00311', 'Method Overloading', FALSE), ('00311', 'Method Overriding', TRUE), ('00311', 'Compilation Error', FALSE), ('00311', 'Encapsulation Violation', FALSE),
('00122', '12', FALSE), ('00122', '64', FALSE), ('00122', '4096', TRUE), ('00122', '24', FALSE),
('00222', 'Connected and contains no cycles', TRUE), ('00222', 'Disconnected and contains at least one cycle', FALSE), ('00222', 'Complete and directed', FALSE), ('00222', 'Bipartite and regular', FALSE),
('00322', 'q -> p', FALSE), ('00322', 'not p or q', TRUE), ('00322', 'p and not q', FALSE), ('00322', 'not p and not q', FALSE);