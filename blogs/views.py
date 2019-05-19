from django.shortcuts import render, redirect
from django.contrib.auth import logout, authenticate, login
from django.utils import timezone
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.models import User
from django.contrib.auth.decorators import user_passes_test
from django.http import HttpResponse
from django.core.cache.backends.base import DEFAULT_TIMEOUT
from django.views.decorators.cache import cache_page
from django.conf import settings
from django.core.cache import cache

from .models import Post, Comment
from .forms import PostForm, CommentForm, RegisterForm, LoginForm

CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)

# Create your views here.
@cache_page(CACHE_TTL)
def index(request):
    return render(request, 'blogs/index.html')

def data(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return HttpResponse({'posts':posts})

def review(request):
    return render(request, 'blogs/review.html')

def post_list(request):
    c = cache.get('posts')
    if c == None:
        data = Post.objects.filter(published_date__lte=timezone.now()).order_by('-published_date')
        cache.set('posts', data, CACHE_TTL)
        posts = cache.get('posts')
    else:
        posts = c

    return render(request, 'blogs/post.html', {'posts':posts})

def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    comments = Comment.objects.filter(published_date__lte=timezone.now(),
                                    post=post).order_by('-published_date')
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.post = post
            comment.author = request.user
            comment.published_date = timezone.now()
            comment.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = CommentForm()
    return render(request, 'blogs/post.html', {'post': post, 'form': form, 'comments': comments, })


@cache_page(CACHE_TTL)
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blogs/post.html', {'form': form})

def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blogs/post.html', {'form': form})

@user_passes_test(lambda u: u.is_superuser)
def post_delete(request, pk):
    post = get_object_or_404(Post, pk=pk)
    post.delete()
    return redirect('post_list')

def logout_view(request):
    logout(request)
    return redirect('post_list')
    
@cache_page(CACHE_TTL)
def register_user(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            username = request.POST['username']
            password = request.POST['password']
            email = request.POST['email']

            user = User.objects.create_user(username, email, password)
            user.save()
            return redirect('post_list')
    else:
        form = RegisterForm()
    return render(request, 'blogs/loginRegister.html', {'form': form})

@cache_page(CACHE_TTL)
def login_user(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        username = request.POST['username']
        password = request.POST['password']
        if form.is_valid():
            user = authenticate(request, username=username, password=password)
            print(user)
            if user is not None:
                login(request, user)
                return redirect('post_list')
    else:
        form = LoginForm()
    return render(request, 'blogs/loginRegister.html', {'form': form})