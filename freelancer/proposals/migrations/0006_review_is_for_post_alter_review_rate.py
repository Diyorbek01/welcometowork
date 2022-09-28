# Generated by Django 4.0.4 on 2022-08-20 06:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('proposals', '0005_proposal_is_new'),
    ]

    operations = [
        migrations.AddField(
            model_name='review',
            name='is_for_post',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='review',
            name='rate',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
