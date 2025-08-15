import random
import time
import json
from faker import Faker
from pizzaproducer import PizzaProvider

from time import gmtime, strftime

fake = Faker()
fake.add_provider(PizzaProvider)


def produce_pizza_order(orderid=1):
    # message composition
    message = {
        "id": orderid,
        "order_time": strftime("%Y-%m-%d %H:%M:%S", gmtime()),
        "shop": fake.pizza_shop(),
        "name": fake.unique.name(),
        "phoneNumber": fake.unique.phone_number(),
        "address": fake.address(),
        "pizzas": fake.pizza_name(),
    }
    return message


for j in range(400):
    with open(f"files/orders_{j}.json", "w") as file:
        for i in range(random.randint(2, 10)):
            message = produce_pizza_order(i)
            file.write(json.dumps(message) + "\n")

        time.sleep(3)

