# Generated by Django 4.0.4 on 2022-08-22 11:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('post', '0010_alter_post_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='postimage',
            name='image',
            field=models.ImageField(null=True, upload_to='posts/'),
        ),
    ]
