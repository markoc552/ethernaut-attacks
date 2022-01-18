# Force

To solve this level we need to send some ether to given contract instance and increase it's balance.

We see that contract doesn't contain any code. To be precise it doesn't support any of the fallback functions.

Only way we can do this is to use contract's `selfdestruct()` function. Selfdestruction function is called when contract is no longer needed and we can clean EVM state from stale contracts. Function takes `address payable` as parameter. This address will be used as recepient for balance that our contract has. Transfering balance in this way bypasses fallback functions and recipient contract will receive money either way.

**Security takeaways**

We can't rely on contract's balance to be trusted source for `address(this).balance == 0` checks.Reason is that we can see that it can be easily manipulated. Best approach is to have our own evidention of balance inside contract's state using mapping.
