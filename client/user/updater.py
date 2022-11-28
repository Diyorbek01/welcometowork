from urllib import request

from apscheduler.schedulers.background import BackgroundScheduler

from .views import CronJob
from ..post.views import CheckPost


def start():
    schedular = BackgroundScheduler()
    cron = CronJob()
    cron2 = CheckPost()

    schedular.add_job(cron.get, "interval", days=1, kwargs={'request': request})
    schedular.add_job(cron2.get, "interval", seconds=5, kwargs={'request': request})

    schedular.start()