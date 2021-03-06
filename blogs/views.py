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
    analytics = Analytics.objects.select_related('post')
    data = analytics.aggregate(
#                       total post
                        Count('post'),
#                       visitor
                        Sum('num_visited'), Min('num_visited'), 
                        Max('num_visited'), Variance('num_visited'), Avg('num_visited'),
#                       Like
                        Sum('like'), Min('like'), 
                        Max('like'), Variance('like'), Avg('like'),
#                       DisLike
                        Sum('dislike'), Min('dislike'), 
                        Max('dislike'), Variance('dislike'), Avg('dislike'),
#                       Comments
                        Sum('num_comment'), Min('num_comment'), 
                        Max('num_comment'), Variance('num_comment'), Avg('num_comment'))

    total = data.values()

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
            analytics = Analytics.objects.get(post=post)
            analytics.num_comment = analytics.num_comment + 1
            analytics.save()
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