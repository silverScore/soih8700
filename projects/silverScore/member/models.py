from django.db import models

# Create your models here.
class Member(models.Model):
    memberId = models.PositiveSmallIntegerField(primary_key=True)
    name = models.CharField(max_length=20)
    passwd = models.CharField(max_length=15)
    phone = models.CharField(max_length=13)
    email = models.EmailField()
    registerDate = models.DateTimeField()


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

class Review(models.Model):
    reviewId = models.PositiveSmallIntegerField(primary_key=True)
    amKind = models.PositiveSmallIntegerField(default=0)
    faClean = models.PositiveSmallIntegerField(default=0)
    content = models.CharField(max_length=500, blank=True)
    createDate = models.DateField()
    modifyDate = models.DateField(null=True, blank=True)
    memberId = models.PositiveSmallIntegerField()
    longTermAdminSym = models.CharField(max_length=11)
    adminPttnCd = models.CharField(max_length=3)

    class Meta:
        unique_together = (('longTermAdminSym', 'adminPttnCd'),)
        indexes = [
            models.Index(fields=['memberId'], name='FK_Member_Review'),
            models.Index(fields=['longTermAdminSym', 'adminPttnCd'], name='FK_LongTermAdmin_Review'),
        ]