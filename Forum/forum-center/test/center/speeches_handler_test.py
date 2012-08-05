from __future__ import unicode_literals, print_function
from forum.center import persistence
from forum.center.presentation import SpeechesHandler
from tornado.web import Application
from test.center.base import RequestHandlerTestCase
import json


class SpeechesHandlerTest(RequestHandlerTestCase):

    def get_app(self):
        return Application([(r"/speeches", SpeechesHandler)])

    def test_fetching_all_speeches(self):
        persistence.save_speech("Good Session!")

        self.fetch_json("/speeches")

        self.failIf(self.response.error)
        result = json.loads(self.response.body)
        self.assertEqual(["Good Session!"], result)


