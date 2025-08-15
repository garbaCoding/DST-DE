import json


def produce_pizza_order():
    # message composition
    """message = {
        "pizzas": fake.pizza_name(),
        "topping_1": fake.pizza_topping(),
        "topping_2": fake.pizza_topping(),
        "topping_3": fake.pizza_topping()

    }"""
    toppings = [
        {
            "pizzas": "Margherita",
            "topping_1": "egg",
            "topping_2": "blue cheese",
            "topping_3": "onion",
        },
        {
            "pizzas": "Marinara",
            "topping_1": "green peppers",
            "topping_2": "pineapple",
            "topping_3": "onion",
        },
        {
            "pizzas": "Diavola",
            "topping_1": "olives",
            "topping_2": "tomato",
            "topping_3": "tuna",
        },
        {
            "pizzas": "Mari & Monti",
            "topping_1": "egg",
            "topping_2": "blue cheese",
            "topping_3": "onion",
        },
        {
            "pizzas": "Salami",
            "topping_1": "egg",
            "topping_2": "strawberry",
            "topping_3": "garlic",
        },
        {
            "pizzas": "Pepperoni",
            "topping_1": "egg",
            "topping_2": "hot pepper",
            "topping_3": "garlic",
        },
        {
            "pizzas": "Calzone",
            "topping_1": "blue cheese",
            "topping_2": "garlic",
            "topping_3": "onion",
        },
        {
            "pizzas": "Capri",
            "topping_1": "egg",
            "topping_2": "tuna",
            "topping_3": "pineapple",
        },
        {
            "pizzas": "Salmone",
            "topping_1": "blue cheese",
            "topping_2": "onion",
            "topping_3": "pineapple",
        },
    ]

    return toppings


with open(f"batch/batch.json", "w") as file:
    message = produce_pizza_order()
    file.write(json.dumps(message) + "\n")
