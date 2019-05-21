from django import forms
from django.contrib.auth.models import User

from .models import Post, Comment, Person

class PostForm(forms.ModelForm):

	class Meta:
		model = Post
		fields = ('title', 'text', 'categories', )

class CommentForm(forms.ModelForm):

	class Meta:
		model = Comment
		fields = ('text',)

class RegisterForm(forms.ModelForm):

	class Meta:
		model = User
		fields = ('username', 'email', 'password',)

class PersonForm(forms.ModelForm):

	class Meta:
		model = Person
		fields = ('name', 'nationality', )

class LoginForm(forms.Form):
	username = forms.CharField()
	password = forms.CharField()