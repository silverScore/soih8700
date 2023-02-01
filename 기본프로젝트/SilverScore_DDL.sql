/* ȸ�� */
CREATE TABLE member (
	id number(5) NOT NULL, /* ȸ��id */
	name varchar(20) NOT NULL, /* �̸� */
	passwd varchar(15) NOT NULL, /* ��й�ȣ */
	phone char(13) NOT NULL, /* �ڵ��� */
	email varchar(40) NOT NULL, /* �̸��� */
	registerDate date NOT NULL /* ������ */
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

COMMENT ON TABLE member IS 'ȸ��';

COMMENT ON COLUMN member.id IS 'ȸ��id';

COMMENT ON COLUMN member.name IS '�̸�';

COMMENT ON COLUMN member.passwd IS '��й�ȣ';

COMMENT ON COLUMN member.phone IS '�ڵ���';

COMMENT ON COLUMN member.email IS '�̸���';

COMMENT ON COLUMN member.registerDate IS '������';

/* ����� */
CREATE TABLE LongTermAdmin (
	longTermAdminSym char(11) NOT NULL, /* �����ȣ */
	adminPttnCd char(3) NOT NULL, /* ��������ڵ� */
	siDoCd char(2) NOT NULL, /* �õ��ڵ� */
	siGunGuCd char(3) NOT NULL, /* �ñ����ڵ� */
	adminNm varchar(100) NOT NULL, /* ����̸� */
	ratingCd char(15), /* �򰡱��� */
	ratingDate DATE NOT NULL, /* ������ */
	ratingGrade char(1) NOT NULL, /* �򰡵�� */
	detailAddr varchar(1000) NOT NULL, /* ���ּ� */
	telNo char(18) NOT NULL, /* ��ȭ��ȣ */
	jaehwalCd char(1), /* ��ȰƯȭ���� */
	chimaeCd char(1), /* ġ��Ưȭ���� */
	photo varchar(1000), /* ���� */
	longTermPeribRgtDt date NOT NULL, /* ��������� */
	stpRptDt date NOT NULL, /* ��ġ�Ű��� */
	adminCd char(1) NOT NULL /* ��������ڵ� */
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

COMMENT ON TABLE LongTermAdmin IS '�����';

COMMENT ON COLUMN LongTermAdmin.longTermAdminSym IS '�����ȣ';

COMMENT ON COLUMN LongTermAdmin.adminPttnCd IS '��������ڵ�';

COMMENT ON COLUMN LongTermAdmin.siDoCd IS '�õ��ڵ�';

COMMENT ON COLUMN LongTermAdmin.siGunGuCd IS '�ñ����ڵ�';

COMMENT ON COLUMN LongTermAdmin.adminNm IS '����̸�';

COMMENT ON COLUMN LongTermAdmin.ratingCd IS '�򰡱���';

COMMENT ON COLUMN LongTermAdmin.ratingDate IS '������';

COMMENT ON COLUMN LongTermAdmin.ratingGrade IS '�򰡵��';

COMMENT ON COLUMN LongTermAdmin.detailAddr IS '���ּ�';

COMMENT ON COLUMN LongTermAdmin.telNo IS '��ȭ��ȣ';

COMMENT ON COLUMN LongTermAdmin.jaehwalCd IS '��ȰƯȭ����';

COMMENT ON COLUMN LongTermAdmin.chimaeCd IS 'ġ��Ưȭ����';

COMMENT ON COLUMN LongTermAdmin.photo IS '����';

COMMENT ON COLUMN LongTermAdmin.longTermPeribRgtDt IS '���������';

COMMENT ON COLUMN LongTermAdmin.stpRptDt IS '��ġ�Ű���';

COMMENT ON COLUMN LongTermAdmin.adminCd IS '��������ڵ�';

/* ���� */
CREATE TABLE review (
	reviewId number(5) NOT NULL, /* ����id */
	amKind number(1) NOT NULL, /* ������/ģ���� */
	faClean number(1) NOT NULL, /* �ü�/û�ᵵ */
	content varchar(500), /* ���� */
	createDate date NOT NULL, /* �ۼ��� */
	modifyDate date, /* ������ */
	id number(5) NOT NULL, /* ȸ��id */
	longTermAdminSym char(11) NOT NULL, /* �����ȣ */
	adminPttnCd char(3) NOT NULL /* ��������ڵ� */
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

COMMENT ON TABLE review IS '����';

COMMENT ON COLUMN review.reviewId IS '����id';

COMMENT ON COLUMN review.amKind IS '������/ģ����';

COMMENT ON COLUMN review.faClean IS '�ü�/û�ᵵ';

COMMENT ON COLUMN review.content IS '����';

COMMENT ON COLUMN review.createDate IS '�ۼ���';

COMMENT ON COLUMN review.modifyDate IS '������';

COMMENT ON COLUMN review.id IS 'ȸ��id';

COMMENT ON COLUMN review.longTermAdminSym IS '�����ȣ';

COMMENT ON COLUMN review.adminPttnCd IS '��������ڵ�';

/* ����_�����_�򰡵�� */
CREATE TABLE LongTermAdminRating (
	no char(3) NOT NULL, /* ���� */
	ratingCd char(15), /* �򰡱��� */
	longTermAdminCd char(13), /* ���������ȣ */
	longTermAdminNm varchar(100), /* ��������� */
	adminPttnName varchar(20), /* �޿����� */
	siDoName varchar(20), /* ���ҽõ��� */
	siGunGuName varchar(20), /* ���ҽñ����� */
	ratingDate DATE, /* ������ */
	ratingGrade char(1), /* �򰡵�� */
	opRating number(3), /* ���� */
	safeRating number(3), /* ȯ��׾��� */
	rightRating number(3), /* �����ڱǸ����� */
	processRating number(3), /* �޿��������� */
	resultRating number(3) /* �޿�������� */
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

COMMENT ON TABLE LongTermAdminRating IS '����_�����_�򰡵��';

COMMENT ON COLUMN LongTermAdminRating.no IS '����';

COMMENT ON COLUMN LongTermAdminRating.ratingCd IS '�򰡱���';

COMMENT ON COLUMN LongTermAdminRating.longTermAdminCd IS '���������ȣ';

COMMENT ON COLUMN LongTermAdminRating.longTermAdminNm IS '���������';

COMMENT ON COLUMN LongTermAdminRating.adminPttnName IS '�޿�����';

COMMENT ON COLUMN LongTermAdminRating.siDoName IS '���ҽõ���';

COMMENT ON COLUMN LongTermAdminRating.siGunGuName IS '���ҽñ�����';

COMMENT ON COLUMN LongTermAdminRating.ratingDate IS '������';

COMMENT ON COLUMN LongTermAdminRating.ratingGrade IS '�򰡵��';

COMMENT ON COLUMN LongTermAdminRating.opRating IS '����';

COMMENT ON COLUMN LongTermAdminRating.safeRating IS 'ȯ��׾���';

COMMENT ON COLUMN LongTermAdminRating.rightRating IS '�����ڱǸ�����';

COMMENT ON COLUMN LongTermAdminRating.processRating IS '�޿���������';

COMMENT ON COLUMN LongTermAdminRating.resultRating IS '�޿��������';

/* �����Ÿ��Ȳ */
CREATE TABLE InsttEtcDetail (
	longTermAdminSym char(11) NOT NULL, /* �����ȣ */
	adminPttnCd char(3) NOT NULL, /* ��������ڵ� */
	hmpgAddr varchr(500), /* Ȩ�������ּ� */
	tfMth varchar(2000) NOT NULL, /* ������ */
	pkngEquip varchar(2000) NOT NULL /* �����ü� */
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

COMMENT ON TABLE InsttEtcDetail IS '�����Ÿ��Ȳ';

COMMENT ON COLUMN InsttEtcDetail.longTermAdminSym IS '�����ȣ';

COMMENT ON COLUMN InsttEtcDetail.adminPttnCd IS '��������ڵ�';

COMMENT ON COLUMN InsttEtcDetail.hmpgAddr IS 'Ȩ�������ּ�';

COMMENT ON COLUMN InsttEtcDetail.tfMth IS '������';

COMMENT ON COLUMN InsttEtcDetail.pkngEquip IS '�����ü�';

/* ��������ڵ� */
CREATE TABLE TABLE6 (
	adminPttnCd char(3) NOT NULL, /* ��������ڵ� */
	adminPttnNm varchar(40) NOT NULL /* ��������̸� */
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

COMMENT ON TABLE TABLE6 IS '��������ڵ�';

COMMENT ON COLUMN TABLE6.adminPttnCd IS '��������ڵ�';

COMMENT ON COLUMN TABLE6.adminPttnNm IS '��������̸�';

/* �Ϲ���Ȳ */
CREATE TABLE GeneralSttusDetail (
	longTermAdminSym char(11) NOT NULL, /* �����ȣ */
	adminPttnCd char(3) NOT NULL, /* ��������ڵ� */
	adminNm varchar(100) NOT NULL, /* ����̸� */
	hmPostNo char(6), /* ��������ȣ */
	siDoCd char(2) NOT NULL, /* �õ��ڵ� */
	siGunGuCd char(3) NOT NULL, /* �ñ����ڵ� */
	HDongCd char(3), /* �������ڵ� */
	BDongCd char(3), /* �������ڵ� */
	riCd char(2), /* ���ڵ� */
	detailAddr varchar(1000), /* ���ּ� */
	roadNmCd char(12), /* ���θ��ڵ� */
	gunmulMlno char(5), /* �ǹ����� */
	gunmulSlno char(5), /* �ǹ��ι� */
	fl char(10), /* �� */
	locTelNo_1 char(4), /* ��������ȭ��ȣ-���� */
	locTelNo_2 char(4), /* ��������ȭ��ȣ-���� */
	locTelNo_3 char(10), /* ��������ȭ��ȣ-��ȣ */
	longTermPeribRgtDt date NOT NULL, /* ������������� */
	StpRptDt date NOT NULL /* ��ġ�Ű����� */
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

COMMENT ON TABLE GeneralSttusDetail IS '�Ϲ���Ȳ';

COMMENT ON COLUMN GeneralSttusDetail.longTermAdminSym IS '�����ȣ';

COMMENT ON COLUMN GeneralSttusDetail.adminPttnCd IS '��������ڵ�';

COMMENT ON COLUMN GeneralSttusDetail.adminNm IS '����̸�';

COMMENT ON COLUMN GeneralSttusDetail.hmPostNo IS '��������ȣ';

COMMENT ON COLUMN GeneralSttusDetail.siDoCd IS '�õ��ڵ�';

COMMENT ON COLUMN GeneralSttusDetail.siGunGuCd IS '�ñ����ڵ�';

COMMENT ON COLUMN GeneralSttusDetail.HDongCd IS '�������ڵ�';

COMMENT ON COLUMN GeneralSttusDetail.BDongCd IS '�������ڵ�';

COMMENT ON COLUMN GeneralSttusDetail.riCd IS '���ڵ�';

COMMENT ON COLUMN GeneralSttusDetail.detailAddr IS '���ּ�';

COMMENT ON COLUMN GeneralSttusDetail.roadNmCd IS '���θ��ڵ�';

COMMENT ON COLUMN GeneralSttusDetail.gunmulMlno IS '�ǹ�����';

COMMENT ON COLUMN GeneralSttusDetail.gunmulSlno IS '�ǹ��ι�';

COMMENT ON COLUMN GeneralSttusDetail.fl IS '��';

COMMENT ON COLUMN GeneralSttusDetail.locTelNo_1 IS '��������ȭ��ȣ-����';

COMMENT ON COLUMN GeneralSttusDetail.locTelNo_2 IS '��������ȭ��ȣ-����';

COMMENT ON COLUMN GeneralSttusDetail.locTelNo_3 IS '��������ȭ��ȣ-��ȣ';

COMMENT ON COLUMN GeneralSttusDetail.longTermPeribRgtDt IS '�������������';

COMMENT ON COLUMN GeneralSttusDetail.StpRptDt IS '��ġ�Ű�����';

/* �ü���Ȳ */
CREATE TABLE InsttSttusDetail (
	longTermAdminSym char(11) NOT NULL, /* �����ȣ */
	adminPttnCd char(3) NOT NULL, /* ��������ڵ� */
	prsnRoomReal1 number(3) NOT NULL, /* 1�ν� */
	prsnRoomReal2 number(3) NOT NULL, /* 2�ν� */
	prsnRoomReal3 number(3) NOT NULL, /* 3�ν� */
	prsnRoomReal4 number(3) NOT NULL, /* 4�ν� */
	spcAcupRoomReal number(3) NOT NULL, /* Ư��ħ�� */
	ofce number(3) NOT NULL, /* �繫�� */
	medRoomReal number(3) NOT NULL, /* �Ƿ�װ�ȣ��� */
	funcTrnRoomReal number(3) NOT NULL, /* �۾����ϻ����Ʒý� */
	pgmRoomReal number(3) NOT NULL, /* ���α׷��� */
	crmnyPrst number(3) NOT NULL, /* �Ĵ�������� */
	batRoom number(3) NOT NULL, /* ȭ��� */
	taxPageLong number(3) NOT NULL, /* ������׸��� */
	taxRoom number(3) NOT NULL /* ��Ź��װ����� */
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

COMMENT ON TABLE InsttSttusDetail IS '�ü���Ȳ';

COMMENT ON COLUMN InsttSttusDetail.longTermAdminSym IS '�����ȣ';

COMMENT ON COLUMN InsttSttusDetail.adminPttnCd IS '��������ڵ�';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal1 IS '1�ν�';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal2 IS '2�ν�';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal3 IS '3�ν�';

COMMENT ON COLUMN InsttSttusDetail.prsnRoomReal4 IS '4�ν�';

COMMENT ON COLUMN InsttSttusDetail.spcAcupRoomReal IS 'Ư��ħ��';

COMMENT ON COLUMN InsttSttusDetail.ofce IS '�繫��';

COMMENT ON COLUMN InsttSttusDetail.medRoomReal IS '�Ƿ�װ�ȣ���';

COMMENT ON COLUMN InsttSttusDetail.funcTrnRoomReal IS '�۾����ϻ����Ʒý�';

COMMENT ON COLUMN InsttSttusDetail.pgmRoomReal IS '���α׷���';

COMMENT ON COLUMN InsttSttusDetail.crmnyPrst IS '�Ĵ��������';

COMMENT ON COLUMN InsttSttusDetail.batRoom IS 'ȭ���';

COMMENT ON COLUMN InsttSttusDetail.taxPageLong IS '������׸���';

COMMENT ON COLUMN InsttSttusDetail.taxRoom IS '��Ź��װ�����';

/* �Լ��ο���Ȳ */
CREATE TABLE AceptncNmprDetail (
	longTermAdminSym char(11) NOT NULL, /* �����ȣ */
	adminPttnCd char(3) NOT NULL, /* ��������ڵ� */
	totPer number(3), /* ���� */
	maNowPer number(3), /* ����_�� */
	fmNowPer number(3), /* ����_�� */
	maRsvPer number(3), /* ���_�� */
	fmRsvPer number(3) /* ���_�� */
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

COMMENT ON TABLE AceptncNmprDetail IS '�Լ��ο���Ȳ';

COMMENT ON COLUMN AceptncNmprDetail.longTermAdminSym IS '�����ȣ';

COMMENT ON COLUMN AceptncNmprDetail.adminPttnCd IS '��������ڵ�';

COMMENT ON COLUMN AceptncNmprDetail.totPer IS '����';

COMMENT ON COLUMN AceptncNmprDetail.maNowPer IS '����_��';

COMMENT ON COLUMN AceptncNmprDetail.fmNowPer IS '����_��';

COMMENT ON COLUMN AceptncNmprDetail.maRsvPer IS '���_��';

COMMENT ON COLUMN AceptncNmprDetail.fmRsvPer IS '���_��';

/* �޿����� */
CREATE TABLE TABLE10 (
	COL char(1) NOT NULL, /* �޿������ڵ� */
	COL2 varchar(20) NOT NULL /* �޿����� */
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

COMMENT ON TABLE TABLE10 IS '�޿�����';

COMMENT ON COLUMN TABLE10.COL IS '�޿������ڵ�';

COMMENT ON COLUMN TABLE10.COL2 IS '�޿�����';

/* �����ڵ� */
CREATE TABLE locationCd (
	siDoCd char(2) NOT NULL, /* �õ��ڵ� */
	siGunGuCd char(3) NOT NULL, /* �ñ����ڵ� */
	siDoNm varchar(20), /* �õ��� */
	siGunGuNm varchar(20) /* �ñ����� */
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

COMMENT ON TABLE locationCd IS '�����ڵ�';

COMMENT ON COLUMN locationCd.siDoCd IS '�õ��ڵ�';

COMMENT ON COLUMN locationCd.siGunGuCd IS '�ñ����ڵ�';

COMMENT ON COLUMN locationCd.siDoNm IS '�õ���';

COMMENT ON COLUMN locationCd.siGunGuNm IS '�ñ�����';

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

