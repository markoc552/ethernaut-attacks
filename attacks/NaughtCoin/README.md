# Naught coin

NaughtCoin is an ERC20 token and you're already holding all of them. The catch is that you'll only be able to transfer them after a 10 year lockout period. Can you figure out how to get them out to another address so that you can transfer them freely? Complete this level by getting your token balance to 0.

To solve this level we need to first call `approve()` function from `ERC20` interface. This function will aprove sending all minted tokens to given address. After that we only need to call `transferFrom()` with our address and balance will be transfered.

**Security takeaways**

Be careful when you are overriding existing contracts that are standards and are already really well tested.
