from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone

from .models import Review
from .forms import ReviewForm
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from django.contrib import messages

# Create your views here.

def index(request):
    review_list = Review.objects.order_by('-createDate')
    context = {'review_list': review_list}
    return render(request, 'member/review_list.html', context)

def detail(request, review_id):
    review = get_object_or_404(Review, pk=review_id)
    context = {'review': review}
    return render(request, 'member/review_detail.html', context)

#@login_required(login_url='common:login')
def review_create(request):
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():     # 폼이 유효하다면
            review = form.save(commit=False)  # 임시저장하여 question객체를 리턴받는다.
            review.member = request.user  # author 속성에 로그인 계정 저장
            review.create_date = timezone.localtime()   # 실제 저장을 위해 작성일시를 설정한다.
            review.save()     # 데이터를 실제로 저장한다.
            return redirect('member:index')
    else:
        form = ReviewForm()
    context = {'form': form}
    return render(request, 'member/review_form.html', context)
