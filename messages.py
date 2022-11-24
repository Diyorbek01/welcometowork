from decouple import config

data = {

    "post_title": "Post uchun xabar",
    "finish_post": "Post yakunlandi",
    "confirm_post": "Sizning postingiz qabul qilindi",
    "archived_post": "Sizning postingiz arxivga o'tkazildi",
    "post_workers": "ishi joylandi",

    "proposal_title": "Taklif uchun xabar",
    "create_proposal": "tomonidan taklif tushdi",
    "archived_proposal": "Sizning taklifingiz arxivga o'tkazildi",
    "confirm_proposal": "Sizning taklifingiz qabul qilindi",

    "bonus_title": "Bonus uchun xabar",
    "bonus_message": f"Sizning hisobingizga {config('BONUS_PRICE')} so'm bonus sifatida taqdim etildi.",

    "review_title": "Izoh uchun xabar",
    "review_message": "Siz haqingizda izoh qoldirildi",

    "timer_title": "Timer uchun xabar",
    "timer_message": "Ishchi ishni yakunladi"

}
