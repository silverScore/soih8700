# Generated by Django 4.1.6 on 2023-02-10 03:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('care', '0007_review'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='review',
            options={'ordering': ['-createDate']},
        ),
        migrations.AlterField(
            model_name='review',
            name='modifyDate',
            field=models.DateTimeField(auto_now=True, null=True),
        ),
    ]
