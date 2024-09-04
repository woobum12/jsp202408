--// 회원테이블 ---------------------------

--제약조건과 함께 테이블삭제
--DROP TABLE member_tbl CASCADE CONSTRAINT;

create table member_tbl (
	custno number (6) NOT NULL,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(1),
	city char(2),
	CONSTRAINT member_tbl_custno_pk PRIMARY KEY (custno)
	
);
insert into member_tbl VALUES (100001, '우종범', '010-8654-8175', '경기도 평택시 합정동', '20240702', 'A', '01');
insert into member_tbl VALUES (100002, '홍길동', '010-1234-4515', '경기도 평택시 비전1동', '20210702', 'A', '01');
insert into member_tbl VALUES (100003, '말포이', '010-8462-1575', '경기도 평택시 세교동', '20231111', 'B', '02');
insert into member_tbl VALUES (100004, '손흥민', '010-9542-4415', '경기도 평택시 비전2동', '20200402', 'B', '02');
insert into member_tbl VALUES (100005, '이순신', '010-8546-4812', '경기도 평택시 동삭동', '20241212', 'C', '03');
insert into member_tbl VALUES (100006, '아이유', '010-1547-8980', '경기도 평택시 합정동', '20241202', 'C', '03');

select * from member_tbl;
--
--// 회원 매출 테이블 -----------------------------------------

--제약조건과 함께 테이블 삭제
--DROP TABLE money_tbl CASCADE CONTRAINT;

create table money_tbl (
	custno number(6) NOT NULL,
	saleno number(8) NOT NULL,
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar(4),
	sdate date,
	CONSTRAINT money_tabel_pk PRIMARY KEY (custno, saleno),
	CONSTRAINT custno_fk FOREIGN KEY (custno) REFERENCES member_tbl (custno)
);
insert into money_tbl VALUES (100001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_tbl VALUES (100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into money_tbl VALUES (100001, 20160003, 1500, 3, 1500, 'A003', '20160101');
insert into money_tbl VALUES (100002, 20160004, 2000, 1, 500, 'A004', '20160104');
insert into money_tbl VALUES (100002, 20160005, 3000, 1, 1000, 'A005', '20160102');
insert into money_tbl VALUES (100002, 20160006, 2000, 4, 6000, 'A004', '20160102');
insert into money_tbl VALUES (100003, 20160007, 1500, 2, 3000, 'A006', '20160106');

--// 쿼리생성: 회원목록 조회
select custno, custname, phone, address, joindate, 
	decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, city
FROM MEMBER_TBL
order by custno;

--// 쿼리생성: MAX(custno)마지막!!!회원 번호 조회하여 다음번호 증가 +1
select MAX(custno)+1 nextCustNO FROM MEMBER_TBL;

--// 쿼리생성: 회원추가 ------------------------------
INSERT INTO member_tbl
VALUES (100007, '칠칠칠', '010-9999-8888', '추가~제주도 제주시 감나무골', '20151211', 'A', '99');
--INSERT INTO member_tbl VALUES(?, ?, ?, ?, ?, ?)

--// 쿼리생성 : 선택한 회원 조회 한명----------------
SELECT custno, custname, phone, address, joindate, grade, city
FROM member_tbl where custno=100001;
--SELECT * FROM member_tbl where custno=?;

--// 쿼리생성: 회원수정
UPDATE member_tbl
SET custname='칠칠칠', phone='010-9999-8888', address='추가+수정~제주도 제주시 감나무골', joindate='20151211', grade='A', city='99'
where custno=100007;
--UPDATE member_tbl
--SET custname=?, phone=?, address=?, joindate=?, grade=?, city=?
--WHERE custno=?

--// 쿼리생성: 회원삭제 ------------------------------------------
DELETE FROM MEMBER_TBL
WHERE custno = 100007;
--DELETE FROM member_tbl WHERE custno = ?

--//쿼리생성 : 매출조회----------------
SELECT A.custno, A.custname, decode(A.grade, 'A','VIP', 'B', '일반', 'C', '직원')grade, SUM(price) price
FROM member_tbl A, money_tbl B
where A.custno=B.custno
GROUP BY A.custno, A.custname, A.grade
ORDER BY price DESC;

--// 쿼리생성: 매출정보를 먼저 지우고, 회원삭제를 시도해야한다. -------------------
---------------- 조인된 테이블의 제약사항을 위해하게 되므로 오류가 있음
--회원삭제테스트
--DELETE FROM money_tbl
--WHERE custno = 100002;