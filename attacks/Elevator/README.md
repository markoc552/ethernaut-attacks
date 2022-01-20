# Elevator

To solve this level we need to go to the top of the building.

Let's take a look at the `goTo()` function inside given contract.

```
    function goTo(uint256 _floor) public {
        Building building = Building(msg.sender); (1)

        if (!building.isLastFloor(_floor)) {
            floor = _floor;
            top = building.isLastFloor(floor);
        }
    }
```

At (1) contract is using any contract that implements `Building` interface. In this way we can implement any logic inside that function and use it to attack following contract.

**Security takeaways**

We need to be careful to not leave interfaces not implemented. Also with right access modifiers this function could be safe to use. With `pure` modifier we would not be able to change our contract's state and keep track how many times function is called.
