from django.apps import AppConfig


class ProposalsConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'freelancer.proposals'

    def ready(self):
        from freelancer.proposals import signals