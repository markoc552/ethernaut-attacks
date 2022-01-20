# Privacy

To solve this level we need to find out what is the correct key. 

Thing we can take a look at the start is that contract creator put all state variables private. 

What he didn't know is that everything that goes on blockchain can be seen by everyone. `Private` modifier is just to restrict other contract of interacting with those functions and variables (there are some exceptions regarding useage of private functions).

Try to remember how we solved `Vault` level. This is pretty much the same way. We can use `web3.getStorageAt()` function to retrieve this information. All we need to do is find out on what slot inside storage data is located.

Starting from beggining of contract code we see that bool (slot 0) is specified. After that we have uint256 that is located on slot 1. Flattening, denomination and awkardness are stored at slot 2. This means that our on slot 5. This will return us bytes32 data. But in contract bytes16 is used, we need to cut off 16bytes (first 32 hex characters). With this we will unlock given contract.

**Security takeaways**

If you want to secure your data on blockchain only way is to encrypt it before publishing to network.
