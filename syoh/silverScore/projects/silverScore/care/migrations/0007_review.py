# Generated by Django 4.1.6 on 2023-02-10 02:38

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('care', '0006_alter_care_options'),
    ]

    operations = [
        migrations.CreateModel(
            name='Review',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('amKind', models.SmallIntegerField(default=0)),
                ('faClean', models.SmallIntegerField(default=0)),
                ('content', models.CharField(blank=True, max_length=1500)),
                ('createDate', models.DateTimeField()),
                ('modifyDate', models.DateTimeField(blank=True, null=True)),
                ('longTermAdminCd', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='care.care')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
