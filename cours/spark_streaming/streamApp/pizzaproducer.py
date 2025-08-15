import random
from faker.providers import BaseProvider


class PizzaProvider(BaseProvider):
    def pizza_name(self):
        validPizzaNames = [
            {"pizzaName":"Margherita", "price":9},
            {"pizzaName":"Marinara", "price":8},
            {"pizzaName":"Diavola", "price": 11},
            {"pizzaName":"Mari & Monti", "price":12},
            {"pizzaName":"Salami", "price":12},
            {"pizzaName":"Pepperoni", "price":13},
            {"pizzaName":"Calzone", "price":10},
            {"pizzaName":"Salmone", "price":11},
            {"pizzaName":"Capri", "price":10}
        ]
        return validPizzaNames[random.randint(0, len(validPizzaNames) - 1)]

    def pizza_shop(self):
        pizza_shops = [
            "Marios Pizza",
            "Luigis Pizza",
            "Circular Pi Pizzeria",
            "Ill Make You a Pizza You Can" "t Refuse",
            "Mammamia Pizza",
            "Its-a me! Mario Pizza!",
            "Pizza Hut",
            "Dominos Pizza"
        ]
        return random.choice(pizza_shops)

