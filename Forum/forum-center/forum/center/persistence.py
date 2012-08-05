from __future__ import unicode_literals, print_function, division
from redis import Redis

REDIS_KEY_SPEECH = "speeches"

redis = Redis("localhost", db=0)

def save_speech(speech):
    redis.lpush(REDIS_KEY_SPEECH, speech)

def list_all_speeches():
    return redis.lrange(REDIS_KEY_SPEECH, 0, -1)