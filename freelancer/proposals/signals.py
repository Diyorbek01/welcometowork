from django.db.models.signals import post_save
from django.dispatch import receiver

import messages
from freelancer.proposals.models import Review, Notification
from pusher import send_message


@receiver(post_save, sender=Review)
def send_notification(sender, instance, created, **kwargs):
    if created:
        notification = Notification.objects.create(
            post=instance.post,
            review=instance,
            title=messages.data['review_title'],
            status="review",
            body=messages.data['review_message']
        )
        notification.user.add(instance.post.user)
        notification.save()
        user = instance.user.token
        if instance.is_client == False:
            user = instance.post.user.token
        send_message([user], messages.data['review_title'], messages.data['review_message'])
