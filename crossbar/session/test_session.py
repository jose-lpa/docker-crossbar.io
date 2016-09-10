import sys

from autobahn.twisted.wamp import ApplicationSession
from twisted.internet.defer import inlineCallbacks


class TestSession(ApplicationSession):
    @inlineCallbacks
    def onJoin(self, details):
        print('Python version: {}'.format(sys.version))
        print('Test session ready.')

        def add_something(x, y, offset=0):
            print('Add was called')
            return x + y + offset

        try:
            yield self.register(add_something, 'test.add')
            print("'test.add' procedure registered")
        except Exception as e:
            print("Couldn't register procedure 'test.add': {0}".format(e))

        def throw_exception():
            print('Exception Thrown')
            raise Exception('Exception Thrown')

        try:
            yield self.register(throw_exception, 'test.exception')
            print("'test.exception' procedure registered")
        except Exception as e:
            print("Couldn't register procedure 'test.exception': {0}".format(e))

        def subscribe_something(x, y, event=None, **kwargs):
            print('Publish was called with event %s' % event)

        try:
            yield self.subscribe(subscribe_something, u'test.publish')
            print("Subscribed to topic 'subscribe_something'")
        except Exception as e:
            print("Couldn't subscribe to topic 'test.publish': {0}".format(e))
