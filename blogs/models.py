from django.db import models
from django.conf import settings
from django.utils import timezone
from django.contrib.auth.models import AnonymousUser

# Create your models here.
class Post(models.Model):
	author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
	title = models.CharField(max_length=200)
	text = models.TextField()
	list_categories = (
		('G', 'Game'),
		('F', 'Film'),
		('M', 'Music'),
		('P', 'Politics'),
	)
	categories = models.CharField(max_length=1, choices=list_categories)
	created_date = models.DateTimeField(default=timezone.now)
	published_date = models.DateTimeField(blank=True, null=True)

	def publish(self):
		self.published_date = timezone.now()
		self.save()

	def __str__(self):
		return self.title

class Comment(models.Model):
	author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
	post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="comments",)
	text = models.TextField()
	created_date = models.DateTimeField(default=timezone.now)
	published_date = models.DateTimeField(blank=True, null=True)

	def publish(self):
		self.published_date = timezone.now()
		self.save()

	def __str__(self):
		return self.text

class Analytics(models.Model):
	members = (
		('U', 'User'),
		('A', 'Admin'),
		('G', 'Guest'),
	)
	post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name="analytics",)
	who_visit = models.CharField(max_length=1, choices=members)
	last_updated = models.DateTimeField(default=timezone.now)
	time_visited = models.FloatField(default=0)
	updated = models.IntegerField(default=0)
	last_visited =  models.DateTimeField(default=timezone.now)

	like = models.IntegerField(default=0)
	dislike = models.IntegerField(default=0)
	num_comment =  models.IntegerField(default=0)
	num_visited = models.IntegerField(default=0)

class Nationality(models.Model):
	name = models.CharField(max_length=50)

	def __str__(self):
		return self.name

class Person(models.Model):
	name = models.CharField(max_length=50)
	nationality = models.ForeignKey(Nationality, on_delete=models.CASCADE)

	def __str__(self):
		return self.name