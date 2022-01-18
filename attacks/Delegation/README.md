# Delegation

To solve this level we were required to claim ownership on given contract instance.

What we need to do is first understand fallback functions and low-level calls. We passed through fallback functions at level `Fallback` so we won't go throught them right now. The topic we will concentrate is low-level functions.

Low level functions provide us way to interact with other contracts on level where type checking, function existance checking, and argument packing is bypassed.

There are three of them:

- call - supports additional tx parameters to be passed along with the call such as gas and value. Returns boolean status of the tx execution and return data.
- delegateCall - also supports additional tx parameters but in this case only gas is supported. Executes given transaction as it is inside same context of the calling contract. To be precise balance, storage and all state variables that are used within function are calling contract's only code is used from recipient contract.
- staticCall - supports same tx parameters as delegateCall only difference between two of them is that static call will revert if function tries to modifiy state.
  Modification of state includes:
  - Changing state variables
  - Emitting events
  - Sending ether to other accounts..

Calling `attack()` function it will execute `pwn()` like it is defined inside Delegation contract and easily change ownership, which we can see on following screenshot.

**Security takeaway**

DelegateCalls can be really handy for eg. libraries. But also in combination with fallback functions can be really dangerous. It is better to explicitly specify function which is execute delegateCall if it is needed.
