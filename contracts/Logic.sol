// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Logic {
    uint256 state;
    constructor() payable {}
    function raise() external {
        if(state<5) state++;
    }
    function lower() external {
        if(state>0) state--;
    }
}