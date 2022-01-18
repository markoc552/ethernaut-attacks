# Fallout

To pass this level we need to claim ownership over the Fallout contract and reduce it's balance to zero.

Main thing that we can see when we examine the contract is that constructor has a typo. This is an issue which was resolved with new version of solidity. They introduced `constructor` keyword for defining constructors.

In this way `Fal1back()` is the same public function as any other that we can call easily.

After calling `attack()` we see that with `collectAllocations()` entire balance is transfered to our address.