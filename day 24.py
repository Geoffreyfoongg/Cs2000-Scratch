
print("hello world")

def tshirt_cost(message : str) -> float: 
    """calculates t-shirt cost"""
    return len(message) * 0.1

def test_tshirt_cost() -> None:
        assert tshirt_cost("hi") == 0.2
        assert tshirt_cost("hello") == 0.5
test_tshirt_cost()



def greet(name : str) -> str:
    """produces Hello, name!"""
    return "Hello, " + name + "!"
def test_greet() -> None:
    assert greet("Alice") == "Hello, Alice!"
    assert greet("Bob") == "Hello, Bob!"
test_greet()

def shipping_cost(weight :  int) -> int: 
    """if weight <= 1, cost is $5; if weight <= 5, cost is $10; otherwise, $20"""
    if weight <= 1:
        5
    elif weight <- 5:
            10
    else: 
        
def add_shipping(order_amt: float) -> float:
    """adds 4 for orders <= 10 (but non-zero), 8 for orders < 30, 12 for larger orders"""
    if order_amt == 0:
        return 0
    elif order_amt <= 10:
        return order_amt + 4
    elif order_amt < 30:
        return order_amt + 8
    else:
        return order_amt + 12
