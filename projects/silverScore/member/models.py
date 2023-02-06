from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Member(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=20)
    passwd = models.CharField(max_length=15)
    phone = models.CharField(max_length=13)
    email = models.EmailField()
    registerDate = models.DateTimeField()

class SiDoGunGuCode(models.Model):
    id = models.AutoField(primary_key=True)
    siDoCd = models.CharField(max_length=2)
    siGunGuCd = models.CharField(max_length=3)
    siDoNm = models.CharField(max_length=20)
    siGunGuNm = models.CharField(max_length=20)


class AdminPttnCode(models.Model):
    adminPttnCd = models.CharField(max_length=3, primary_key=True)
    adminPttnNm = models.CharField(max_length=40)


class LongTermAdmin(models.Model):
    id = models.AutoField(primary_key=True)
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
    sidogungucode = models.ForeignKey(SiDoGunGuCode, on_delete=models.CASCADE)
    adminpttncode = models.ForeignKey(AdminPttnCode, on_delete=models.CASCADE)


class Review(models.Model):
    id = models.BigAutoField(primary_key=True)
    amKind = models.SmallIntegerField(default=0)
    faClean = models.SmallIntegerField(default=0)
    content = models.CharField(max_length=500, blank=True)
    createDate = models.DateTimeField()
    modifyDate = models.DateTimeField(null=True, blank=True)

#    member = models.ForeignKey(Member, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    longtermadmin = models.ForeignKey(LongTermAdmin, on_delete=models.CASCADE)

