# Generated by Django 2.1.2 on 2019-01-07 08:01

from django.db import migrations, models
import {{ project_name }}.users.models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='user',
            managers=[
                ('objects', {{ project_name }}.users.models.CustomUserManager()),
            ],
        ),
        migrations.AlterField(
            model_name='user',
            name='last_name',
            field=models.CharField(blank=True, max_length=150, verbose_name='last name'),
        ),
    ]
