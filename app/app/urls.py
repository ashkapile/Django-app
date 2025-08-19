from django.http import HttpResponse
from django.urls import path

def home(request):
    return HttpResponse("Hello from Dockerized Django!")

urlpatterns = [
    path('', home),
]