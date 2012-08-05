from __future__ import unicode_literals, print_function
from redis.client import Redis
from tornado.httpclient import AsyncHTTPClient
from tornado.httpserver import HTTPServer
from tornado.ioloop import IOLoop
from unittest2.case import TestCase
from forum.center import persistence
from tornado.web import Application


class RequestHandlerTestCase(TestCase):
    PORT = 8888

    http_server = None
    response = None

    def setUp(self):
        application = self.get_app()
        self.http_server = HTTPServer(application)
        self.http_server.listen(self.PORT)
        persistence.redis = Redis("localhost", db=1)
        persistence.redis.flushdb()

    def tearDown(self):
        self.http_server.stop()

    def handle_request(self, response):
        self.response = response
        IOLoop.instance().stop()

    def fetch_json(self, path, **kwargs):
        self._add_header(kwargs, 'Content-Type', 'application/json')
        self._add_header(kwargs, 'Accept', 'application/json')

        http_client = AsyncHTTPClient()
        http_client.fetch('http://localhost:%s%s' % (self.PORT, path), self.handle_request)
        IOLoop.instance().start()

    def get_app(self):
        print("super");
        return Application([])

    def _add_header(self, kwargs, key, param):
        headers = kwargs['headers'] if kwargs.has_key('headers') else {}
        already_exists = False
        for header in headers.iterkeys():
            if header.lower() == key.lower():
                already_exists = True
                break

        if not already_exists:
            headers[key.lower()] = param
            kwargs['headers'] = headers

        return kwargs
