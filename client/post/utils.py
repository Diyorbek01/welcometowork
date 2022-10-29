import messages
from client.user.models import User
from freelancer.proposals.models import Notification
from pusher import send_message


def sender(post):
    text = f"{post.headline} {messages.data['post_workers']}"
    users = User.objects.filter(categories__in=[x.id for x in post.categories.all()])
    send_message([user.token for user in users.all()], messages.data['post_title'], text)
    send_message([post.user.token], messages.data['post_title'], messages.data['confirm_post'])
    notif = Notification.objects.create(
        post=post,
        title=messages.data['post_title'],
        body=messages.data['confirm_post'],
    )
    notif.user.add(post.user)
    notification = Notification.objects.create(
        post=post,
        title=messages.data['post_title'],
        body=text,
    )
    for user in users:
        notification.user.add(user)
        notification.save()
