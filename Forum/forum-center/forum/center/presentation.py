from __future__ import unicode_literals, print_function, division
from tornado.web import RequestHandler
from forum.center.persistence import save_speech, list_all_speeches
import json


class SpeechesHandler(RequestHandler):
    def get(self, *args, **kwargs):
        all_speeches = list_all_speeches()
        self.write(json.dumps(all_speeches))


class SpeechHandler(RequestHandler):
    def post(self, *args, **kwargs):
        save_speech("abc")