from urllib import request

from apscheduler.schedulers.background import BackgroundScheduler

from .views import CronJob


def start():
    schedular = BackgroundScheduler()
    cron = CronJob()

    schedular.add_job(cron.get, "interval", days=1, kwargs={'request': request})

    schedular.start()