from django.db.models.signals import post_save
from django.dispatch import receiver

import messages
from freelancer.proposals.models import Review, Notification
from pusher import send_message


@receiver(post_save, sender=Review)
def send_notification(sender, instance, created, **kwargs):
    print("aa")
    if created:
        print("aaaaa")
        notification = Notification.objects.create(
            user=instance.post.user,
            post=instance.post,
            review=instance,
            title=messages.data['review_title'],
            status="review",
            body=messages.data['review_title']
        )
        send_message([instance.post.user], messages.data['review_title'], messages.data['review_title'])
