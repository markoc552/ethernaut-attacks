# Fallback

To pass this level we need to claim ownership over the Fallback contract and reduce it's balance to zero.

First thing that we can see when we examine the contract is that inside one of the fallback functions there is a logic to transfer ownership.

For reference Solidity has two types of fallbacks:
   - receive - called when contract recieves funds if it exists
   - fallback - called when function that is specified in the call doesn't exist or we can also add payable modifier and use it as receive function.

To solve this level it is just needed to write function that will call `contribute()` function which will transfer ownership to that tx sender.

I am using Remix IDE for testing. After I deploy both contracts and call `attack()` function the ownership is transfered and balance is sent to mine account.