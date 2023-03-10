from django import forms
from member.models import Review

class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review #사용할 모델
        fields = ['amKind', 'faClean', 'content'] #QuestionForm에서 사용할 Question 모델의 속성
        # widgets = {
        #     'subject': forms.TextInput(attrs={'class': 'form-control'}),
        #     'content': forms.Textarea(attrs={'class': 'form-control', 'rows':10}),
        # }
        labels = {
            'amKind': '분위기/친절도',
            'faClean': '시설/청결도',
            'content': '내용',
        }
