from django.urls import path
from .views import current_datetime, index

urlpatterns = [
    path("", index, name='index'),
    path('current_datetime/', current_datetime, name='current_datetime'),
]