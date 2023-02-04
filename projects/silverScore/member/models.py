from django.db import models

# Create your models here.
class Member(models.Model):
    memberId = models.SmallIntegerField(primary_key=True)
    name = models.CharField(max_length=20)
    passwd = models.CharField(max_length=15)
    phone = models.CharField(max_length=13)
    email = models.EmailField()
    registerDate = models.DateTimeField()


class Review(models.Model):
    reviewId = models.SmallIntegerField(primary_key=True)
    amKind = models.SmallIntegerField(default=0)
    faClean = models.SmallIntegerField(default=0)
    content = models.CharField(max_length=500, blank=True)
    createDate = models.DateField()
    modifyDate = models.DateField(null=True, blank=True)
    memberId = models.SmallIntegerField()
    longTermAdminSym = models.CharField(max_length=11)
    adminPttnCd = models.CharField(max_length=3)

    member = models.ForeignKey(Member, on_delete=models.CASCADE)
    longtermadmin = models.ForeignKey('care.LongTermAdmin', on_delete=models.CASCADE)

    class Meta:
        unique_together = (('longTermAdminSym', 'adminPttnCd'),)
        indexes = [
            models.Index(fields=['memberId'], name='FK_Member_Review'),
            models.Index(fields=['longTermAdminSym', 'adminPttnCd'], name='FK_LongTermAdmin_Review'),
        ]

