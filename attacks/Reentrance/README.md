# Reentrance

To solve this level it is required from us to steal all funds from the given contract.

First we need to take a look at the `withdraw()` function code snippet:

```
    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] >= _amount) { (1)
        (bool result, ) = msg.sender.call{value: _amount}(""); (2)
            if (result) {
                _amount;
            }
            balances[msg.sender] -= _amount;
        }
    }
```

At (1) contract first checks that our account has associated funds on the given contract. After that at (2) transfer funds is initialized with low-level call. This will trigger `receive()` fallback function on our contract in which we need to inject maliceous code. Only thing we need to do is call `withdraw()` function again with same argument. Following action will again start (2) in given contract instance and so on until contract is left without funds.

**Security takeaways**

When using low level calls we need to be careful which contract we interact with because that code can also trigger it's own code that can in return change the state of the calling contract.

Best way to be secure is to either be careful about contracts that have been used or you can use Reentrancy feature from OpenZepplin.
Feature will lock all contract's functions that have specified modifier.

One thing to keep in mind when working with other contracts transfering funds is to use Check-Interact-Attack pattern.