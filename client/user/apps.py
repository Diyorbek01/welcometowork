from django.apps import AppConfig


class UserConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'client.user'

    def ready(self):
        print("Start schedular ...")
        from . import updater
        updater.start()
