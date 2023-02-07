from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone

from .models import Review, LongTermAdmin
from .forms import ReviewForm
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from django.contrib import messages

# Create your views here.

def review_index(request, longtermadmin_id):
    longtermadmin = get_object_or_404(LongTermAdmin, pk=longtermadmin_id)
    page = request.GET.get('page', 1)   # 페이지
#    review_list = Review.objects.order_by('-createDate')
    review_list = Review.objects.filter(longtermadmin_id=longtermadmin_id).order_by('-createDate')
    paginator = Paginator(review_list, 10)    # 페이지당 10개씩 보여주기
    page_obj = paginator.get_page(page)
    context = {'longtermadmin': longtermadmin, 'review_list': page_obj}
    return render(request, 'member/review_list.html', context)

def review_detail(request, review_id):
    review = get_object_or_404(Review, pk=review_id)
    context = {'review': review, 'longtermadmin': review.longtermadmin }
    return render(request, 'member/review_detail.html', context)
#    context = {'review': review}
#    return render(request, 'member/review_detail.html', context)

@login_required(login_url='common:login')
def review_create(request, longtermadmin_id):
    longtermadmin = get_object_or_404(LongTermAdmin, pk=longtermadmin_id)
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():     # 폼이 유효하다면
            review = form.save(commit=False)  # 임시저장하여 review 객체를 리턴받는다.
            review.user = request.user
            review.createDate = timezone.localtime()   # 실제 저장을 위해 작성일시를 설정한다.
            review.longtermadmin = longtermadmin
            review.save()     # 데이터를 실제로 저장한다.
            return redirect('member:review_index', longtermadmin_id=longtermadmin.id)
    else:
        form = ReviewForm()
    context = {'longtermadmin':longtermadmin, 'form': form}
    return render(request, 'member/review_form.html', context)

@login_required(login_url='common:login')
def review_modify(request, review_id):
    review = get_object_or_404(Review, pk=review_id)

    if request.user != review.user :
        messages.error(request, '수정권한이 없습니다')
        return redirect('member:review_detail', review_id=review.id)
    if request.method == "POST" :
        form = ReviewForm(request.POST, instance=review)
        if form.is_valid():
            review = form.save(commit=False)
            review.modifyDate = timezone.now()   # 수정일시 저장
            review.save()
            return redirect('member:review_detail', review_id=review.id)
    else:
        form = ReviewForm(instance=review)
    context = {'review': review, 'longtermadmin': review.longtermadmin, 'form': form}
#    context = {'review': review, 'form': form}
    return render(request, 'member/review_modify.html', context)

@login_required(login_url='common:login')
def review_delete(request, review_id):
    review = get_object_or_404(Review, pk=review_id)
    if request.user != review.user:
        messages.error(request, '삭제권한이 없습니다')
        return redirect('member:review_detail', review_id=review.id)
    review.delete()
    context = {'review': review, 'longtermadmin': review.longtermadmin, 'form': form}
    return render(request, 'member/review_list.html', context)
#    return redirect('member:review_index')
