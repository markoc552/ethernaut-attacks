# Vault

To solve this level we need to guess password and unlock vault.

This level requires knowledge of contract's storage and how it is organized. Every contract has a storage that contains slots. Every slot can store data up to 32 bytes. In this example two variables are stored in storage (`locked` and `password`).

Other thing to keep in mind is that everything is publicly visibile on blockchain. Private modifier just ensures that other contracts can't call or access our variables or methods. To read contract's storage we can use web3's `getStorageAt()` function.
Function takes contract address, index of the slot that we are accessing and callback function to be called upon.

**Where password is stored inside storage?**

As said earlier every slot can take up to 32 bytes. Going from the top of contract first `boolean check` is stored. Every boolean takes one byte. This means that password can't fit inside that slot so Solidity puts it inside slot with index 1.

When calling following function we can easily retrieve password:

```
web3.eth.getStorageAt(contractAddress, 1, console.log);
```
