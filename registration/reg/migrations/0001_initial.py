# Generated by Django 5.2 on 2025-04-09 19:32

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('nickname', models.CharField(max_length=50)),
                ('reg_status', models.BooleanField()),
            ],
            options={
                'db_table': 'user',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Admin',
            fields=[
                ('user_id', models.AutoField(primary_key=True, serialize=False)),
                ('nickname', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'admin',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='CategoryTheme',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=150)),
            ],
            options={
                'db_table': 'category_theme',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Material',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.TextField()),
                ('link', models.CharField(max_length=150)),
            ],
            options={
                'db_table': 'material',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('text', models.TextField(blank=True, null=True)),
                ('image', models.CharField(blank=True, max_length=150, null=True)),
                ('date', models.DateTimeField()),
            ],
            options={
                'db_table': 'news',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='ActiveUser',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='reg.user')),
                ('name', models.CharField(max_length=150)),
                ('school', models.CharField(max_length=100)),
                ('phone_number', models.CharField(max_length=15)),
                ('mail', models.CharField(max_length=100)),
                ('name_mentor', models.CharField(max_length=150)),
                ('post_mentor', models.CharField(blank=True, max_length=100, null=True)),
                ('theme', models.CharField(blank=True, max_length=150, null=True)),
            ],
            options={
                'db_table': 'active_user',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Theme',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=150)),
                ('technique', models.CharField(max_length=50)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='reg.categorytheme')),
            ],
            options={
                'db_table': 'theme',
                'managed': True,
            },
        ),
    ]
