# King

The contract King represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process.

The level is going to reclaim kingship. We will beat the level if we can avoid such a self proclamation.

```
    receive() external payable {
      require(msg.value >= prize || msg.sender == owner);(1)
      king.transfer(msg.value); (2)
      king = payable(msg.sender); (3)
      prize = msg.value; (4)
    }
```

We need to prevent (3) operation from execution. Thing that is needed in attack contract is to exclude any fallback function that can receive money.

**Security takeaways**

Use transfer function only when certain that recipient address is externally owned address or contract address that has some of the fallback functions. 

Better way is to use low-level `call()` function that returns us boolean that represents status of the tx execution. If false is returned `revert()` can be used to abort tx and revert all state changes inside current tx.
