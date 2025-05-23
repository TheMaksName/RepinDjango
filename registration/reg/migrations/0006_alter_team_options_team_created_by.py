# Generated by Django 5.2 on 2025-04-13 08:00

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reg', '0005_team_remove_participant_team_name_participant_team'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='team',
            options={'ordering': ['name']},
        ),
        migrations.AddField(
            model_name='team',
            name='created_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='created_teams', to='reg.participant'),
        ),
    ]
