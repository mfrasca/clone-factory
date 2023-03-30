// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./Logic.sol";

contract Factory {
    address public tokenImplementation;
    address[] public clones;

    constructor() payable {
        tokenImplementation = address(new Logic());
    }

    receive() external payable {}

    function createToken() external returns (address) {
        address clone = Clones.clone(tokenImplementation);
        Logic(payable(clone)).initialize(0, tokenImplementation);
        clones.push(clone);
        return clone;
    }
    
}