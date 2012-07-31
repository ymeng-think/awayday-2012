from __future__ import unicode_literals, print_function, division
from tornado.web import RequestHandler

class PresentationHandler(RequestHandler):
    def get(self, *args, **kwargs):
        print("abc")