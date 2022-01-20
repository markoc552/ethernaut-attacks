# Puzzle Wallet

To solve this level we need to withdraw all funds from wallet.

In order to solve this we need to first understand how proxies work. In that documentation you can see that proxies share the same storage slots via delegate call.

- Slot 0 - pendingAdmin/owner
- Slot 1 - admin/maxBalance
- Slot 2 - whitelisted
- Slot 3 - balances

So to solve this issue we just need to call `proposeNewAdmin()` with our address. This function will also put our address as the owner of the `PuzzleWallet` contract.
