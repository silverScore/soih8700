# Generated by Django 4.1.5 on 2023-02-05 12:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0003_alter_longtermadmin_longtermadminid_and_more'),
    ]

    operations = [
        migrations.RenameField(
            model_name='longtermadmin',
            old_name='longtermadminId',
            new_name='id',
        ),
        migrations.RenameField(
            model_name='member',
            old_name='memberId',
            new_name='id',
        ),
        migrations.RenameField(
            model_name='review',
            old_name='reviewId',
            new_name='id',
        ),
        migrations.RenameField(
            model_name='sidogungucode',
            old_name='siDoGunGuCd',
            new_name='id',
        ),
    ]
