/* =========================================================
   Day 1 Basic Queries
   Topic: SELECT / WHERE / ORDER BY / LIMIT
   Tables assumed:
     - students(id, name, age, major, gpa)
     - employees(id, name, department, salary, hired_at)
     - products(id, name, category, price, stock)
     - orders(id, customer_name, order_date, total_amount)
   ========================================================= */

/* 1) 모든 학생 행 조회 (연습용 가장 기본) */
SELECT * FROM students;

/* 2) 학생의 이름과 전공만 조회 */
SELECT name, major
FROM students;

/* 3) 20살 이상 학생만 조회 (기본 WHERE) */
SELECT id, name, age
FROM students
WHERE age >= 20;

/* 4) 전공이 'Mathematics'인 학생 */
SELECT name, major, gpa
FROM students
WHERE major = 'Mathematics';

/* 5) 이름이 A로 시작하는 학생 (LIKE, prefix) */
SELECT id, name
FROM students
WHERE name LIKE 'A%';

/* 6) 이름에 'an'이 포함된 학생 (LIKE, substring) */
SELECT id, name
FROM students
WHERE name LIKE '%an%';

/* 7) GPA가 3.5 이상이면서 전공이 'CS' */
SELECT name, major, gpa
FROM students
WHERE gpa >= 3.5
  AND major = 'CS';

/* 8) 나이가 18~22 사이 (BETWEEN) */
SELECT name, age
FROM students
WHERE age BETWEEN 18 AND 22;

/* 9) 전공이 CS 또는 Math 또는 Statistics (IN) */
SELECT name, major
FROM students
WHERE major IN ('CS', 'Mathematics', 'Statistics');

/* 10) 전공이 정해지지 않은 학생 (IS NULL) */
SELECT id, name
FROM students
WHERE major IS NULL;

/* 11) GPA 높은 순으로 상위 5명 (ORDER BY DESC + LIMIT) */
SELECT name, gpa
FROM students
ORDER BY gpa DESC
LIMIT 5;

/* 12) 나이 오름차순, 같은 나이면 이름 내림차순 (다중 정렬) */
SELECT name, age
FROM students
ORDER BY age ASC, name DESC;

/* 13) 최근 입사한 직원 10명 (employees, 날짜 정렬) */
SELECT name, department, hired_at
FROM employees
ORDER BY hired_at DESC
LIMIT 10;

/* 14) 급여가 80,000 초과인 직원 (정렬 포함) */
SELECT name, department, salary
FROM employees
WHERE salary > 80000
ORDER BY salary DESC;

/* 15) 카테고리가 'Electronics'이고 재고 1 이상인 상품 */
SELECT name, price, stock
FROM products
WHERE category = 'Electronics'
  AND stock >= 1
ORDER BY price ASC;

/* 16) 가격이 50~200 사이 상품 (가격 오름차순, 상위 10개) */
SELECT name, price
FROM products
WHERE price BETWEEN 50 AND 200
ORDER BY price
LIMIT 10;

/* 17) 2025년 9월에 생성된 주문 (문자열 날짜 가정, LIKE로 월 필터) */
SELECT id, customer_name, order_date, total_amount
FROM orders
WHERE order_date LIKE '2025-09-%'
ORDER BY order_date;

/* 18) 금액 상위 5개 주문 (DESC + LIMIT) */
SELECT id, customer_name, total_amount
FROM orders
ORDER BY total_amount DESC
LIMIT 5;

/* 19) 고객 이름이 B로 시작하고, 금액이 100 이상인 주문 */
SELECT id, customer_name, total_amount
FROM orders
WHERE customer_name LIKE 'B%'
  AND total_amount >= 100
ORDER BY total_amount DESC;

/* 20) OFFSET 예시: 6~10위 주문 금액 (페이지네이션) */
SELECT id, customer_name, total_amount
FROM orders
ORDER BY total_amount DESC
LIMIT 5 OFFSET 5;

