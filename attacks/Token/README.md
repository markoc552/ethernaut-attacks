# Token

To pass this level we need to gain a lot of token from the contract.

In the beggining we are given 20 tokens to start with and we will beat the level if we somehow manage to get our hands on any additional tokens. Preferably a very large amount of tokens.

To solve this level all we need to do is send 21 token to some random address. When we do this next will happen.
Our attack contract will call `transfer()` function of the victim contract.

In that function we have following code snippet:

```
    require(balances[msg.sender] - _value >= 0); (1)
    balances[msg.sender] -= _value; (2)
    balances[_to] += _value; (3)
```

At (1) we will pass require check because we have 20 tokens associated with our address. When (2) start to execute arithmetic overflow will be encountered because there is `checked` block which will just return false if overflow/underflow happens. Because we don't have that our balance will become 255 (21 - 20 = 255). Size of the uint is 256.

**Note:** After 0.8.0 version overflow and underflows will be reverted by default so we dont' need to use OpenZeppelin's SafeMath library.
