# Generated by Django 4.1.5 on 2023-02-05 12:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0002_alter_longtermadmin_longtermadminid_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='longtermadmin',
            name='longtermadminId',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='member',
            name='memberId',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='review',
            name='reviewId',
            field=models.BigAutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='sidogungucode',
            name='siDoGunGuCd',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]