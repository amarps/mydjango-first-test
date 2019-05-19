from django.urls import path
from . import views
from  django.contrib.auth.decorators import login_required

# public route
urlpatterns = [
	path('', views.post_list, name='post_list'),
	path('<int:pk>/', views.post_detail, name='post_detail'),
	path('logout_view', views.logout_view, name='logout_view'),
	path('register_user', views.register_user, name='register_user'),
	path('login_user', views.login_user, name='login_user'),
	path('review', views.review, name='review'),
	path('data', views.data, name='data'),
]

# required login user
urlpatterns.extend([

	path('<int:pk>/delete', login_required(views.post_delete), name='post_delete'),
	path('new/', login_required(views.post_new), name='post_new'),
	path('<int:pk>/edit/', login_required(views.post_edit), name='post_edit'),

	])

# required login superuser
urlpatterns.extend([

	path('<int:pk>/delete', login_required(views.post_delete), name='post_delete'),

	])
