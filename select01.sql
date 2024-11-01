/*
1. 조회 SELECT

SELECT 조회 대상 컬럼명 FROM 테이블명;

SELECT * from dept;
* : 전체 ALL

테이블구조 확인 (Describe)
DESC 테이블명;

조회 데이터 리터럴 활용!
SELECT '문자', 3019 FROM 테이블명;

컬럼명 별도로 지정하기 (컬럼별칭)
SELECT 컬럼명 AS "컬럼별칭",
    컬럼명 "컬럼별칭",
    컬럼명 컬럼별칭
FROM 테이블명;

*/

SELECT * from dept; -- dept테이블에 있는 모든 컬럼을 조회

select * from dept2; -- delp2print_table테이블에 있는 모든 컬럼을 조회

select * from emp;

select MGR, SAL from emp; -- emp테이블에서 mgr과 sal 컬럼을 조회

--가독성
SELECT *
FROM emp;

SELECT
    empno,
    ename,
    job
FROM emp;

DESC emp; --emp 테이블의 구조를 보여달라


SELECT empno, ename, '그냥문자', 999 FROM emp;

SELECT '그냥''문자"', 999, q'[요기 안에다 1203'dsaffd]' FROM emp;

SELECT ename AS "이름",
        empno "사번",
        job 직업,
        '그냥문자' 중요한의미,
        sal "직원의 월급" --띄어쓰기를 적용하고 싶을 때는 ""(큰따옴표)를 적용해야함
FROM emp;


중복값 제거
DISTINCT

SELECT * from emp;

SELECT DISTINCT job --job 중복제거 조회
FROM emp;

SELECT DISTINCT deptno --deptno 부서번호 중복제거 조회
FROM emp;

SELECT DISTINCT(deptno) --deptno 부서번호 중복제거 조회
FROM emp;

SELECT DISTINCT deptno, job
FROM emp;

|| 연결연산자

SELECT '나는' || '배가고프다' FROM dept;

SELECT DEPTNO || DNAME AS "부서번호이름",
       DEPTNO || DNAME "부서번호이름",
       DEPTNO || DNAME 부서번호이름
FROM dept;

SELECT DEPTNO+10,
      DEPTNO+20,
      DEPTNO+30
FROM dept;

SELECT deptno+deptno+deptno
FROM dept;

select * from student;

SELECT name || '''s ID :  ' || ID || ', WEIGHT is '  || weight || 'Kg' as "ID AND WEIGHT"
from student;

SELECT * from emp;

SELECT ENAME || '(' || JOB || ') , ' || ENAME || ''''|| JOB ||'''' as "NAME AND JOB"
from emp;

SELECT * from emp;

SELECT ENAME || '''s sal is $' || SAL as "Name and Sal"
from emp;

------------------------
WHERE 조건 
찾고 싶은 조건 (결과 필터링)

SELECT ...
FROM ...
WHERE ...



select * 
from emp; -- comm 성과급

select *
from emp
where comm is null; --성과금 받지 않는 사람들만

select *
from emp
where comm is not null; -- 성과급 지급 대상 사람들만

select DISTINCT deptno from emp;

--부서번호 20번 부서에 속한 사람들만 보기
select *
from emp
where deptno = 20;

--부서번호 20번 부서에 속한 사람들의 이름과 급여를 보기
select ename, sal
from emp
where deptno = 20;

--emp 테이블 급여 2000보다 적게 받는 사람들 목록
select *
from emp
where sal < 2000;

--emp 테이블 직업이 CLERK인 사람들만 취합
select *
from emp
WHERE JOB = 'CLERK';

--emp 테이블 직업이 CLERK이 아닌 사람들만 취합
select *
from emp
WHERE JOB <> 'CLERK';

--emp 테이블 급여가 2000~3000인 사람들만 조회
select *
from emp
--WHERE SAL >=2000 AND SAL <= 3000;
WHERE SAL BETWEEN 2000 AND 3000;

--student 테이블에서 1학년과 3학년만 조회 (1학년이거나 3학년이거나~)
select *
from student
--WHERE grade = 1 OR grade = 3;
WHERE GRADE IN (1,3);

--student 테이블에서 1학년과 3학년만 제외하고 조회
select *
from student
--WHERE grade in (2,4);
WHERE grade NOT IN (1,3);   --IS NULL / IS NOT NULL
--WHERE GRADE <> 1 AND grade <> 3;

---------------------
LIKE 패턴 검색
    LIKE
        % _
        %: 아무거나 아무갯수 0~n 개
        _: 그 위치에 한개
        
select * 
from emp;
where ename LIKE '%MI%';  --MI~   ~MI   ~Mi~
--where ename LIKE 'MI%'; --MIND  MOM  Mountain M
--where ename = 'WARD';

select *
from emp
where ename LIKE '_MI%'; --3글자 2~3번째가 MI
where ename LIKE '_MI__'; -- 5글자 2~3번째가 MI

--< <= > >=

select *
from emp
WHERE hiredate = '1981-05-01';
--WHERE hiredate = '81/05/01';

select *
from student;


-----------------
정렬 ORDER BY
*정렬을 사용하지 않으면 순서보장x
ORDER BY 정렬한 기준이되는 컬럼명 [ASC/DESC] [오름차순|내림차순]

SELECT ...
FROM ...
WHERE ...
ORDER BY ...

SELECT ...
FROM ...
ORDER BY ...
;

select * from student
ORDER BY NAME; --name 기준 오름차순 정렬

select *
from student
ORDER BY NAME DESC; --name 기준 내림차순 정렬



select *
from student
ORDER BY grade DESC; --학년기준 내림차순

select *
from student
ORDER BY BIRTHDAY; -- 생일 기준 오름차순

select *
from student
ORDER BY birthday DESC; -- 생일 기준 내림차순 (큰 수 -> 작은 수 방향)
                    --날짜에서 큰 수는? 더 최근/미래   작은수? 더 과거
                    

SELECT *
FROM student
WHERE grade IN (1,2,3) --학년 1,2,3 학년만 조회
ORDER BY grade, height DESC; --학년 오름차순 정렬

--------------
집합연산자
UNION 합집합 (중복제거)
UNION ALL 합집합 (중복제거x)
INTERSECT 교집합
MINUS 차집합

--학생들 중에 101번학과 학생들과 102번 학과 학생들 조회
select *
from student
WHERE deptno1 IN (101, 102);

select *
from student
WHERE deptno1 = 101
UNION ALL
select *
from student
WHERE deptno1 = 102;

select studno, name, deptno1
from student
WHERE deptno1 = 101;
UNION ALL
select profno, name, 0 --숫자 / 문자 / 숫자(인위적으로 숫자형태 갯수 맞추기)  3개
from professor
WHERE deptno = 101;

select 
    studno idno, 
    name, 
    deptno1 "deptno", 
    null "email" --숫자 / 문자 / 숫자 3개
from student
WHERE deptno1 = 101
UNION ALL
select 
    profno, 
    name, 
    deptno, 
    email --숫자 / 문자 / 숫자 / 문자 4개
from professor;







