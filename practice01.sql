select * from emp;

select *
from emp
ORDER BY ENAME;

select *
from emp
ORDER BY DEPTNO, SAL DESC;

--emp 급여가 2000이 넘는 사람들 중 급여가 높은 순서대로
select *
from emp
WHERE SAL >= 2000
ORDER BY SAL DESC;

--student 테이블 1학년을 제외하고, 나이가 어린순서대로
select *
from student
WHERE GRADE NOT IN 1
ORDER BY GRADE, BIRTHDAY DESC;
--WHERE grade IN (2,3,4);