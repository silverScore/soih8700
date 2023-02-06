from django.contrib import admin
from .models import Member, SiDoGunGuCode, AdminPttnCode, LongTermAdmin, Review

# Register your models here.
admin.site.register(Member)
admin.site.register(SiDoGunGuCode)
admin.site.register(AdminPttnCode)
admin.site.register(LongTermAdmin)
admin.site.register(Review)
