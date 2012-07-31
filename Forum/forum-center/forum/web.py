from __future__ import unicode_literals, print_function, division
from tornado.httpserver import HTTPServer
from tornado.ioloop import IOLoop
from tornado.options import define, options
from tornado.web import Application
from forum.center.presentation import PresentationHandler

import re

define("port", default=8888, help="run on the given port", type=int)

_APPS_HOST_URL = 'localhost'

_handlers = [
    (r"/presentation", PresentationHandler),
]

def _extract_host(url):
    regex = re.compile('^(http(s)?://)?([^/:\s]+)(:\d+)?$', re.IGNORECASE)
    result = regex.match(url)
    return result.group(3)

def _create_tornado_app():
    application = Application(debug=True)
    registered_patterns = set()
    registered_handlers = {}
    
    def add_handlers(host_url, handlers):
        host = _extract_host(host_url)
        for handler in handlers:
            pattern = '%s/%s' % (host, handler[0])
            if pattern in registered_patterns:
                continue
            if not host in registered_handlers:
                registered_handlers[host] = []
            registered_handlers[host].append(handler)
            registered_patterns.add(pattern)

    def map_all_handlers():
        for host, handlers in registered_handlers.iteritems():
            application.add_handlers(host, _handlers)

    add_handlers(_APPS_HOST_URL, _handlers)
    map_all_handlers()
    
    return application

def main():
    print("starting web.py on port %s" % options.port)
    options.parse_command_line()
    application = _create_tornado_app()
    server = HTTPServer(application)
    server.listen(options.port)
    IOLoop.instance().start()

if __name__ == "__main__":
    main()
