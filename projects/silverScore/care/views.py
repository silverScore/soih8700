from django.shortcuts import render
from django.http import HttpResponse
#from .models import

# Create your views here.
def index(request):
    return HttpResponse("안녕하세요 SilverScore에 오신것을 환영합니다.")