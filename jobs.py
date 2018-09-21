from apscheduler.schedulers.blocking import BlockingScheduler
from app import setup

sched = BlockingScheduler()

@sched.scheduled_job('cron', day_of_week='mon-sun', hour='0-2', minute='0-59/30', timezone='America/Los_Angeles')
def update_a():
  setup()

sched.start()