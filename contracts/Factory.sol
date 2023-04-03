// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/proxy/Clones.sol";
import "./Logic.sol";

contract Factory {
    address public tokenLogic;

    constructor() payable {
        tokenLogic = address(new Logic());
    }

    receive() external payable {}

    function createToken() external returns (address) {
        address root = Clones.clone(tokenLogic);
        Logic(payable(root)).initialize(0, tokenLogic, root);
        return root;
    }
    
}