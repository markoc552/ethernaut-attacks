# Telephone

To pass this level we need to claim ownership over the Telephone contract.

Main thing that we can see when we examine the contract is that `tx.origin` is used to owner verification.

There is a difference between `msg.sender` and `tx.origin`:

- tx.origin - gets initial creator of the tx that was published to blockchain.
- msg.sender - gets sender of the message. Example: it can be another contract (A -> B -> C)

To hack this contract another contract just needs to be created which will be B in this case from graph above.
With this approach tx.origin will be mine account from which I create initial tx calling `attack()` function,
msg.sender will be address of the `TelephoneAttack` contract.
