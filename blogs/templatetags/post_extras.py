from django import template

register = template.Library()

def post_list_body(value):
    """Removes all values of arg from the given string"""

    return value[:125] + ' ......'

register.filter('post_list_body', post_list_body)