# Generated by Django 4.1.5 on 2023-02-04 06:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('care', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Member',
            fields=[
                ('memberId', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=20)),
                ('passwd', models.CharField(max_length=15)),
                ('phone', models.CharField(max_length=13)),
                ('email', models.EmailField(max_length=254)),
                ('registerDate', models.DateTimeField()),
            ],
        ),
        migrations.CreateModel(
            name='Review',
            fields=[
                ('reviewId', models.SmallIntegerField(primary_key=True, serialize=False)),
                ('amKind', models.SmallIntegerField(default=0)),
                ('faClean', models.SmallIntegerField(default=0)),
                ('content', models.CharField(blank=True, max_length=500)),
                ('createDate', models.DateField()),
                ('modifyDate', models.DateField(blank=True, null=True)),
                ('memberId', models.SmallIntegerField()),
                ('longTermAdminSym', models.CharField(max_length=11)),
                ('adminPttnCd', models.CharField(max_length=3)),
                ('longtermadmin', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='care.longtermadmin')),
                ('member', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='member.member')),
            ],
        ),
        migrations.AddIndex(
            model_name='review',
            index=models.Index(fields=['memberId'], name='FK_Member_Review'),
        ),
        migrations.AddIndex(
            model_name='review',
            index=models.Index(fields=['longTermAdminSym', 'adminPttnCd'], name='FK_LongTermAdmin_Review'),
        ),
        migrations.AlterUniqueTogether(
            name='review',
            unique_together={('longTermAdminSym', 'adminPttnCd')},
        ),
    ]
