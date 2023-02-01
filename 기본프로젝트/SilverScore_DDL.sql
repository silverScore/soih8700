/* 회원 */
CREATE TABLE member (
	id number(5) NOT NULL, /* 회원id */
	name varchar(20) NOT NULL, /* 이름 */
	passwd varchar(15) NOT NULL, /* 비밀번호 */
	phone char(13) NOT NULL, /* 핸드폰 */
	email varchar(40) NOT NULL, /* 이메일 */
	registerDate date NOT NULL /* 가입일 */
);

CREATE UNIQUE INDEX PK_member
	ON member (
		id ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			id
		);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.id IS '회원id';

COMMENT ON COLUMN member.name IS '이름';

COMMENT ON COLUMN member.passwd IS '비밀번호';

COMMENT ON COLUMN member.phone IS '핸드폰';

COMMENT ON COLUMN member.email IS '이메일';

COMMENT ON COLUMN member.registerDate IS '가입일';

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

CREATE UNIQUE INDEX PK_LongTermAdmin
	ON LongTermAdmin (
		longTermAdminSym ASC,
		adminPttnCd ASC
	);

ALTER TABLE LongTermAdmin
	ADD
		CONSTRAINT PK_LongTermAdmin
		PRIMARY KEY (
			longTermAdminSym,
			adminPttnCd
		);

COMMENT ON TABLE LongTermAdmin IS '요양기관';

COMMENT ON COLUMN LongTermAdmin.longTermAdminSym IS '기관기호';

COMMENT ON COLUMN LongTermAdmin.adminPttnCd IS '기관유형코드';

COMMENT ON COLUMN LongTermAdmin.siDoCd IS '시도코드';

COMMENT ON COLUMN LongTermAdmin.siGunGuCd IS '시군구코드';

COMMENT ON COLUMN LongTermAdmin.adminNm IS '기관이름';

COMMENT ON COLUMN LongTermAdmin.ratingCd IS '평가구분';

COMMENT ON COLUMN LongTermAdmin.ratingDate IS '평가일자';

COMMENT ON COLUMN LongTermAdmin.ratingGrade IS '평가등급';

COMMENT ON COLUMN LongTermAdmin.detailAddr IS '상세주소';

COMMENT ON COLUMN LongTermAdmin.telNo IS '전화번호';

COMMENT ON COLUMN LongTermAdmin.jaehwalCd IS '재활특화구분';

COMMENT ON COLUMN LongTermAdmin.chimaeCd IS '치매특화구분';

COMMENT ON COLUMN LongTermAdmin.photo IS '사진';

COMMENT ON COLUMN LongTermAdmin.longTermPeribRgtDt IS '기관지정일';

COMMENT ON COLUMN LongTermAdmin.stpRptDt IS '설치신고일';

COMMENT ON COLUMN LongTermAdmin.adminCd IS '기관구분코드';

/* 리뷰 */
CREATE TABLE review (
	reviewId number(5) NOT NULL, /* 리뷰id */
	amKind number(1) NOT NULL, /* 분위기/친절도 */
	faClean number(1) NOT NULL, /* 시설/청결도 */
	content varchar(500), /* 내용 */
	createDate date NOT NULL, /* 작성일 */
	modifyDate date, /* 수정일 */
	id number(5) NOT NULL, /* 회원id */
	longTermAdminSym char(11) NOT NULL, /* 기관기호 */
	adminPttnCd char(3) NOT NULL /* 기관유형코드 */
);

CREATE UNIQUE INDEX PK_review
	ON review (
		reviewId ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			reviewId
		);

COMMENT ON TABLE review IS '리뷰';

COMMENT ON COLUMN review.reviewId IS '리뷰id';

COMMENT ON COLUMN review.amKind IS '분위기/친절도';

COMMENT ON COLUMN review.faClean IS '시설/청결도';

COMMENT ON COLUMN review.content IS '내용';

COMMENT ON COLUMN review.createDate IS '작성일';

COMMENT ON COLUMN review.modifyDate IS '수정일';

COMMENT ON COLUMN review.id IS '회원id';

COMMENT ON COLUMN review.longTermAdminSym IS '기관기호';

COMMENT ON COLUMN review.adminPttnCd IS '기관유형코드';

/* 공공_요양기관_평가등급 */
CREATE TABLE LongTermAdminRating (
	no char(3) NOT NULL, /* 연번 */
	ratingCd char(15), /* 평가구분 */
	longTermAdminCd char(13), /* 장기요양기관기호 */
	longTermAdminNm varchar(100), /* 장기요양기관명 */
	adminPttnName varchar(20), /* 급여종류 */
	siDoName varchar(20), /* 관할시도명 */
	siGunGuName varchar(20), /* 관할시군구명 */
	ratingDate DATE, /* 평가일자 */
	ratingGrade char(1), /* 평가등급 */
	opRating number(3), /* 기관운영 */
	safeRating number(3), /* 환경및안전 */
	rightRating number(3), /* 수급자권리보장 */
	processRating number(3), /* 급여제공과정 */
	resultRating number(3) /* 급여제공결과 */
);

CREATE UNIQUE INDEX PK_LongTermAdminRating
	ON LongTermAdminRating (
		no ASC
	);

ALTER TABLE LongTermAdminRating
	ADD
		CONSTRAINT PK_LongTermAdminRating
		PRIMARY KEY (
			no
		);

COMMENT ON TABLE LongTermAdminRating IS '공공_요양기관_평가등급';

COMMENT ON COLUMN LongTermAdminRating.no IS '연번';

COMMENT ON COLUMN LongTermAdminRating.ratingCd IS '평가구분';

COMMENT ON COLUMN LongTermAdminRating.longTermAdminCd IS '장기요양기관기호';

COMMENT ON COLUMN LongTermAdminRating.longTermAdminNm IS '장기요양기관명';

COMMENT ON COLUMN LongTermAdminRating.adminPttnName IS '급여종류';

COMMENT ON COLUMN LongTermAdminRating.siDoName IS '관할시도명';

COMMENT ON COLUMN LongTermAdminRating.siGunGuName IS '관할시군구명';

COMMENT ON COLUMN LongTermAdminRating.ratingDate IS '평가일자';

COMMENT ON COLUMN LongTermAdminRating.ratingGrade IS '평가등급';

COMMENT ON COLUMN LongTermAdminRating.opRating IS '기관운영';

COMMENT ON COLUMN LongTermAdminRating.safeRating IS '환경및안전';

COMMENT ON COLUMN LongTermAdminRating.rightRating IS '수급자권리보장';

COMMENT ON COLUMN LongTermAdminRating.processRating IS '급여제공과정';

COMMENT ON COLUMN LongTermAdminRating.resultRating IS '급여제공결과';

/* 기관기타현황 */
CREATE TABLE InsttEtcDetail (
	longTermAdminSym char(11) NOT NULL, /* 기관기호 */
	adminPttnCd char(3) NOT NULL, /* 기관유형코드 */
	hmpgAddr varchr(500), /* 홈페이지주소 */
	tfMth varchar(2000) NOT NULL, /* 교통편 */
	pkngEquip varchar(2000) NOT NULL /* 주차시설 */
);

CREATE UNIQUE INDEX PK_InsttEtcDetail
	ON InsttEtcDetail (
		longTermAdminSym ASC,
		adminPttnCd ASC
	);

ALTER TABLE InsttEtcDetail
	ADD
		CONSTRAINT PK_InsttEtcDetail
		PRIMARY KEY (
			longTermAdminSym,
			adminPttnCd
		);

COMMENT ON TABLE InsttEtcDetail IS '기관기타현황';

COMMENT ON COLUMN InsttEtcDetail.longTermAdminSym IS '기관기호';

COMMENT ON COLUMN InsttEtcDetail.adminPttnCd IS '기관유형코드';

COMMENT ON COLUMN InsttEtcDetail.hmpgAddr IS '홈페이지주소';

COMMENT ON COLUMN InsttEtcDetail.tfMth IS '교통편';

COMMENT ON COLUMN InsttEtcDetail.pkngEquip IS '주차시설';

/* 기관유형코드 */
CREATE TABLE TABLE6 (
	adminPttnCd char(3) NOT NULL, /* 기관유형코드 */
	adminPttnNm varchar(40) NOT NULL /* 기관유형이름 */
);

CREATE UNIQUE INDEX PK_TABLE6
	ON TABLE6 (
		adminPttnCd ASC
	);

ALTER TABLE TABLE6
	ADD
		CONSTRAINT PK_TABLE6
		PRIMARY KEY (
			adminPttnCd
		);

COMMENT ON TABLE TABLE6 IS '기관유형코드';

COMMENT ON COLUMN TABLE6.adminPttnCd IS '기관유형코드';

COMMENT ON COLUMN TABLE6.adminPttnNm IS '기관유형이름';

/* 일반현황 */
CREATE TABLE GeneralSttusDetail (
	longTermAdminSym char(11) NOT NULL, /* 기관기호 */
	adminPttnCd char(3) NOT NULL, /* 기관유형코드 */
	adminNm varchar(100) NOT NULL, /* 기관이름 */
	hmPostNo char(6), /* 행망우편번호 */
	siDoCd char(2) NOT NULL, /* 시도코드 */
	siGunGuCd char(3) NOT NULL, /* 시군구코드 */
	HDongCd char(3), /* 행정동코드 */
	BDongCd char(3), /* 법정동코드 */
	riCd char(2), /* 리코드 */
	detailAddr varchar(1000), /* 상세주소 */
	roadNmCd char(12), /* 도로명코드 */
	gunmulMlno char(5), /* 건물본번 */
	gunmulSlno char(5), /* 건물부번 */
	fl char(10), /* 층 */
	locTelNo_1 char(4), /* 소재지전화번호-지역 */
	locTelNo_2 char(4), /* 소재지전화번호-국번 */
	locTelNo_3 char(10), /* 소재지전화번호-번호 */
	longTermPeribRgtDt date NOT NULL, /* 장기요양기관지정일 */
	StpRptDt date NOT NULL /* 설치신고일자 */
);

CREATE UNIQUE INDEX PK_GeneralSttusDetail
	ON GeneralSttusDetail (
		longTermAdminSym ASC,
		adminPttnCd ASC
	);

ALTER TABLE GeneralSttusDetail
	ADD
		CONSTRAINT PK_GeneralSttusDetail
		PRIMARY KEY (
			longTermAdminSym,
			adminPttnCd
		);

COMMENT ON TABLE GeneralSttusDetail IS '일반현황';

COMMENT ON COLUMN GeneralSttusDetail.longTermAdminSym IS '기관기호';

COMMENT ON COLUMN GeneralSttusDetail.adminPttnCd IS '기관유형코드';

COMMENT ON COLUMN GeneralSttusDetail.adminNm IS '기관이름';

COMMENT ON COLUMN GeneralSttusDetail.hmPostNo IS '행망우편번호';

COMMENT ON COLUMN GeneralSttusDetail.siDoCd IS '시도코드';

COMMENT ON COLUMN GeneralSttusDetail.siGunGuCd IS '시군구코드';

COMMENT ON COLUMN GeneralSttusDetail.HDongCd IS '행정동코드';

COMMENT ON COLUMN GeneralSttusDetail.BDongCd IS '법정동코드';

COMMENT ON COLUMN GeneralSttusDetail.riCd IS '리코드';

COMMENT ON COLUMN GeneralSttusDetail.detailAddr IS '상세주소';

COMMENT ON COLUMN GeneralSttusDetail.roadNmCd IS '도로명코드';

COMMENT ON COLUMN GeneralSttusDetail.gunmulMlno IS '건물본번';

COMMENT ON COLUMN GeneralSttusDetail.gunmulSlno IS '건물부번';

COMMENT ON COLUMN GeneralSttusDetail.fl IS '층';

COMMENT ON COLUMN GeneralSttusDetail.locTelNo_1 IS '소재지전화번호-지역';

COMMENT ON COLUMN GeneralSttusDetail.locTelNo_2 IS '소재지전화번호-국번';

COMMENT ON COLUMN GeneralSttusDetail.locTelNo_3 IS '소재지전화번호-번호';

COMMENT ON COLUMN GeneralSttusDetail.longTermPeribRgtDt IS '장기요양기관지정일';

COMMENT ON COLUMN GeneralSttusDetail.StpRptDt IS '설치신고일자';

/* 시설현황 */
CREATE TABLE InsttSttusDetail (
	longTermAdminSym char(11) NOT NULL, /* 기관기호 */
	adminPttnCd char(3) NOT NULL, /* 기관유형코드 */
	prsnRoomReal1 number(3) NOT NULL, /* 1인실 */
	prsnRoomReal2 number(3) NOT NULL, /* 2인실 */
	prsnRoomReal3 number(3) NOT NULL, /* 3인실 */
	prsnRoomReal4 number(3) NOT NULL, /* 4인실 */
	spcAcupRoomReal number(3) NOT NULL, /* 특수침실 */
	ofce number(3) NOT NULL, /* 사무실 */
	medRoomReal number(3) NOT NULL, /* 의료및간호사실 */
	funcTrnRoomReal number(3) NOT NULL, /* 작업및일상동작훈련실 */
	pgmRoomReal number(3) NOT NULL, /* 프로그램실 */
	crmnyPrst number(3) NOT NULL, /* 식당및조리실 */
	batRoom number(3) NOT NULL, /* 화장실 */
	taxPageLong number(3) NOT NULL, /* 세면장및목욕실 */
	taxRoom number(3) NOT NULL /* 세탁장및건조장 */
);

CREATE UNIQUE INDEX PK_InsttSttusDetail
	ON InsttSttusDetail (
		longTermAdminSym ASC,
		adminPttnCd ASC
	);

ALTER TABLE InsttSttusDetail
	ADD
		CONSTRAINT PK_InsttSttusDetail
		PRIMARY KEY (
			longTermAdminSym,
			adminPttnCd
		);

COMMENT ON TABLE InsttSttusDetail IS '시설현황';

COMMENT ON COLUMN InsttSttusDetail.longTermAdminSym IS '기관기호';

COMMENT ON COLUMN InsttSttusDetail.adminPttnCd IS '기관유형코드';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal1 IS '1인실';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal2 IS '2인실';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal3 IS '3인실';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal4 IS '4인실';

COMMENT ON COLUMN InsttSttusDetail.spcAcupRoomReal IS '특수침실';

COMMENT ON COLUMN InsttSttusDetail.ofce IS '사무실';

COMMENT ON COLUMN InsttSttusDetail.medRoomReal IS '의료및간호사실';

COMMENT ON COLUMN InsttSttusDetail.funcTrnRoomReal IS '작업및일상동작훈련실';

COMMENT ON COLUMN InsttSttusDetail.pgmRoomReal IS '프로그램실';

COMMENT ON COLUMN InsttSttusDetail.crmnyPrst IS '식당및조리실';

COMMENT ON COLUMN InsttSttusDetail.batRoom IS '화장실';

COMMENT ON COLUMN InsttSttusDetail.taxPageLong IS '세면장및목욕실';

COMMENT ON COLUMN InsttSttusDetail.taxRoom IS '세탁장및건조장';

/* 입소인원현황 */
CREATE TABLE AceptncNmprDetail (
	longTermAdminSym char(11) NOT NULL, /* 기관기호 */
	adminPttnCd char(3) NOT NULL, /* 기관유형코드 */
	totPer number(3), /* 정원 */
	maNowPer number(3), /* 현원_남 */
	fmNowPer number(3), /* 현원_여 */
	maRsvPer number(3), /* 대기_남 */
	fmRsvPer number(3) /* 대기_여 */
);

CREATE UNIQUE INDEX PK_AceptncNmprDetail
	ON AceptncNmprDetail (
		longTermAdminSym ASC,
		adminPttnCd ASC
	);

ALTER TABLE AceptncNmprDetail
	ADD
		CONSTRAINT PK_AceptncNmprDetail
		PRIMARY KEY (
			longTermAdminSym,
			adminPttnCd
		);

COMMENT ON TABLE AceptncNmprDetail IS '입소인원현황';

COMMENT ON COLUMN AceptncNmprDetail.longTermAdminSym IS '기관기호';

COMMENT ON COLUMN AceptncNmprDetail.adminPttnCd IS '기관유형코드';

COMMENT ON COLUMN AceptncNmprDetail.totPer IS '정원';

COMMENT ON COLUMN AceptncNmprDetail.maNowPer IS '현원_남';

COMMENT ON COLUMN AceptncNmprDetail.fmNowPer IS '현원_여';

COMMENT ON COLUMN AceptncNmprDetail.maRsvPer IS '대기_남';

COMMENT ON COLUMN AceptncNmprDetail.fmRsvPer IS '대기_여';

/* 급여종류 */
CREATE TABLE TABLE10 (
	COL char(1) NOT NULL, /* 급여종별코드 */
	COL2 varchar(20) NOT NULL /* 급여종류 */
);

CREATE UNIQUE INDEX PK_TABLE10
	ON TABLE10 (
		COL ASC
	);

ALTER TABLE TABLE10
	ADD
		CONSTRAINT PK_TABLE10
		PRIMARY KEY (
			COL
		);

COMMENT ON TABLE TABLE10 IS '급여종류';

COMMENT ON COLUMN TABLE10.COL IS '급여종별코드';

COMMENT ON COLUMN TABLE10.COL2 IS '급여종류';

/* 지역코드 */
CREATE TABLE locationCd (
	siDoCd char(2) NOT NULL, /* 시도코드 */
	siGunGuCd char(3) NOT NULL, /* 시군구코드 */
	siDoNm varchar(20), /* 시도명 */
	siGunGuNm varchar(20) /* 시군구명 */
);

CREATE UNIQUE INDEX PK_locationCd
	ON locationCd (
		siDoCd ASC,
		siGunGuCd ASC
	);

ALTER TABLE locationCd
	ADD
		CONSTRAINT PK_locationCd
		PRIMARY KEY (
			siDoCd,
			siGunGuCd
		);

COMMENT ON TABLE locationCd IS '지역코드';

COMMENT ON COLUMN locationCd.siDoCd IS '시도코드';

COMMENT ON COLUMN locationCd.siGunGuCd IS '시군구코드';

COMMENT ON COLUMN locationCd.siDoNm IS '시도명';

COMMENT ON COLUMN locationCd.siGunGuNm IS '시군구명';

ALTER TABLE LongTermAdmin
	ADD
		CONSTRAINT FK_TABLE6_TO_LongTermAdmin
		FOREIGN KEY (
			adminPttnCd
		)
		REFERENCES TABLE6 (
			adminPttnCd
		);

ALTER TABLE LongTermAdmin
	ADD
		CONSTRAINT FK_locationCd_TO_LongTermAdmin
		FOREIGN KEY (
			siDoCd,
			siGunGuCd
		)
		REFERENCES locationCd (
			siDoCd,
			siGunGuCd
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_member_TO_review
		FOREIGN KEY (
			id
		)
		REFERENCES member (
			id
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_LongTermAdmin_TO_review
		FOREIGN KEY (
			longTermAdminSym,
			adminPttnCd
		)
		REFERENCES LongTermAdmin (
			longTermAdminSym,
			adminPttnCd
		);

ALTER TABLE InsttEtcDetail
	ADD
		CONSTRAINT FK_LongTermAdmin_TO_InsttEtcDetail
		FOREIGN KEY (
			longTermAdminSym,
			adminPttnCd
		)
		REFERENCES LongTermAdmin (
			longTermAdminSym,
			adminPttnCd
		);

ALTER TABLE InsttSttusDetail
	ADD
		CONSTRAINT FK_LongTermAdmin_TO_InsttSttusDetail
		FOREIGN KEY (
			longTermAdminSym,
			adminPttnCd
		)
		REFERENCES LongTermAdmin (
			longTermAdminSym,
			adminPttnCd
		);

ALTER TABLE AceptncNmprDetail
	ADD
		CONSTRAINT FK_LongTermAdmin_TO_AceptncNmprDetail
		FOREIGN KEY (
			longTermAdminSym,
			adminPttnCd
		)
		REFERENCES LongTermAdmin (
			longTermAdminSym,
			adminPttnCd
		);

