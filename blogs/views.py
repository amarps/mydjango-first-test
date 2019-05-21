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
from django.core.paginator import Paginator
from django.db.models import Avg, Max, Min, Sum, Count, Variance

from .models import Post, Comment, Analytics, Person, Nationality
from .forms import PostForm, CommentForm, RegisterForm, LoginForm, PersonForm

CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)

# Create your views here.
def data(request):
    return HttpResponse("{'posts':posts}")

def related(request):
    person = Person.objects.select_related('nationality')
    return render(request, 'blogs/related.html', {'person':person})

def analytics_page(request, category=''):
    analytics = Analytics.objects.all()
    total_blogs = analytics.aggregate(total = Count('post'))['total']
    total_visitor = analytics.aggregate(total = Sum('num_visited'))['total']
    min_visitor = analytics.aggregate(total = Min('num_visited'))['total']
    max_visitor = analytics.aggregate(total = Max('num_visited'))['total']
    variance_visitor = analytics.aggregate(total = Variance('num_visited'))['total']
    average_visitor = analytics.aggregate(total = Avg('num_visited'))['total']

    total_like = analytics.aggregate(total = Sum('like'))['total']
    min_like = analytics.aggregate(total = Min('like'))['total']
    max_like = analytics.aggregate(total = Max('like'))['total']
    variance_like = analytics.aggregate(total = Variance('like'))['total']
    average_like = analytics.aggregate(total = Avg('like'))['total']

    total_dislike = analytics.aggregate(total = Sum('dislike'))['total']
    min_dislike = analytics.aggregate(total = Min('dislike'))['total']
    max_dislike = analytics.aggregate(total = Max('dislike'))['total']
    variance_dislike = analytics.aggregate(total = Variance('dislike'))['total']
    average_dislike = analytics.aggregate(total = Avg('dislike'))['total']

    total_comment = analytics.aggregate(total = Sum('num_comment'))['total']
    min_comment = analytics.aggregate(total = Min('num_comment'))['total']
    max_comment = analytics.aggregate(total = Max('num_comment'))['total']
    variance_comment = analytics.aggregate(total = Variance('num_comment'))['total']
    average_comment = analytics.aggregate(total = Avg('num_comment'))['total']

    total = [
            total_blogs,
            total_visitor, min_visitor, max_visitor, variance_visitor, average_visitor, 
            total_like, min_like, max_like, variance_like,  average_like,
            total_dislike, min_dislike, max_dislike, variance_dislike, average_dislike, 
            total_comment, min_comment, max_comment, variance_comment, average_comment, 
            ]

    return render(request, 'blogs/analytics_page.html', {'analytics':analytics, 'total':total})

def post_list(request, category=''):
    # c = cache.get('posts')
    # if c == None:
    #     data = Post.objects.filter(published_date__lte=timezone.now()).order_by('-published_date')
    #     if data != None:
    #         cache.set('posts', data, CACHE_TTL)
    #         posts = cache.get('posts')
    #     else:
    #         posts = c
    # else:
    #     posts = c
    posts = Post.objects.select_related('author').filter(published_date__lte=timezone.now(),
             categories__contains=category).order_by('-published_date').annotate(Count('categories'))
    paginator = Paginator(posts, 3)
    page = request.GET.get('page')
    post = paginator.get_page(page)
    return render(request, 'blogs/post.html', {'posts':post, 'rpost':posts})

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
    analytics = Analytics.objects.get(post=post)
    analytics.num_visited = analytics.num_visited + 1
    analytics.time_visited = analytics.time_visited + 75
    analytics.last_visited = timezone.now()
    analytics.save()

    return render(request, 'blogs/post.html', {'analytics': analytics, 'post': post, 'form': form, 'comments': comments, })


# @cache_page(CACHE_TTL)
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        analytics = Analytics()
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            analytics.post = post
            analytics.last_updated = timezone.now()
            analytics.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blogs/post.html', {'form': form})

def likedis(request, choice, pk):
    post = Post.objects.get(pk=pk)
    analytics = Analytics.objects.get(post=post)
    if choice == 'l':
        analytics.like = analytics.like + 1
    else:
        analytics.dislike = analytics.dislike + 1

    analytics.save()
    return redirect('post_detail', pk=post.pk)

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
    
def register_user(request):
    if request.method == "POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            username = request.POST['username']
            password = request.POST['password']
            email = request.POST['email']
            is_staf = "t"
            user = User.objects.create_user(username, email, password)
            user.save()
            return redirect('post_list')
    else:
        form = RegisterForm()
    return render(request, 'blogs/loginRegister.html', {'form': form})

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