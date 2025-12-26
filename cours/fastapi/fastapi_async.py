from fastapi import FastAPI
import time
import asyncio

api = FastAPI()


def wait_sync():
    time.sleep(10)
    return True


async def wait_async():
    await asyncio.sleep(10)
    return True


@api.get('/sync')
def get_sync():
    wait_sync()
    return {
        'message': 'synchronous'
    }


@api.get('/async')
async def get_async():
    await wait_async()()
    return {
        'message': 'asynchronous'
    }