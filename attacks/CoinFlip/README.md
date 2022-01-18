# CoinFlip

Task is that we need to correctly guess in 10 consecutive times.

To solve this level we need to understand that we cannot use blockchain parameters like blockhash, blocknumber to be certain that value can't be predicted. Also keep in mind that every contract code that is deployed is visible to anyone. Private modifier just restrict other contracts of calling private functions and values.

We can see that I copied some parts of the `CoinFlip` contract and used it to get value contract wants.