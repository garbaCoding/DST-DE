import redis

if __name__ == "__main__":
    r = redis.Redis(host='127.0.0.1', port=6379, decode_responses=True, health_check_interval=30)
    print(r.ping())