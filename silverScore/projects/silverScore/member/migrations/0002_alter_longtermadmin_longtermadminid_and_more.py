# Generated by Django 4.1.5 on 2023-02-05 12:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('member', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='longtermadmin',
            name='longtermadminId',
            field=models.IntegerField(auto_created=True, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='member',
            name='memberId',
            field=models.IntegerField(auto_created=True, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='review',
            name='reviewId',
            field=models.SmallIntegerField(auto_created=True, primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='sidogungucode',
            name='siDoGunGuCd',
            field=models.IntegerField(auto_created=True, primary_key=True, serialize=False),
        ),
    ]