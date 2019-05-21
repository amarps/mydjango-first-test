from django.urls import path
from . import views
from  django.contrib.auth.decorators import login_required

# public route
urlpatterns = [
	path('', views.post_list, name='post_list'),
	path('related', views.related, name='related'),
	path('category/<str:category>', views.post_list, name='post_list_c'),
	path('<int:pk>/', views.post_detail, name='post_detail'),
	path('<int:pk>/<str:choice>', views.likedis, name='likedis'),
	path('logout_view', views.logout_view, name='logout_view'),
	path('register_user', views.register_user, name='register_user'),
	path('login_user', views.login_user, name='login_user'),
	path('data', views.data, name='data'),
	path('analytics', views.analytics_page, name='analytics'),
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
