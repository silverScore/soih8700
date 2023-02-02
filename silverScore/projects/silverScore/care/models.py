from django.db import models

# Create your models here.
class Member(models.Model):
    name = models.CharField(max_length=20)
    passwd = models.CharField(max_length=15)
    phone = models.CharField(max_length=13)
    email = models.CharField(max_length=40)
    registerDate = models.DateTimeField()

class Review(models.Model):
    reviewId = models.IntegerField()
    amKind = models.IntegerField(max_length=15)
    faClean = models.IntegerField(max_length=13)
    content = models.TextField(max_length=40)
    createDate = models.DateTimeField()
    modifyDate = models.DateTimeField()
    memberId = models.ForeignKey(Member, on_delete=models.CASCADE)
    longTermAdminSym = models.ForeignKey(LongTermAdmin, on_delete=models.CASCADE)
    adminPttnCd = models.ForeignKey(LongTermAdmin, on_delete=models.CASCADE)

class LongTermAdmin(models.Model):
    longTermAdminSym

"""  
/* 요양기관 */
CREATE TABLE LongTermAdmin (
	longTermAdminSym char(11) NOT NULL, /* 기관기호 */
	adminPttnCd char(3) NOT NULL, /* 기관유형코드 */
	siDoCd char(2) NOT NULL, /* 시도코드 */
	siGunGuCd char(3) NOT NULL, /* 시군구코드 */
	adminNm varchar(100) NOT NULL, /* 기관이름 */
	ratingCd char(15), /* 평가구분 */
	ratingDate DATE NOT NULL, /* 평가일자 */
	ratingGrade char(1) NOT NULL, /* 평가등급 */
	detailAddr varchar(1000) NOT NULL, /* 상세주소 */
	telNo char(18) NOT NULL, /* 전화번호 */
	jaehwalCd char(1), /* 재활특화구분 */
	chimaeCd char(1), /* 치매특화구분 */
	photo varchar(1000), /* 사진 */
	longTermPeribRgtDt date NOT NULL, /* 기관지정일 */
	stpRptDt date NOT NULL, /* 설치신고일 */
	adminCd char(1) NOT NULL /* 기관구분코드 */
);
CREATE TABLE Review (
	reviewId number(5) NOT NULL, /* 리뷰id */
	amKind number(1) NOT NULL, /* 분위기/친절도 */
	faClean number(1) NOT NULL, /* 시설/청결도 */
	content varchar(2000), /* 내용 */
	createDate date NOT NULL, /* 작성일 */
	modifyDate date, /* 수정일 */
	id number(5) NOT NULL, /* 회원id */
	longTermAdminSym char(11) NOT NULL, /* 기관기호 */
	adminPttnCd char(3) NOT NULL /* 기관유형코드 */
);
class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    content = models.TextField()
    create_date = models.DateTimeField()
"""