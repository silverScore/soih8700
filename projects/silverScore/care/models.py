from django.db import models

# Create your models here.
class SiDoGunGuCode(models.Model):
    siDoCd = models.CharField(max_length=2)
    siGunGuCd = models.CharField(max_length=3)
    siDoNm = models.CharField(max_length=20)
    siGunGuNm = models.CharField(max_length=20)

    class Meta:
        unique_together = (('siDoCd', 'siGunGuCd'),)
        indexes = [
            models.Index(fields=['siDoCd', 'siGunGuCd'], name='PK_siDoGunGuCode'),
        ]


class AdminPttnCode(models.Model):
    adminPttnCd = models.CharField(max_length=3, primary_key=True)
    adminPttnNm = models.CharField(max_length=40)

    class Meta:
        unique_together = (('adminPttnCd'),)
        indexes = [
            models.Index(fields=['adminPttnCd'], name='PK_adminPttnCode'),
        ]


class LongTermAdmin(models.Model):
    sidogungucode = models.ForeignKey(SiDoGunGuCode, on_delete=models.CASCADE)
    adminpttncode = models.ForeignKey(AdminPttnCode, on_delete=models.CASCADE)

    longTermAdminSym = models.CharField(max_length=11)
    adminPttnCd = models.CharField(max_length=3)
    siDoCd = models.CharField(max_length=2)
    siGunGuCd = models.CharField(max_length=3)
    adminNm = models.CharField(max_length=100)
    ratingCd = models.CharField(max_length=15, blank=True, null=True)
    ratingDate = models.DateField()
    ratingGrade = models.CharField(max_length=1)
    detailAddr = models.CharField(max_length=1000)
    telNo = models.CharField(max_length=18)
    jaehwalCd = models.CharField(max_length=1, blank=True, null=True)
    chimaeCd = models.CharField(max_length=1, blank=True, null=True)
    photo = models.ImageField(upload_to='images/', null=True)
    longTermPeribRgtDt = models.DateField()
    stpRptDt = models.DateField()
    adminCd = models.CharField(max_length=1)

    class Meta:
        unique_together = (('longTermAdminSym', 'adminPttnCd'),)
        indexes = [
            models.Index(fields=['adminPttnCd'], name='FK_adminPttnCode_LongTermAdmin'),
            models.Index(fields=['siDoCd', 'siGunGuCd'], name='FK_siDoGunGuCode_LongTermAdmin'),
        ]


class InsttEtcDetail(models.Model):
    longtermadmin = models.ForeignKey(LongTermAdmin, on_delete=models.CASCADE)

    longTermAdminSym = models.CharField(max_length=11)
    adminPttnCd = models.CharField(max_length=3)
    hmpgAddr = models.CharField(max_length=500, blank=True, null=True)
    tfMth = models.CharField(max_length=2000)
    pkngEquip = models.CharField(max_length=2000)

    class Meta:
        unique_together = (('longTermAdminSym', 'adminPttnCd'),)
        indexes = [
            models.Index(fields=['longTermAdminSym', 'adminPttnCd'], name='FK_LongTermAdmin_InsttEtcD'),
        ]


class AceptncNmprDetail(models.Model):
    longtermadmin = models.ForeignKey(LongTermAdmin, on_delete=models.CASCADE)

    longTermAdminSym = models.CharField(max_length=11)
    adminPttnCd = models.CharField(max_length=3)
    totPer = models.SmallIntegerField(null=True)
    maNowPer = models.SmallIntegerField(null=True)
    fmNowPer = models.SmallIntegerField(null=True)
    maRsvPer = models.SmallIntegerField(null=True)
    fmRsvPer = models.SmallIntegerField(null=True)

    class Meta:
        unique_together = (('longTermAdminSym', 'adminPttnCd'),)
        indexes = [
            models.Index(fields=['longTermAdminSym', 'adminPttnCd'], name='FK_LongTermAdmin_AceptncNmprD'),
        ]


class InsttSttusDetail(models.Model):
    longtermadmin = models.ForeignKey(LongTermAdmin, on_delete=models.CASCADE)

    longTermAdminSym = models.CharField(max_length=11)
    adminPttnCd = models.CharField(max_length=3)
    prsnRoomReal1 = models.SmallIntegerField(default=0)
    prsnRoomReal2 = models.SmallIntegerField(default=0)
    prsnRoomReal3 = models.SmallIntegerField(default=0)
    prsnRoomReal4 = models.SmallIntegerField(default=0)
    spcAcupRoomReal = models.SmallIntegerField(default=0)
    ofce = models.SmallIntegerField(default=0)
    medRoomReal = models.SmallIntegerField(default=0)
    funcTrnRoomReal = models.SmallIntegerField(default=0)
    pgmRoomReal = models.SmallIntegerField(default=0)
    crmnyPrst = models.SmallIntegerField(default=0)
    batRoom = models.SmallIntegerField(default=0)
    taxPageLong = models.SmallIntegerField(default=0)
    taxRoom = models.SmallIntegerField(default=0)

    class Meta:
        unique_together = (('longTermAdminSym', 'adminPttnCd'),)
        indexes = [
            models.Index(fields=['longTermAdminSym', 'adminPttnCd'], name='FK_LongTermAdmin_InsttSttusD'),
        ]


class GeneralSttusDetail(models.Model):
    longtermadmin = models.ForeignKey(LongTermAdmin, on_delete=models.CASCADE)

    longTermAdminSym = models.CharField(max_length=11)
    adminPttnCd = models.CharField(max_length=3)
    adminNm = models.CharField(max_length=100)
    hmPostNo = models.CharField(max_length=6, null=True)
    siDoCd = models.CharField(max_length=2)
    siGunGuCd = models.CharField(max_length=3)
    HDongCd = models.CharField(max_length=3, null=True)
    BDongCd = models.CharField(max_length=3, null=True)
    riCd = models.CharField(max_length=2, null=True)
    detailAddr = models.CharField(max_length=1000, null=True)
    roadNmCd = models.CharField(max_length=12, null=True)
    gunmulMlno = models.CharField(max_length=5, null=True)
    gunmulSlno = models.CharField(max_length=5, null=True)
    fl = models.CharField(max_length=10, null=True)
    locTelNo_1 = models.CharField(max_length=4, null=True)
    locTelNo_2 = models.CharField(max_length=4, null=True)
    locTelNo_3 = models.CharField(max_length=10, null=True)
    longTermPeribRgtDt = models.DateField()
    StpRptDt = models.DateField()

    class Meta:
        unique_together = (('longTermAdminSym', 'adminPttnCd'),)
        indexes = [
            models.Index(fields=['longTermAdminSym', 'adminPttnCd'], name='FK_LongTermAdmin_GeneralSttusD'),
        ]


class LongTermAdminRating(models.Model):
    no = models.CharField(max_length=3, primary_key=True)
    ratingCd = models.CharField(max_length=15, blank=True, null=True)
    longTermAdminCd = models.CharField(max_length=13, blank=True, null=True)
    longTermAdminNm = models.CharField(max_length=100, blank=True, null=True)
    adminPttnName = models.CharField(max_length=20, blank=True, null=True)
    siDoName = models.CharField(max_length=20, blank=True, null=True)
    siGunGuName = models.CharField(max_length=20, blank=True, null=True)
    ratingDate = models.DateField(blank=True, null=True)
    ratingGrade = models.CharField(max_length=1, blank=True, null=True)
    opRating = models.SmallIntegerField(blank=True, null=True)
    safeRating = models.SmallIntegerField(blank=True, null=True)
    rightRating = models.SmallIntegerField(blank=True, null=True)
    processRating = models.SmallIntegerField(blank=True, null=True)
    resultRating = models.SmallIntegerField(blank=True, null=True)